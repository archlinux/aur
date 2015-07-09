# Contributor: Johannes Weiner <hannes@saeurebad.de>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=slime-git
pkgver=2.14.14.g0f212b3
pkgrel=1
pkgdesc="The Superior Lisp Interaction Mode for Emacs - from git"
arch=('any')
url="http://common-lisp.net/project/slime"
license=('GPL')
depends=('emacs' 'awk')
makedepends=('git' 'texinfo' 'texlive-core')
optdepends=('awk: for recreating the documentation' 
  'texlive-core: for recreating the documentation') 
provides=('slime')
conflicts=('slime')
install=slime.install
source=("git://github.com/slime/slime")
md5sums=('SKIP')
_gitname="slime"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --tags | sed 's|-|.|g'|cut -c2-)
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -d $pkgdir/usr/share/emacs/site-lisp/slime
  cp -r $srcdir/slime/* \
    $pkgdir/usr/share/emacs/site-lisp/slime
  
  install -d $pkgdir/usr/share/common-lisp/systems
  ln -s /usr/share/emacs/site-lisp/slime/swank.asd \
    $pkgdir/usr/share/common-lisp/systems/
  
  install -D -m644 README.md \
    $pkgdir/usr/share/licenses/$pkgname/public_domain.txt 
  cd doc
  make infodir=$pkgdir/usr/share/info install 
  rm $pkgdir/usr/share/info/dir
  install -Dm644 slime-refcard.pdf \
    $pkgdir/usr/share/doc/slime/slime-refcard.pdf 
}
