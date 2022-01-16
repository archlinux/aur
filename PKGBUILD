# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=filmulator
_pkgname="$pkgname-gui"
pkgver=0.11.1
pkgrel=2
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Simple raw photo editor based on the process of developing film"
url="https://filmulator.org/"
_url="https://github.com/CarVac/filmulator-gui"
license=('GPL3')
depends=('exiv2' 'hicolor-icon-theme' 'lensfun-git' 'libarchive' 'libraw' 'librtprocess' 'qt5-quickcontrols2')
makedepends=('cmake' 'openmp')
options=('!buildflags')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha512sums=('27026fac7c61691e48f589febedb9335fb841280c811d47e866128515a121fbc5a6784983057ce00a3b946d5355e11d146fee9c1d4d0f10c18be49cb288a4e97')
_xdg_desktop_name="org.$pkgname.${pkgname^}"

prepare() {
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build

  sed -i "/Exec=/ s|=.*|=/usr/bin/$pkgname| ; /Icon=/ s|=.*|=$_xdg_desktop_name|" \
          $_pkgname-$pkgver/$_pkgname/$_pkgname.desktop.in
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
