# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=filmulator
_pkgname="$pkgname-gui"
pkgver=0.9.0
pkgrel=2
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Simple raw photo editor based on the process of developing film"
url="https://filmulator.org/"
_url="https://github.com/CarVac/filmulator-gui"
license=('GPL3')
depends=('exiv2' 'hicolor-icon-theme' 'lensfun-git' 'libarchive' 'libraw' 'librtprocess' 'qt5-declarative')
makedepends=('cmake' 'openmp')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha512sums=('1148d613f558ae6a43f5478ebd7a035401462544607955a55a6d0472d56ea70eb36019d4de56a2f405cc88fdc6e146c243f8bde7b50c98e0c255e8ea03e085d1')
_xdg_desktop_name="org.$pkgname.${pkgname^}"

prepare() {
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build

  sed -i "s|Exec.*$|Exec=/usr/bin/$pkgname|" \
          $_pkgname-$pkgver/$_pkgname/filmulator-gui.desktop.in

  sed -i "s|Icon=$_pkgname|Icon=$_xdg_desktop_name|" \
          $_pkgname-$pkgver/$_pkgname/filmulator-gui.desktop.in
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ../$_pkgname-$pkgver/$_pkgname
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install


  install -Dm644 "$srcdir/$_pkgname-$pkgver/$_pkgname/$_pkgname.desktop.in" \
                 "$pkgdir/usr/share/applications/$_xdg_desktop_name.desktop"

  install -Dm644 "$srcdir/$_pkgname-$pkgver/$_pkgname/resources/${pkgname}64icon.png" \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_xdg_desktop_name.png"
}
