# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>

pkgname=mingw-w64-spdlog-git
pkgver=1.8.1.r11.geebb921c
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('any')
url='https://github.com/gabime/spdlog/'
license=('MIT')
makedepends=('git' 'mingw-w64-cmake' 'mingw-w64-fmt')
provides=('mingw-w64-spdlog')
source=("${pkgname%-git}::git://github.com/gabime/spdlog.git")
sha512sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export LDFLAGS=""
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
        -DSPDLOG_BUILD_BENCH=OFF \
        -DSPDLOG_FMT_EXTERNAL=ON \
        -DSPDLOG_BUILD_SHARED=ON \
        -DSPDLOG_BUILD_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=None \
        -Wno-dev \
        ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname%-git}/build-${_arch}"
    make DESTDIR="${pkgdir}" install 
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  done
}
