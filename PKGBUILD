# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kazuo Teramoto <kaz.rag at gmail dot com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: bender02 at gmx dot com

pkgname=asymptote-git
epoch=1
pkgver=2.40r15.g064ad747
pkgrel=1
pkgdesc="A vector graphics language (like metapost)"
arch=('i686' 'x86_64')
url="http://asymptote.sourceforge.net/"
license=('GPL3')
depends=('gc' 'freeglut' 'glu' 'gsl' 'fftw' 'libsigsegv')
makedepends=('git' 'ghostscript' 'imagemagick' 'texlive-plainextra')
optdepends=('python2:           for the xasy GUI'
            'python-imaging:    for the xasy GUI'
            'tix:               for the xasy GUI')
conflicts=('asymptote')
provides=('asymptote')
source=('git+https://github.com/vectorgraphics/asymptote.git')
md5sums=('SKIP')
_gitname=asymptote

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --tags|sed s+-+.+g|sed s+git.+r+
}

build() {
  cd "$srcdir/${_gitname}"

  ./autogen.sh
  ./configure --enable-gc=/usr \
    --prefix=/usr \
    --with-latex=/usr/share/texmf/tex/latex \
    --with-context=/usr/share/texmf/tex/context \
    --enable-offscreen

  make all
}

check() {
  cd "$srcdir/${_gitname}"
  make check-all
}

package() {
  cd "$srcdir/${_gitname}"
  make -j1 DESTDIR="${pkgdir}" install-all
  sed -i -e 's@env python@env python2@' ${pkgdir}/usr/share/asymptote/GUI/*.py
  # this dir contains png files that are already embedded in the pdf documentation:
  rm -rf ${pkgdir}/usr/share/info/asymptote

  # move vim files to correct place
  install -dm755 ${pkgdir}/usr/share/vim/vimfiles/{ftdetect,syntax}
  mv ${pkgdir}/usr/share/asymptote/asy.vim \
    ${pkgdir}/usr/share/vim/vimfiles/syntax/asy.vim
  mv ${pkgdir}/usr/share/asymptote/asy_filetype.vim \
    ${pkgdir}/usr/share/vim/vimfiles/ftdetect/asy.vim
}
