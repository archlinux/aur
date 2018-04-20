# Maintainer: Jesse Juhani Jaara <jesse@Euler>

pkgname=mingw-w64-ki18n
_basever=5.45
pkgver=${_basever}.0
pkgrel=1
pkgdesc="Advanced internationalization framework (mingw-w64)"
arch=('any')
url="https://cgit.kde.org/ki18n.git"
license=('LGPL')
depends=('mingw-w64-qt5-script' 'mingw-w64-qt5-declarative')
makedepends=("mingw-w64-extra-cmake-modules>=${_basever}" 'python')
optdepends=('python: To compile Transcript property maps from text to binary format.')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/ki18n-${pkgver}.tar.xz")
sha256sums=('b70e62cd355b02c6160b69b210fd7f4bd44fb341e013db8dc81c744332e55cf6')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/ki18n-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS

    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
                   -DLIB_INSTALL_DIR=lib \
                   -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                   -DBUILD_TESTING=OFF \
                   ..
    make
    popd

    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
                   -DLIB_INSTALL_DIR=lib \
                   -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                   -DBUILD_TESTING=OFF \
                   ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/ki18n-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    
    cd "${srcdir}/ki18n-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
