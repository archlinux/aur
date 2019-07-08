# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_pkgname=crossc
pkgname="mingw-w64-${_pkgname}"
pkgver=1.6.0
pkgrel=1
pkgdesc='Portable C wrapper for SPIRV-Cross (mingw-w64)'
arch=('any')
url='https://github.com/rossy/crossc/'
license=('APACHE')
depends=('gcc-libs')
makedepends=('git')
source=("git+https://github.com/rossy/crossc.git#tag=v${pkgver}"
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git')
sha256sums=('SKIP'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  for _arch in ${_architectures}; do
    cp -rf crossc "build-${_arch}"
    cp -rf SPIRV-Cross "SPIRV-Cross-${_arch}"
    pushd "build-${_arch}"
    git submodule init
    git config --local 'submodule.SPIRV-Cross.url' "${srcdir}/SPIRV-Cross-${_arch}"
    git submodule update
    popd
  done
  rm -rf crossc SPIRV-Cross
}

build() {
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    unset LDFLAGS

    CXX=/usr/bin/${_arch}-g++ \
    AR=/usr/bin/${_arch}-ar \
      make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    CXX=/usr/bin/${_arch}-g++ \
    AR=/usr/bin/${_arch}-ar \
      make DESTDIR="$pkgdir" prefix="/usr/${_arch}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    popd
  done
}
