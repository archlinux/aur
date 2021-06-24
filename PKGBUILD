#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration.
(( ENABLE_PYTHON2 )) && { makedepends+=(python2{,-numpy} 'boost-python2'); optdepends+=('boost-python2-libs: python2 support' 'python2: python2 support'); }

pkgname=openexr2
pkgver=2.5.5
pkgrel=1
pkgdesc="An high dynamic-range image file format library"
url="https://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('zlib')
makedepends+=('cmake' 'patchelf' python{,-numpy} 'boost' 'freeglut' 'chrpath')
optdepends+=('boost-libs: python support' 'python: python support')
conflicts=('openexr')
provides=("openexr=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/openexr/openexr/archive/v$pkgver.tar.gz")
sha256sums=('59e98361cb31456a9634378d0f653a2b9554b8900f233450f2396ff495ea76b3')

build() {
  cmake -B build -S ${pkgname%2}-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -vD -m644 ${pkgname%2}-$pkgver/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

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
}
# vim:set sw=2 ts=2 et:
