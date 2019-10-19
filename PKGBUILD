# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openvr
pkgver=1.7.15
pkgrel=1
pkgdesc="API and runtime that allows access to VR hardware"
arch=('x86_64')
url="https://www.steamvr.com/en/"
license=('BSD')
depends=('glibc' 'glew' 'libgl' 'sdl2')
makedepends=('cmake' 'qt5-base')
options=('staticlibs')
source=("https://github.com/ValveSoftware/openvr/archive/v$pkgver.tar.gz"
        "0001-openvr_capi-Add-pragma-pack-around-VRControllerState.patch::https://aur.archlinux.org/cgit/aur.git/plain/0001-openvr_capi-Add-pragma-pack-around-VRControllerState.patch?h=openvr-git"
        "0002-samples-cmake-Remove-OpenVR-paths-check.patch::https://aur.archlinux.org/cgit/aur.git/plain/0002-samples-cmake-Remove-OpenVR-paths-check.patch?h=openvr-git"
        "0003-samples-compat-Use-correct-definition-for-vsprintf_s.patch::https://aur.archlinux.org/cgit/aur.git/plain/0003-samples-compat-Use-correct-definition-for-vsprintf_s.patch?h=openvr-git")
sha256sums=('ad5cba9bbd4235801ecce7e03f76f4a7d9b18343cc280c96905493eafcc00cc8'
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
  # disabled temporary in 1.7.15, see: https://github.com/ValveSoftware/openvr/issues/1208
  #make
}

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/openvr"

  cd "samples"
  install -Dm555 "bin/linux64/libopenvr_api.so" "$pkgdir/usr/lib"
}
