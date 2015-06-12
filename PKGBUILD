# See AUR interface for current maintainer.

pkgname=groff-git
pkgver=1.22.3.r2775
pkgrel=1
pkgdesc="GNU Troff. Official git trunk."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/groff/"
license=('GPL')
depends=('perl' 'gcc-libs' 'netpbm' 'psutils' 'ghostscript' 'libxaw')
makedepends=('git')
conflicts=('groff')
provides=('groff')
install="$pkgname".install
source=("$pkgname::git://git.savannah.gnu.org/groff.git" 
	'site.tmac')
md5sums=('SKIP'
	 'a1fedafd7863b37968d32ad9ae1d8c13')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s.r%s" "$(cat -s VERSION)" "$(cat -s REVISION)"\
    "$(git rev-list --count HEAD)"
}


prepare() {
  cd "$srcdir/$pkgname"
  ./bootstrap
}

build() {
  cd "$srcdir/$pkgname"
  ./configure \
    --prefix=/usr \
    --with-x \
    --with-appresdir=/usr/share/X11/app-defaults \
    --with-doc=yes

  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  
  ## Copypaste from core package's PKGBUILD...
  
  # add compatibility symlinks
  ln -s eqn $pkgdir/usr/bin/geqn
  ln -s tbl $pkgdir/usr/bin/gtbl
  ln -s soelim $pkgdir/usr/bin/zsoelim

  # FS33760 - TERMCAP variables not followed
  # TODO: everyone is doing this - find out why upstream does not...
  cat $srcdir/site.tmac >> \
    $pkgdir/usr/share/groff/site-tmac/man.local
  cat $srcdir/site.tmac >> \
    $pkgdir/usr/share/groff/site-tmac/mdoc.local
}

# vim:set ft=sh ts=2 sw=2 et:
