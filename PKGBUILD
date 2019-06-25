pkgname=mingw-w64-extra-cmake-modules
pkgver=5.59.0
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
sha256sums=('1a630b242242ac32d20d14e7ae5645aa28a47676eae0e62ed76af8bc1f56c438'
            'SKIP'
            '30bdcedab402c69ea0db3460f5a23cbd226a5cd1e12b13926b8a65df773e14a0'
            '7e44cf56a8274c8166eaf02e60c2d34e5048992a7e3c8309b998b762a394e909')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd extra-cmake-modules-$pkgver

  sed -e 's|/usr/bin/env python|/usr/bin/env python2|' -i find-modules/*.py
  patch -p1 -i "${srcdir}"/set-AUTOSTATICPLUGINS.patch
  patch -p1 -i "$srcdir"/05aa27dc0e14dab407379a4d22f895e9eff13cc0.patch
}

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
