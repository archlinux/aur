pkgname=pixilang-doc
pkgver=3.8.6f
pkgrel=1
pkgdesc="Oficial Pixilang Programmin Language documentation in man-style"
arch=('any')
depends=('man-db')
makedepends=('curl' 'pandoc' 'poppler')
source=("pixilang.7.pdf::https://warmplace.ru/soft/pixilang/Pixilang%20User%20Manual.pdf")
sha256sums=('8417cf883c01200adfba818365a78e084c7460e694553c136295d1e90ead7608')
license=('unknown')
pkgver() {
	curl -sL https://warmplace.ru/soft/pixilang/ | html2text | grep -m 1 -oE "[0-9][.][0-9][.][0-9][a-z]?"
}

makedepends=('pandoc' 'poppler')

prepare() {
  pdftohtml -noframes -s "${srcdir}/pixilang.7.pdf" "${srcdir}/manual_temp"

}

build() {
  pandoc "${srcdir}/manual_temp.html" -s -f html -t man \
    --wrap=preserve \
    --strip-comments \
    -M title="PIXILANG" \
    -M section="7" \
    -M date="$(date +%Y-%m-%d)" \
    -M header="Справочник Pixilang" \
    -M footer="Pixilang Project" \
    -o "${srcdir}/pixilang.7"

  rm -f ${srcdir}/manual_temp*


}


# Функция установки готового man в систему
package() {
  install -Dm644 "${srcdir}/pixilang.7" "${pkgdir}/usr/share/man/man7/pixilang.7"
}
