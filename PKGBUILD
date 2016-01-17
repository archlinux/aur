# Original contributor: Karro <karolina.lindqvist@kramnet.se>

pkgname=libcd
pkgver=5.9
pkgrel=1
pkgdesc="Platform-independent graphics library"
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/cd/"
depends=('ftgl' 'libim' 'pdflib-lite' 'gtk2' 'libxmu' 'pangox-compat')
makedepends=('lua')
license=('custom')
options=('staticlibs')

source=(
  "http://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/cd-${pkgver}_Sources.tar.gz"
  "http://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/cd-${pkgver}_Docs.pdf"
  LICENSE
  cdpdf.mak.patch
  cdluaim5.patch
)
md5sums=('9a959d91c2165e382b552ecbebc9669d'
         '11dfb228d3da8498ccd72a5da56ef6fa'
         '3b326faf9f9ab35096453525b55bd8c8'
         'eec4463334ef927ed6c4ccb81086c6df'
         'ed8a4b981b24f38d82efd8aa5b3dea87')


prepare() {
    cd "$srcdir"/cd
    patch -p0 < "$srcdir"/cdluaim5.patch
    cd "$srcdir"/cd/src
    patch -uN cdpdf.mak "$srcdir"/cdpdf.mak.patch
}

build() {
  cd "$srcdir"/cd
  make || true
}

package() {
  cd "$srcdir"/cd
  install -m755 -d "$pkgdir"/usr/lib
  install -m644 lib/L*/*.{a,so} "$pkgdir"/usr/lib
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  install -m644 "$srcdir"/cd-${pkgver}_Docs.pdf "$pkgdir"/usr/share/$pkgname
  install -m755 -d "$pkgdir"/usr/include/cd
  install -m644 "$srcdir"/cd/include/* "$pkgdir"/usr/include/cd
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
