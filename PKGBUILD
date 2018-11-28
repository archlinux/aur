# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>

pkgname=mingw-w64-spdlog-git
pkgver=1.3.0.r2057.486b693
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('any')
url='https://github.com/gabime/spdlog/'
license=('MIT')
makedepends=('git' 'mingw-w64-cmake')
source=("${pkgname%-git}::git://github.com/gabime/spdlog.git")
sha512sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  echo "$(grep 'project(' CMakeLists.txt | cut -d ' ' -f3 | cut -d ')' -f1).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export LDFLAGS=""
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DSPDLOG_BUILD_TESTING=OFF -DSPDLOG_BUILD_BENCH=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname%-git}/build-${_arch}"
    make DESTDIR="${pkgdir}" install 
    #${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    #${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" ${pkgdir}/usr/share/licenses/spdlog/LICENSE
  done
}
