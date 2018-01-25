# Maintainer: Chris Kitching <chriskitching@linux.com>

basename="xgboost"
pkgname='mingw-w64-xgboost'
pkgver=0.7
pkgrel=1
pkgdesc='An optimized distributed gradient boosting library designed to be highly efficient, flexible and portable (mingw-w64)'
url='https://github.com/dmlc/xgboost'
license=('APACHE')
source=('git+https://github.com/dmlc/xgboost.git#tag=v0.7')
makedepends=('mingw-w64-cmake')
arch=('x86_64')
sha256sums=('SKIP')
options=('!strip' '!buildflags' 'staticlibs')

prepare() {
  cd "${basename}"
  # Note that, due to in-tree builds, I can't promise that incremental rebuilds of this package will work right.
  # You could in principle write some cache-busting logic here to fix that...
  git submodule update --init --recursive
}

build() {
  # The whole concept of a "working copy" is prettymuch garbage since this retarded library is hardcoded to do
  # partially-in-tree builds.
  mkdir -p obj
  cd obj
  x86_64-w64-mingw32-cmake "${srcdir}/${basename}"
  make
}

package() {
  # Now we have to extract the various bits of crap the build system scattered everywhere, and turn them into
  # a package. Hurrah!

  # And no, I don't want to do 32-bit support.
  _arch="x86_64-w64-mingw32"

  # Stuff that just gets copied right out of the source tree...
  cd "${srcdir}/${basename}"

  # Install license and documentation.
  install -D -m644 LICENSE "${pkgdir}/usr/${_arch}/share/licenses/${basename}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/${_arch}/share/doc/${basename}/README.md"

  # Install main executable (which is for some reason in the source tree).
  install -Dm755 "xgboost.exe" "${pkgdir}/usr/${_arch}/bin/xgboost.exe"

  # Install libraries from the many and varied places the buildsystem decides to hide them.
  mkdir -p "${pkgdir}/usr/${_arch}/lib"
  install -Dm644 lib/*.dll "${pkgdir}/usr/${_arch}/bin"

  cd "${srcdir}/obj"
  install -Dm644 *.a "${pkgdir}/usr/${_arch}/lib"
  install -Dm644 dmlc-core/*.dll "${pkgdir}/usr/${_arch}/bin"
  install -Dm644 dmlc-core/*.a "${pkgdir}/usr/${_arch}/lib"
  cd "${srcdir}/${basename}"

  # Install includes
  mkdir -p "${pkgdir}/usr/${_arch}/include"
  cp -r include/xgboost "${pkgdir}/usr/${_arch}/include"
  cp -r dmlc-core/include/dmlc "${pkgdir}/usr/${_arch}/include"
  cp -r rabit/include/rabit "${pkgdir}/usr/${_arch}/include"

  # Crossplatform strip...
  cd "${pkgdir}/usr/${_arch}"
  ${_arch}-strip -s ./bin/*.exe
  ${_arch}-strip --strip-unneeded ./bin/*.dll
  ${_arch}-strip -g ./lib/*.a
}
