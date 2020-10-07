# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openvr
pkgver=1.14.15
pkgrel=2
pkgdesc="API and runtime that allows access to VR hardware"
arch=('x86_64')
url="https://www.steamvr.com/en/"
license=('BSD')
depends=('glibc' 'glew' 'libgl' 'sdl2')
makedepends=('cmake' 'qt5-base')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ValveSoftware/openvr/archive/v$pkgver.tar.gz"
        "0001-openvr_capi-Add-pragma-pack-around-VRControllerState.patch::https://aur.archlinux.org/cgit/aur.git/plain/0001-openvr_capi-Add-pragma-pack-around-VRControllerState.patch?h=openvr-git"
        "0002-samples-cmake-Remove-OpenVR-paths-check.patch::https://aur.archlinux.org/cgit/aur.git/plain/0002-samples-cmake-Remove-OpenVR-paths-check.patch?h=openvr-git"
        "0003-samples-compat-Use-correct-definition-for-vsprintf_s.patch::https://aur.archlinux.org/cgit/aur.git/plain/0003-samples-compat-Use-correct-definition-for-vsprintf_s.patch?h=openvr-git")
sha256sums=('40644e569f057e86c733d818a22d821c640307e5058d95958414422134d79584'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-openvr_capi-Add-pragma-pack-around-VRControllerState.patch"
  patch -Np1 -i "$srcdir/0002-samples-cmake-Remove-OpenVR-paths-check.patch"
  patch -Np1 -i "$srcdir/0003-samples-compat-Use-correct-definition-for-vsprintf_s.patch"
}

build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"

  cd "samples"
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm555 "samples/bin/linux64/libopenvr_api.so" -t "$pkgdir/usr/lib"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/openvr"
}
