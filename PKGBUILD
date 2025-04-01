# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=steganogram
_pkgname=stegano-rs
_appname=${_pkgname%-rs}
pkgname=${_pkgname%-rs}-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A CLI tool for steganography. Supports hiding data in PNG and WAV format via LSB Encoding."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'b685ba5b60e2d0505b7a4974349ae2b44330f3d88de10b499bc8ad6e549b0dd4'
            '05bbf2d49abe5e72b28ffce945e7c49e887960076fc9b3dda5c962a3040f1e93')
sha256sums_x86_64=('389d9382f93d1c76df46bf6d6065dce9a7bd1302f115b40f641c13dd73e19d9c')
sha256sums_aarch64=('f934637ebfd7c4d6dc79b2ac5e128206ba127aec14a77e60b632d94c3abf565b')


build() {
	cd "${srcdir}/" || exit

	help2man "./${_appname}" --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "CHANGELOG-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_appname}.1.gz"
}
