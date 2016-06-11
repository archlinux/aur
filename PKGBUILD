# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=guile-emacs-git
pkgver=116892.41120e0
pkgrel=3
pkgdesc="branch of GNU Emacs that replaces Emacs' own EmacsLisp engine with that of Guile."
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/emacs/GuileEmacs"
license=('GPL3')
depends=('librsvg' 'guile4emacs-git' 'giflib' 'gtk3' 'alsa-lib' 'imagemagick' 'gconf' 'gpm' 'm17n-lib' 'desktop-file-utils')
makedepends=('git')
conflicts=('emacs' 'ctags')
provides=('emacs' 'ctags')
options=('!strip' '!makeflags')
source=("guilemacs::git://git.hcoop.net/git/bpt/emacs.git#branch=wip")
md5sums=('SKIP')
_gitname="guilemacs"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh 
  ./configure --prefix=/usr \
	      --localstatedir=/var \
	      --libexecdir=/usr/lib \
	      --with-jpeg=no
  make 
}

package() {
  cd $srcdir/guilemacs
  make DESTDIR="$pkgdir/" install
  chown -R root:root $pkgdir/usr
   # remove conflict with the texinfo-package
  rm $pkgdir/usr/share/info/info.info.gz
}
