# Maintainer: xpufx <github@xpufx.com>
pkgname=paseo-cli-git
pkgver=0.7.2.r39.gae80ec425
pkgrel=2
pkgdesc='Command-line interface for controlling Paseo AI coding agents (git - built from main)'
arch=('x86_64' 'aarch64')
url='https://github.com/getpaseo/paseo/tree/main/packages/cli'
license=('Apache-2.0')
depends=('nodejs>=22' 'bash' 'glibc' 'gcc-libs')
makedepends=('git' 'npm')
provides=('paseo' 'paseo-cli' 'paseo-cli-git')
conflicts=('paseo' 'paseo-bin' 'paseo-cli' 'paseo-cli-bun' 'paseo-cli-beta' 'paseo-cli-edge')
source=('paseo::git+https://github.com/getpaseo/paseo.git#branch=main')
sha256sums=('SKIP')
options=('!strip')

pkgver() {
	cd "$srcdir/paseo"
	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "0.7.2.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "$srcdir/paseo"
	npm ci
	npm run build:server
}

package() {
	# Like paseo-cli-edge: npm install --omit=dev the local built CLI into /usr/lib/paseo-cli-git
	# This is exactly what the -bin package does, but from source instead of registry tgz.
	# First pack the built CLI (after build:server it is publishable)
	cd "$srcdir/paseo/packages/cli"
	npm pack --silent
	_tgz=$(ls -t *.tgz | head -n1)
	npm install \
		--omit=dev \
		--no-audit \
		--no-fund \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr/lib/${pkgname}" \
		"${srcdir}/paseo/packages/cli/${_tgz}"

	rm -f "${pkgdir}/usr/lib/${pkgname}/package.json" \
		"${pkgdir}/usr/lib/${pkgname}/package-lock.json"
	grep -rlZ '^#!.*node' "${pkgdir}/usr/lib/${pkgname}/node_modules" 2>/dev/null \
		| xargs -0 -r sed -i '1{/^#!/d}' || true
	find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type f -perm /111 -exec chmod 644 {} + 2>/dev/null || true

	case "${CARCH}" in
		x86_64) _esbuild_arch=linux-x64 ;;
		aarch64) _esbuild_arch=linux-arm64 ;;
	esac
	chmod 755 "${pkgdir}/usr/lib/${pkgname}/node_modules/@esbuild/${_esbuild_arch}/bin/esbuild" 2>/dev/null || true

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/paseo" <<WRAPPER
#!/bin/sh
exec /usr/bin/node /usr/lib/${pkgname}/node_modules/@getpaseo/cli/bin/paseo "\$@"
WRAPPER

	rm -rf "${pkgdir}/usr/lib/${pkgname}/etc" "${pkgdir}/usr/etc" 2>/dev/null || true

	case "${CARCH}" in
		x86_64) _node_pty_prebuild=linux-x64 ;;
		aarch64) _node_pty_prebuild=linux-arm64 ;;
	esac
	while IFS= read -r -d '' _pty_prebuilds; do
		find "$_pty_prebuilds" -mindepth 1 -maxdepth 1 -type d ! -name "${_node_pty_prebuild}" -exec rm -rf {} +
	done < <(find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -path '*/node-pty/prebuilds' -print0 2>/dev/null || true)

	chmod -R go-w "${pkgdir}/usr" 2>/dev/null || true
	find "${pkgdir}/usr" -type d -exec chmod 755 {} + 2>/dev/null || true
	chown -R root:root "${pkgdir}" 2>/dev/null || true

	install -Dm644 "$srcdir/paseo/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
