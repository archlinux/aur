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
pkgver=3.11.0.453.ge769e61f99
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="http://www.cmake.org/"
license=('custom')
conflicts=('cmake')
provides=('cmake')
depends=('curl' 'libarchive' 'shared-mime-info' 'jsoncpp' 'rhash' 'libuv')
makedepends=('qt5-base' 'python-sphinx' 'git' 'ncurses' 'emacs')
optdepends=('qt5-base: cmake-gui'
            'libxkbcommon-x11: cmake-gui')
source=('git+https://cmake.org/cmake.git')
md5sums=('SKIP')
shortver=$(printf "${pkgver}" | sed 's/\([0-9]\+\.[0-9]\+\)\..*/\1/')

pkgver() {
    cd "$srcdir/cmake"
    git describe --always --tags --long | sed -e 's|^v||' -e 's|-|.|g'
}

prepare() {
    cd "$srcdir/cmake"
}

build() {
  cd "$srcdir/cmake"

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --sphinx-man \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd "$srcdir/cmake"
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${vimpath}"/{help,indent,syntax}
  ln -s /usr/share/cmake-${shortver}/editors/vim/indent/cmake.vim \
    "${vimpath}"/indent/
  ln -s /usr/share/cmake-${shortver}/editors/vim/syntax/cmake.vim \
    "${vimpath}"/syntax/

  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  emacs -batch -f batch-byte-compile \
    "${pkgdir}"/usr/share/cmake-${shortver}/editors/emacs/cmake-mode.el
  ln -s /usr/share/cmake-${shortver}/editors/emacs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
