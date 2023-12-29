# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=appimageupdate-git
pkgver=2.0.0.alpha.1.20230526.r1.gd89e6bf
pkgrel=1
pkgdesc="Graphical front end to manage AppImage applications built using MauiKit"
arch=(x86_64)
url="https://github.com/AppImageCommunity/AppImageUpdate"
license=(MIT)
depends=(glibc gcc-libs cpr gpgme libgcrypt zsync2)
makedepends=(git cmake argagg nlohmann-json libxpm cairo librsvg libappimage)
provides=(appimageupdate)
conflicts=(appimageupdate)
options=(staticlibs)
source=("git+https://github.com/AppImageCommunity/AppImageUpdate.git")
sha256sums=('SKIP')

pkgver() {
  cd AppImageUpdate
  git describe --long --tags --exclude latest --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd AppImageUpdate
  [[ -d build ]] || mkdir build
}

build() {
  cd AppImageUpdate/build
  cmake .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_CPR=ON \
    -DUSE_SYSTEM_ZSYNC2=ON \
    -DUSE_SYSTEM_LIBAPPIMAGE=ON

  make libappimageupdate
}

package() {
  cd AppImageUpdate/build
  make DESTDIR="${pkgdir}/" install
  install -D ../LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
