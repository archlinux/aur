#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration.
(( ENABLE_PYTHON2 )) && { makedepends+=(python2{,-numpy} 'boost-python2'); optdepends+=('boost-python2-libs: python2 support' 'python2: python2 support'); }

pkgbase=openexr2
pkgname=("${pkgbase}"{,-libs})
pkgver=2.5.5
_pkgver="${pkgver%.*}"
pkgrel=1
pkgdesc="An high dynamic-range image file format library"
url="https://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('zlib')
makedepends+=('cmake' 'patchelf' python{,-numpy} 'boost' 'freeglut' 'chrpath')
optdepends+=('boost-libs: python support' 'python: python support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openexr/openexr/archive/v$pkgver.tar.gz")
sha256sums=('59e98361cb31456a9634378d0f653a2b9554b8900f233450f2396ff495ea76b3')

prepare() {
  sed -i '1 i\#include <cstdint>' "${srcdir}/${pkgbase%2}-${pkgver}"/OpenEXR/IlmImf/{ImfHuf,ImfDwaCompressor,ImfMisc}.cpp
}

build() {
  cmake -B build -S ${pkgname%2}-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package_openexr2() {
  depends+=("${pkgbase}-libs=${pkgver}-${pkgrel}")
  conflicts=('openexr')
  provides=("openexr=${pkgver}")
  DESTDIR="${pkgdir}" cmake --install build
  install -vD -m644 ${pkgname%2}-$pkgver/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

# Install missing python module
  _pythonpath=$(python -c "from sysconfig import get_path; print(get_path('platlib'))")
  install -vDm755 build/python3*/imathnumpy.so -t "$pkgdir/$_pythonpath"
  patchelf --set-rpath "" "${pkgdir}/$_pythonpath"/imathnumpy.so

# remove libs
  cd "${pkgdir}/usr"
  find "lib" -type f,l -name 'lib*.so.*' -delete

# suffix all bins with pkgver
  for file in bin/*; do
    mv "${file}" "${file}-${_pkgver}"
  done
}

package_openexr2-libs() {
  pkgdesc+=" (runtime libraries)"
  provides=('libHalf-2_5.so' 'libIex-2_5.so' 'libIexMath-2_5.so' 'libIlmImf-2_5.so' 'libIlmImfUtil-2_5.so' 'libIlmThread-2_5.so' 'libImath-2_5.so' 'libPyIex_Python3_10-2_5.so' 'libPyImath_Python3_10-2_5.so')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install build

# Install missing python module
  _pythonpath=$(python -c "from sysconfig import get_path; print(get_path('platlib'))")
  install -vDm755 build/python3*/imathnumpy.so -t "$pkgdir/$_pythonpath"
  patchelf --set-rpath "" "${pkgdir}/$_pythonpath"/imathnumpy.so

# Install optional python2 module
  compgen -G "build/python2*/imathnumpy.so" && {
    _python2path=$(python2 -c "from sysconfig import get_path; print(get_path('platlib'))")
    install -vDm755 build/python2*/imathnumpy.so -t "$pkgdir/$_python2path"
    patchelf --set-rpath "" "${pkgdir}/$_python2path"/imathnumpy.so
  } || :

  cd "${pkgdir}"
  find . -type f,l ! -name 'lib*.so*' -delete
  find . -type l -name 'lib*.so' -delete
  find . -type d -empty -delete

}

# vim:set sw=2 ts=2 et:
