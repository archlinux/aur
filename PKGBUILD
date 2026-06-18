# Maintainer: RiverOnVenus <aur@zhui.dev>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
_pkgname=delance-runtime
pkgname=delance-langserver
pkgver=2026.2.104
pkgrel=1
pkgdesc="A spear to the Python language server built with black magic"
arch=('x86_64')
url="https://sr.ht/~self/delance/"
license=('0BSD')
depends=(glibc nodejs)
optdepends=(
    'python: Pylance Python language features'
    'python-pytest: pytest option discovery'
    'python-numpy: NumPy type stubs support'
)
makedepends=(deno npm)
source=("${_pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~self/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fb790283acd99f6df54fe0f24cc1752bae2cdb57767cac3bcb2e9e2137b9f60f')
provides=("${pkgname}=${pkgver}")

build() {
	cd "$_pkgname-v$pkgver"

	# Bundle JS with esbuild (uses deno to resolve JSR deps)
	deno run --allow-all build.mts

	# Install @zip.js/zip.js (the only external dep needed by install.mjs)
	cd out
	npm install --omit=dev

	# Download Pylance extension from VS Code Marketplace
	node install.mjs
}

package() {
	cd "$_pkgname-v$pkgver/out"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	# Copy Pylance dist contents flat into /usr/share/<pkg>/
	cp -r "dist/v${pkgver}-"*/ "${pkgdir}/usr/share/${pkgname}"
	cd "${pkgdir}/usr/share/${pkgname}"

	# Strip non-x86_64 platform binaries (bundled Pylance ships all platforms)
	rm -rf bundled/bin/{darwin-arm64,linux-arm64,win32-arm64,win32-x64} 2>/dev/null || true

	rm -f browser.*.LICENSE.txt

	local _licenses=(*.LICENSE.txt)
	if [[ -f "${_licenses[0]}" ]]; then
		install -Dm644 "${_licenses[@]}" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
		rm "${_licenses[@]}"
	fi

	# Create launcher wrapper
	install -dm755 "${pkgdir}/usr/bin/"
	install -Dm755 /dev/stdin "${pkgdir}/usr/share/${pkgname}/langserver.cjs" <<"EOF"
#!/usr/bin/node

require('./server.bundle.js');
EOF

	ln -s "../share/${pkgname}/langserver.cjs" "${pkgdir}/usr/bin/${pkgname}"
}
