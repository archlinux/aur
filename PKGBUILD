# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openvr
pkgver=1.5.17
pkgrel=1
pkgdesc="API and runtime that allows access to VR hardware"
arch=('x86_64')
url="https://www.steamvr.com/en/"
license=('BSD')
depends=('glibc' 'glew' 'libgl' 'sdl2')
makedepends=('cmake' 'qt5-base')
options=('staticlibs')
source=("https://github.com/ValveSoftware/openvr/archive/v$pkgver.tar.gz"
        "remove-openvrpaths-check.diff::https://aur.archlinux.org/cgit/aur.git/plain/remove-openvrpaths-check.diff?h=openvr-git")
sha256sums=('1b502a1f04d918fcbb26534444260632e6883d81e1f895906857f9aafba3c56d'
            'SKIP')


prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/remove-openvrpaths-check.diff"
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
