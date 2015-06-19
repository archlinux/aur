# Original contributor: Karro <karolina.lindqvist@kramnet.se>
#
# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/pkgbuilds

pkgname=libcd
pkgver=5.8.2
pkgrel=2
pkgdesc="Platform-independent graphics library"
arch=(i686 x86_64)
url="http://www.tecgraf.puc-rio.br/cd/"
depends=(ftgl libim pdflib-lite gtk2 libxmu pangox-compat)
makedepends=(lua)
license=('custom')
options=(staticlibs)

source=(
  "http://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/cd-${pkgver}_Sources.tar.gz"
  "http://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/cd-${pkgver}_Docs.pdf"
  LICENSE
  cdpdf.mak.patch
  cdluaim5.patch
)

md5sums=(
  '0e78ee6eedfde1acca6cc5351ba4bb1d'
  '906e59f55fc48e3f4cd3c40582aea150'
  '3b326faf9f9ab35096453525b55bd8c8'
  'eec4463334ef927ed6c4ccb81086c6df'
  'ed8a4b981b24f38d82efd8aa5b3dea87'
)

prepare() {
    cd $srcdir/cd
    patch -p0 <../../cdluaim5.patch || return 1
    cd $srcdir/cd/src
    patch -uN cdpdf.mak ../../cdpdf.mak.patch
}

build() {
  cd $srcdir/cd
  make -C src cd cdpdf cdgl cdlua5 cdluapdf5 cdluagl5 cdluaim5 || return 1
}

package() {
  install -m755 -d $pkgdir/usr/lib
  install -m644 $srcdir/cd/lib/Linux*/* $pkgdir/usr/lib
  install -m755 -d $pkgdir/usr/share/$pkgname
  install -m644 $srcdir/cd-${pkgver}_Docs.pdf $pkgdir/usr/share/$pkgname
  install -m755 -d $pkgdir/usr/include/cd
  install -m644 $srcdir/cd/include/* $pkgdir/usr/include/cd
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
