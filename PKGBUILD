# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=kdekorte
pkgname=basika
pkgver=0.99.6
pkgrel=1
pkgdesc="BASIC Interpreter"

arch=('x86_64')
license=('Unlincense')
url="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")

makedepends=('gcc' 'pkgconf' 'make' 'sdl3' 'sdl3_ttf' 'sdl3_mixer' 'sdl3_image')
depends=('glibc' 'sdl3' 'sdl3_ttf' 'sdl3_mixer' 'sdl3_image')

options=('!lto')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('87f6c6b9cc975efbd9a56613336e35684b515bf570b28192ee3b06ad1ce9fe10')


prepare() {
	cd "${pkgname}-${pkgver}" || exit

	sed -e '1i #include <stdint.h>' -i "src/interpreter.c"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	make
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	BASIKA_SKIP_PERFORMANCE=1 make test
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	make DESTDIR="${pkgdir}" install PREFIX="/usr"

	install -dm755 "${pkgdir}/usr/share/${pkgname}/demo/"
	cp -rf demo/* "${pkgdir}/usr/share/${pkgname}/demo/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "KEYWORDS.md" "${pkgdir}/usr/share/doc/${pkgname}/KEYWORDS.md"
	install -Dm644 "ERROR_CODES.md" "${pkgdir}/usr/share/doc/${pkgname}/ERROR_CODES.md"
}
