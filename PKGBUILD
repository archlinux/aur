# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Alexander 'hatred' Drozdoff <adrozdoff@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=medit-hg
pkgver=5109.e4e6a091440e
pkgrel=1
pkgdesc="A GTK2 text editor"
arch=('i686' 'x86_64')
url="http://bitbucket.org/medit/medit"
options=('!emptydirs')
license=('GPL' 'LGPL')
depends=('pygtk' 'libxml2' 'pcre' 'libsm' 'python2' 'gtk2' 'gcc-libs' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('ctags' 'vte: terminal emulator')
makedepends=('perl-xml-parser' 'intltool' 'gcc-objc' 'mercurial' 'txt2tags' 'libxslt')
conflicts=('medit')
provides=('medit')
install=medit.install
source=('hg+https://medit@bitbucket.org/medit/medit')

pkgver() {
  cd "$srcdir"/medit
  echo `hg identify -n`.`hg identify -i`
}

build() {
  cd "$srcdir"/medit
  alias python='python2'
  find . -name '*.py' | xargs sed -i 's|python |python2 |'

  # This is probably overkill
  export LANG=C
  export PYTHON=python2
  export PYTHON_VERSION=2.7
  export PYTHON_INCLUDES=`python2-config --includes`
  export PYTHON_LIBS=`python2-config --libs`
  
  ./autogen.sh
  ./configure --prefix=/usr --enable-dev-mode
  find . -name Makefile | xargs sed -i 's/-Werror//g'
  make
}

package() {
  cd "$srcdir"/medit
  make DESTDIR="$pkgdir" install
  cd "$pkgdir"/usr/share/medit-1/language-specs
  sed -i "s|*.sh|*.sh;PKGBUILD|" sh.lang
  rm -rf "$pkgdir"/usr/share/icons/hicolor/icon-theme.cache
}
md5sums=('SKIP')
