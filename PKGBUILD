# $Id$
# Maintainer : Ysblokje <ysblokje at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Christoph Viebig <oss@christoph-viebig.de>
#
# This PKGBUILD is based on the official Arch cmake package.

pkgname=cmake-git
pkgver=3.7.0.rc3.485.ga21f747
pkgrel=2
pkgdesc='A cross-platform open-source make system'
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
conflicts=('cmake')
provides=('cmake')
depends=('curl' 'libarchive' 'shared-mime-info' 'jsoncpp' 'rhash')
makedepends=('qt5-base' 'python-sphinx' 'emacs' 'git' 'ncurses')
optdepends=('qt5-base: cmake-gui'
            'libxkbcommon-x11: cmake-gui')
source=('git+https://cmake.org/cmake.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/cmake"
    git describe --always --tags | sed -e 's|^v||' -e 's|-|.|g'
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
  ln -s /usr/share/cmake-${pkgver%.*.*.*}/editors/vim/cmake-help.vim \
    "${vimpath}"/help/
  ln -s /usr/share/cmake-${pkgver%.*.*.*}/editors/vim/cmake-indent.vim \
    "${vimpath}"/indent/
  ln -s /usr/share/cmake-${pkgver%.*.*.*}/editors/vim/cmake-syntax.vim \
    "${vimpath}"/syntax/

  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  emacs -batch -f batch-byte-compile \
    "${pkgdir}"/usr/share/cmake-${pkgver%.*.*.*}/editors/emacs/cmake-mode.el
  ln -s /usr/share/cmake-${pkgver%.*.*.*}/editors/emacs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
