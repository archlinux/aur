# Maintainer: xpufx <github@xpufx.com>
pkgname=paseo-cli-git
pkgver=0.7.2.r35.g78b285059
pkgrel=1
pkgdesc='Command-line interface for controlling Paseo AI coding agents (git - built from main)'
arch=('x86_64' 'aarch64')
url='https://github.com/getpaseo/paseo'
license=('Apache-2.0')
depends=('nodejs>=22' 'bash' 'glibc' 'gcc-libs')
makedepends=('git' 'npm')
provides=('paseo' 'paseo-cli')
conflicts=('paseo' 'paseo-bin' 'paseo-cli' 'paseo-cli-bun' 'paseo-cli-beta' 'paseo-cli-edge')
source=('paseo::git+https://github.com/getpaseo/paseo.git#branch=main')
sha256sums=('SKIP')
options=('!strip')

pkgver() {
	cd "$srcdir/paseo"
	# git describe --long gives v0.7.2-10-g92442e7 -> 0.7.2.r10.g92442e7
	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "0.7.2.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "$srcdir/paseo"
	# Monorepo: need to build server deps first (protocol, client, highlight, etc.)
	npm ci
	npm run build:server
}

package() {
	cd "$srcdir/paseo"

	local install_dir="${pkgdir}/usr/lib/${pkgname}"
	mkdir -p "${install_dir}"

	# Copy built monorepo artifacts needed at runtime
	# Keep it minimal: package.json + built packages + node_modules
	cp -r package.json packages "${install_dir}/" 2>/dev/null || true
	# Use npm pack logic? Instead just copy the built CLI + its runtime deps
	# Reuse the same install prefix approach as -edge but from built source
	# We will run npm install --omit=dev in the install dir to get production deps
	# But we already have node_modules from build, so copy and prune
	cp -r node_modules "${install_dir}/" 2>/dev/null || true

	# Prune dev deps and fix perms like -edge does
	grep -rlZ '^#!.*node' "${install_dir}/node_modules" 2>/dev/null | xargs -0 -r sed -i '1{/^#!/d}' || true
	find "${install_dir}/node_modules" -type f -perm /111 -exec chmod 644 {} + 2>/dev/null || true

	case "${CARCH}" in
		x86_64) _esbuild_arch=linux-x64 ;;
		aarch64) _esbuild_arch=linux-arm64 ;;
	esac
	chmod 755 "${install_dir}/node_modules/@esbuild/${_esbuild_arch}/bin/esbuild" 2>/dev/null || true

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/paseo" <<WRAPPER
#!/bin/sh
exec /usr/bin/node /usr/lib/${pkgname}/packages/cli/bin/paseo "\$@"
WRAPPER

	rm -rf "${install_dir}/etc" "${pkgdir}/usr/etc" 2>/dev/null || true

	case "${CARCH}" in
		x86_64) _node_pty_prebuild=linux-x64 ;;
		aarch64) _node_pty_prebuild=linux-arm64 ;;
	esac
	while IFS= read -r -d '' _pty_prebuilds; do
		find "$_pty_prebuilds" -mindepth 1 -maxdepth 1 -type d ! -name "${_node_pty_prebuild}" -exec rm -rf {} +
	done < <(find "${install_dir}/node_modules" -type d -path '*/node-pty/prebuilds' -print0 2>/dev/null || true)

	# Prune musl prebuilds — Arch is glibc, musl ELFs will fail ldd (libc.musl-*.so.1)
	# and are never loaded at runtime (Node picks -gnu). Saves ~300MB.
	find "${install_dir}" -type d -name "*musl*" -prune -exec rm -rf {} + 2>/dev/null || true
	find "${install_dir}" -type f -name "*musl*" -delete 2>/dev/null || true

	chmod -R go-w "${pkgdir}/usr" 2>/dev/null || true
	find "${pkgdir}/usr" -type d -exec chmod 755 {} + 2>/dev/null || true
	chown -R root:root "${pkgdir}" 2>/dev/null || true

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
