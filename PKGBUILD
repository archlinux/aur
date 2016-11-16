# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=guile-emacs-git
pkgver=116892.41120e0
pkgrel=5
pkgdesc="branch of GNU Emacs that replaces Emacs' own EmacsLisp engine with that of Guile."
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/emacs/GuileEmacs"
license=('GPL3')
depends=('guile4emacs-git' 'gtk3' 'alsa-lib' 'imagemagick'  'gpm'
	 'm17n-lib' 'desktop-file-utils' 'gc' 'gnutls')
makedepends=('git' 'clang' 'gconf')
conflicts=('emacs' 'ctags')
provides=('emacs' 'ctags')
options=('!strip' '!makeflags')
source=("guilemacs::git://git.hcoop.net/git/bpt/emacs.git#branch=wip" )
sha256sums=('SKIP')
_gitname="guilemacs"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  [[ -x configure ]] || ./autogen.sh
}

build() {
  cd "$srcdir"/"$_gitname"
  # Avoid hardening-wrapper (taken from emacs-pretest, thanks to Thomas Jost).
  export PATH=$(echo "$PATH" | sed 's!/usr/lib/hardening-wrapper/bin!!g')

  CC=clang ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --libexecdir=/usr/lib \
	      --with-jpeg=no \
	      --mandir=/usr/share/man \
	      --with-gameuser=:games \
	      --with-sound=alsa \
	      --with-xft \
	      --with-modules \
	      --with-x-toolkit=gtk3 \
	      --without-gconf \
	      --with-gsettings
  
  make
}

package() {
  cd $srcdir/guilemacs
  make DESTDIR="$pkgdir/" install
  chown -R root:root $pkgdir/usr
   # remove conflict with the texinfo-package
  rm $pkgdir/usr/share/info/info.info.gz
}
