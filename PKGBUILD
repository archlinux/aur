pkgname=mingw-w64-extra-cmake-modules
pkgver=5.102.0
pkgrel=1
arch=(any)
pkgdesc="Extra modules and scripts for CMake (mingw-w64)"
groups=(mingw-w64-kf5)
license=("LGPL")
depends=(mingw-w64-cmake)
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/extra-cmake-modules-${pkgver}.tar.xz"{,.sig}
"set-AUTOSTATICPLUGINS.patch"
"05aa27dc0e14dab407379a4d22f895e9eff13cc0.patch")
sha256sums=('f259aeb5a8e046ee2a0e658645f3af6d3e42145d3ae576f305b2b6e24a297f9b'
            'SKIP'
            '30bdcedab402c69ea0db3460f5a23cbd226a5cd1e12b13926b8a65df773e14a0'
            '7e44cf56a8274c8166eaf02e60c2d34e5048992a7e3c8309b998b762a394e909')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd extra-cmake-modules-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DBUILD_HTML_DOCS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done
}
