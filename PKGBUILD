# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kazuo Teramoto <kaz.rag at gmail dot com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: bender02 at gmx dot com

pkgname=asymptote-git
epoch=2
pkgver=2.65.git.4.g48777621
pkgrel=1
pkgdesc="A vector graphics language (like metapost)"
arch=('i686' 'x86_64')
url="http://asymptote.sourceforge.net/"
license=('LGPL3')
depends=('gc' 'python' 'freeglut' 'glew' 'gsl' 'fftw' 'libsigsegv')
makedepends=('git' 'flex' 'ghostscript' 'imagemagick' 'glm' 'asymptote')
optdepends=('python-pyqt5:      for the xasy GUI'
            'python-imaging:    for the xasy GUI'
            'tix:               for the xasy GUI')
conflicts=('asymptote')
provides=('asymptote')
source=('git+https://github.com/vectorgraphics/asymptote.git' remove_include.patch)
sha256sums=('SKIP'
            '3f72eab932e4713a58fbfafba8e24df362f23d29cb75db94204c8280246f024e')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed s+git+.git+|tr - .
}

prepare() {
  cd ${pkgname%-git}/
  touch prc/config.h
  patch -Np1 < "$srcdir"/remove_include.patch
  # dirty workaround for doc creation
  cd doc
  asy logo.asy
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --enable-gc=/usr \
    --prefix=/usr \
    --enable-offscreen \
    --with-latex=/usr/share/texmf/tex/latex \
    --with-context=/usr/share/texmf/tex/context
  make all
}

check() {
  cd ${pkgname%-git}
  make check-all
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="${pkgdir}" install-all

  # move vim files to correct place
  install -dm755 "$pkgdir"/usr/share/vim/vimfiles/{ftdetect,syntax}
  mv "$pkgdir"/usr/share/asymptote/asy.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/asy.vim
  mv "$pkgdir"/usr/share/asymptote/asy_filetype.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/asy.vim
}
