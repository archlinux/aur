# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
pkgname=photivo-hg
pkgver=1124+.41a1d55bb275+
pkgrel=1
pkgdesc="Free and open source photo processor"
arch=('i686' 'x86_64')
url="http://photivo.org/"
license=('GPL3')
depends=('exiv2' 'qt5-base' 'lcms2' 'fftw' 'graphicsmagick' 'lensfun' 'liblqr' 'shared-mime-info' 'libraw')
optdepends=('gimp: Gimp plugins' 'python2: Gimp to Photivo plugin')
makedepends=('mercurial' 'gimp')
provides=('photivo')
conflicts=('photivo')
source=('hg+https://bitbucket.org/Photivo/photivo')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/photivo"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/photivo"

  # avoid installing shortcuts to the home
  sed '/INSTALLS\s*+=\s*shortcut2/ d' -i photivo.pro
}

build() {
  cd "$srcdir/photivo"

  qmake-qt5 PREFIX=/usr CONFIG-=debug CONFIG+=WithGimp
  make
}

package() {
  cd "$srcdir/photivo"

  make INSTALL_ROOT="$pkgdir" install
  rm -rf "$pkgdir"/home

  # GIMP integration
  install -D -m755 ptGimp "$pkgdir/usr/lib/gimp/2.0/plug-ins/ptGimp"
  install -D -m755 "mm extern photivo.py" "$pkgdir/usr/lib/gimp/2.0/plug-ins/mm-extern-photivo.py"
}
