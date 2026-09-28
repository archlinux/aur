# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=filmulator
_pkgname="$pkgname-gui"
pkgver=0.12.0
pkgrel=1
arch=('x86_64')
pkgdesc="Simple raw photo editor based on the process of developing film"
url="https://filmulator.org/"
_url="https://github.com/CarVac/filmulator-gui"
license=('GPL-3.0-or-later')
depends=('exiv2' 'hicolor-icon-theme' 'lensfun' 'libarchive' 'libraw' 'librtprocess' 'qt5-quickcontrols2')
makedepends=('curl-cmake' 'lcms2-cmake' 'libraw-cmake' 'openmp')
options=('!buildflags')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz")
b2sums=('e5f39baca780f2df09dfd9b7f7f8574db0d5cb0e8054c0ae6d51dc5b10fd921e9101749f4476eb37d34d5ac7080293d7a0f2aed61cae5f30aeb32a3057c81fb7')
_xdg_desktop_name="org.$pkgname.${pkgname^}"

prepare() {
  sed -i "/Exec=/ s|=.*|=/usr/bin/$pkgname| ; /Icon=/ s|=.*|=$_xdg_desktop_name|" \
          $_pkgname-$pkgver/$_pkgname/$_pkgname.desktop.in
}

build() {
  cmake $_pkgname-$pkgver \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibraw_DIR=/usr/lib/cmake \
        -DLCMS2_DIR=/usr/lib/cmake
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$_pkgname-$pkgver/$_pkgname/$_pkgname.desktop.in" \
                 "$pkgdir/usr/share/applications/$_xdg_desktop_name.desktop"

  install -Dm644 "$srcdir/$_pkgname-$pkgver/$_pkgname/resources/${pkgname}64icon.png" \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_xdg_desktop_name.png"
}
