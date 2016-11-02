pkgname=mingw-w64-fmipp
pkgver=1.2
pkgrel=1
pkgdesc="A High-level Utility Package for FMI-based Software Development (mingw-w64)"
arch=('any')
url="http://fmipp.sourceforge.net"
depends=('mingw-w64-boost' 'mingw-w64-sundials')
makedepends=('git' 'mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
license=('BSD')
source=("fmipp-${pkgver}::git+git://git.code.sf.net/p/fmipp/code#commit=565836e255a73d013b3b74331d56f24ebf8b5408")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/fmipp-${pkgver}
  sed -i "s|Shlwapi|shlwapi|g" export/src/HelperFunctions.cpp import/base/src/PathFromUrl.cpp export/CMakeLists.txt import/CMakeLists.txt
  sed -i "s|TCHAR\.h|tchar\.h|g" import/base/src/PathFromUrl.cpp export/src/FMIComponentFrontEnd.cpp
  sed -i "s|Windows\.h|windows\.h|g" export/src/FMIComponentFrontEnd.cpp
}

build() {
  cd "$srcdir"/fmipp-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DDBUILD_SWIG=OFF -DBUILD_SWIG_PYTHON=OFF -DBUILD_SWIG_JAVA=OFF \
      -DBUILD_TESTS=OFF \
      -DINCLUDE_SUNDIALS=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/fmipp-${pkgver}/build-${_arch}
    install -d "$pkgdir"/usr/${_arch}/include/fmipp
    cp -r "$srcdir"/fmipp-${pkgver}/common/* "$pkgdir"/usr/${_arch}/include/fmipp
    cp "$srcdir"/fmipp-${pkgver}/export/{functions,include}/*.h "$pkgdir"/usr/${_arch}/include/fmipp
    cp "$srcdir"/fmipp-${pkgver}/export/tools/{powerfactory,trnsys17/Type6139}/*.h "$pkgdir"/usr/${_arch}/include/fmipp
    cp "$srcdir"/fmipp-${pkgver}/import/{integrators,base,utility}/include/*.h "$pkgdir"/usr/${_arch}/include/fmipp
    install -d "$pkgdir"/usr/${_arch}/lib
    install -m 644 libfmipp*.dll.a "$pkgdir"/usr/${_arch}/lib
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m 755 fmipp*.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
