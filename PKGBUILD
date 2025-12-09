# Maintainer: spapadim <spapadim at gmail dot com>

_pluginname=obs-draw
pkgname=$_pluginname
pkgver=0.3.1
pkgrel=1
pkgdesc="The Draw plugin for OBS Studio allows you to draw on your stream output in a dock."
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/draw.2081/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake")
options=('debug')
source=("$_pluginname-$pkgver.tar.gz"::"https://github.com/exeldro/$_pluginname/archive/refs/tags/$pkgver.tar.gz"
        "qtprivate.patch")
sha256sums=("f36447129a12bc374778af4c7cc5479c53871eae8bc6dfc98b3a676348641fd0"
            "9f04e9ef23bac1e57148985a81497dc6252075cceea9b119aa9a1a491358d88d")

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../qtprivate.patch
}

build() {
  cmake -B build -S "$_pluginname-$pkgver" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build  build
}

package() {
 DESTDIR="$pkgdir" cmake --install build
}
 
