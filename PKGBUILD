# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kazuo Teramoto <kaz.rag at gmail dot com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: bender02 at gmx dot com

pkgname=asymptote-git
epoch=2
pkgver=2.71.r617.g6d686ea3
pkgrel=2
pkgdesc="A vector graphics language (like metapost)"
arch=('i686' 'x86_64')
url="https://github.com/vectorgraphics/asymptote"
license=('LGPL3')
depends=('gc' 'python' 'freeglut' 'gsl' 'fftw' 'libsigsegv' 'boost-libs')
makedepends=('git' 'flex' 'ghostscript' 'imagemagick' 'librsvg' 'boost' 'rapidjson' 'glu' 'glm')
checkdepends=('texlive-core')
optdepends=('python-pyqt5:      for the xasy GUI'
            'tix:               for the xasy GUI'
	    'python-cson:       for the xasy GUI')
conflicts=('asymptote')
provides=('asymptote')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed s+git.+.r+|tr - .
}


build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --enable-gc=system \
	      --prefix=/usr \
	      --enable-gl \
	      --enable-texlive-build
  make
}

check() {
  cd ${pkgname%-git}
  make check
}

package() {
  cd ${pkgname%-git}
  make -j1 DESTDIR="${pkgdir}" install

  # move vim files to correct place
  install -dm755 "$pkgdir"/usr/share/vim/vimfiles/{ftdetect,syntax}
  install -Dm644 "$pkgdir"/usr/share/asymptote/asy.vim \
	  "$pkgdir"/usr/share/vim/vimfiles/syntax/asy.vim
  install -Dm644 "$pkgdir"/usr/share/asymptote/asy_filetype.vim \
	  "$pkgdir"/usr/share/vim/vimfiles/ftdetect/asy.vim
  rm "$pkgdir"/usr/share/asymptote/asy.vim \
     "$pkgdir"/usr/share/asymptote/asy_filetype.vim
  install -dm755 "$pkgdir"/usr/share/org.kde.syntax-highlighting/syntax
  cd "$pkgdir"/usr/share/asymptote/
  sh asy-kate.sh
  mv asymptote.xml "$pkgdir"/usr/share/org.kde.syntax-highlighting/syntax
}
