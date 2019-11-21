# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

_reponame=rapidjson
pkgname=mingw-w64-$_reponame
pkgver=1.1.0
pkgrel=1
pkgdesc='A fast JSON parser/generator for C++ with both SAX/DOM style API (mingw-w64)'
arch=('any')
url='https://github.com/miloyip/rapidjson'
license=('MIT')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
source=($_reponame-$pkgver.tar.gz::https://github.com/miloyip/$_reponame/archive/v$pkgver.tar.gz)
md5sums=('badd12c511e081fec6c89c43a7027bce')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build () {
  cd "$_reponame-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_CXX_FLAGS:STRING='-w' \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr/${_arch}" \
        ..
    make
    popd
  done
}

package() {
  cd "$_reponame-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    make DESTDIR="${pkgdir}" install
    # remove examples
    rm -r "${pkgdir}/usr/${_arch}/share"
    # put cmake files in right directory
    mkdir -p "${pkgdir}/usr/${_arch}/lib/cmake/RapidJSON"
    mv "${pkgdir}/usr/${_arch}/cmake/"* "${pkgdir}/usr/${_arch}/lib/cmake/RapidJSON"
    popd
  done
}
