# $Id$
# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Ysblokje <ysblokje at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Christoph Viebig <oss@christoph-viebig.de>
#
# This PKGBUILD is based on the official Arch cmake package.

pkgname=cmake-git
pkgver=3.27.0.rc4.205.gff3179cef8
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="http://www.cmake.org/"
license=('custom')
conflicts=('cmake')
provides=('cmake')
depends=('curl' 'libarchive' 'hicolor-icon-theme' 'jsoncpp' 'libjsoncpp.so' 'libuv' 'rhash' 'cppdap')
makedepends=('qt6-base' 'python-sphinx' 'emacs' 'git')
optdepends=('qt6-base: cmake-gui')
source=('git+https://gitlab.kitware.com/cmake/cmake.git'
        'cmake-cppflags.patch')
md5sums=('SKIP'
         'd7316e540d07e0a7ebce75951a7b2697')
#shortver=$(printf "${pkgver}" | sed 's/\([0-9]\+\.[0-9]\+\)\..*/\1/')

pkgver() {
    cd "$srcdir/cmake"
    git describe --always --tags --long | sed -e 's|^v||' -e 's|-|.|g'
}

prepare() {
    cd "$srcdir/cmake"
    patch -p1 -i ../cmake-cppflags.patch # Honor CPPFLAGS https://gitlab.kitware.com/cmake/cmake/issues/12928
}

build() {
  cd "$srcdir/cmake"

  export CXXFLAGS+=" ${CPPFLAGS}"
  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --datadir=/share/cmake \
    --sphinx-man \
    --sphinx-html \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd "$srcdir/cmake"
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/usr/share/doc/cmake/html/_sources
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  install -Dm644 Copyright.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
