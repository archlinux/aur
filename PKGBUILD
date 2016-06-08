# Contributor: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sawfish-git
pkgver=1.11.90.6.gba51040
pkgrel=4
pkgdesc='A window manager extensible using a Lisp-based scripting language.'
arch=('i686' 'x86_64')
url='http://sawfish.wikia.com'
license=('GPL')
depends=('libsm' 'librep-git' 'rep-gtk-git' 'hicolor-icon-theme' 'libxtst' 'gtk2')
makedepends=('git' 'gettext' 'emacs')
optdepends=('emacs: for using sawfish.el')
provides=('sawfish=1.11')
conflicts=('sawfish')
source=('git://github.com/SawfishWM/sawfish.git' arch_poweroff_defaults.patch)
options=('!libtool')
sha1sums=('SKIP' '73dbf5f93c0124c11f0254267d662f86be1f2767')
_gitname=sawfish

pkgver() {
  cd "$_gitname"
  git describe --tags|sed 's/-/./g'|cut -c9-
}

prepare() {
  cd "$_gitname"
  patch -p1 < "$srcdir"/arch_poweroff_defaults.patch
}

build() {
  cd "$_gitname"
  ./autogen.sh 
  ./configure --prefix=/usr --with-nls 
  make 
  emacs -batch -q -f batch-byte-compile sawfish.el
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install 
  install -Dm644 sawfish.el $pkgdir/usr/share/emacs/site-lisp/sawfish.el
  install -Dm644 sawfish.elc $pkgdir/usr/share/emacs/site-lisp/sawfish.elc
  install -Dm644 lisp/sawfish/wm/tile/readme.org \
    $pkgdir/usr/share/doc/$pkgname/readme.tiling.org
} 
