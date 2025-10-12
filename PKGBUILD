_pkgname=extra-cmake-modules
pkgname=mingw-w64-$_pkgname
pkgver=6.19.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake (mingw-w64)'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(mingw-w64-cmake)
makedepends=(ninja)
options=(staticlibs !strip !buildflags)
groups=(mingw-w64-kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('a4f0c1d8181f43e9af4b9b44696c77760b5bc9dae5bdb921f090bce664e9ca84'
            'SKIP')

validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

options=(!buildflags staticlibs !strip !emptydirs)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -G Ninja -B build-$_arch -S $_pkgname-$pkgver \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_HTML_DOCS=ON \
      -DBUILD_QTHELP_DOCS=ON
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" VERBOSE=1 cmake --install build-$_arch
  done
}
