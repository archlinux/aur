# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openvr
pkgver=1.10.30
pkgrel=1
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
sha256sums=('ebe6c74424090972c47d354774668a3afb23e292e23bfada9c1ddeb4795c59a3'
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

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    "../"
  make
  cd ..

  cd "samples"
  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    "../"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/openvr"

  cd "samples"
  install -Dm555 "bin/linux64/libopenvr_api.so" "$pkgdir/usr/lib"
}
