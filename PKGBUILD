# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
_pkgname=delance-runtime
pkgname=delance-langserver
# If patch >= 100, update _pkgver only
_pkgver="2025.8.2"
pkgver="2025.8.2"
pkgrel=1
pkgdesc="A spear to the Python language server built with black magic"
arch=(any)
url="https://sr.ht/~self/delance/"
license=('0BSD')
depends=(nodejs)
makedepends=(npm jq)
source=("https://git.sr.ht/~self/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('12b694b9050ea1d4fcb9b7c986767446fff41b509bd6de36b8c060c03b6a789b')

build() {
	cd "$_pkgname-v$_pkgver"

	npm install --cache "${srcdir}/npm-cache"
}

package() {
	cd "$_pkgname-v$_pkgver"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	cp -r "dist/v${_pkgver}-"*/ "${pkgdir}/usr/share/${pkgname}"
	cd "${pkgdir}/usr/share/${pkgname}"

	rm browser.*.LICENSE.txt

	local _licenses=(*.LICENSE.txt)
	install -Dm644 "${_licenses[@]}" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	rm "${_licenses[@]}"

	install -dm755 "${pkgdir}/usr/bin/"
	install -Dm755 /dev/stdin "${pkgdir}/usr/share/${pkgname}/langserver.cjs" <<"EOF"
#!/usr/bin/node

require('./server.bundle.js');
EOF

	ln -s "/usr/share/${pkgname}/langserver.cjs" "${pkgdir}/usr/bin/${pkgname}"
}

pkgver() {
	cd "$_pkgname-v$_pkgver"

	jq '
		def v: split(".") | map(tonumber);
		.version | v as $pkgver |
		(if $pkgver[-1] >= 100 then
			[$ARGS.positional[0] | v | last, "r" + ($pkgver[-1] | tostring)]
		else
			[$pkgver[-1]]
		end) as $patch |
		$pkgver[0:-1] + $patch | join(".")
	' package.json --args ${pkgver%.r*}
}
