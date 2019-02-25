# Maintainer: See AUR interface for current maintainer and contact information.

pkgname=groff-git
pkgver=1.22.4.10.g68a34636
pkgrel=1
pkgdesc="GNU Troff. Official git trunk."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/groff/"
license=('GPL')
depends=('uchardet')
makedepends=('git' 'netpbm' 'psutils' 'ghostscript' 'libxaw')
conflicts=('groff')
provides=('groff')
install="$pkgname".install
source=("$pkgname::git://git.savannah.gnu.org/groff.git" 
#source=("$pkgname::git+http://git.savannah.gnu.org/r/groff.git" 
	'site.tmac')
optdepends=('netpbm:      Enable grohtml image processing.'
            'psutils:     Enable postscript file transformation.'
            'ghostscript: Enable grohtml image and gropdf PDF file creation.'
            'libxaw:      Enable gxditvew.')
sha384sums=('SKIP'
            '393a4e1b807ab3f77e0ceb10c0c844b130720b65a46e561187e5a59268e1dce04c0d54ca5271f171dc2af62501197a19')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe | sed 's/\-/\./g')"
}


prepare() {
  cd "$srcdir/$pkgname"
  ./bootstrap
}

build() {
  mkdir -p "$srcdir/$pkgname"/build
  cd "$srcdir/$pkgname"/build

  local _configopts=(
    --prefix=/usr
    --disable-rpath
    --with-x
    --with-appresdir=/usr/share/X11/app-defaults
    --with-doc=yes
  )

  ../configure "${_configopts[@]}"

  make
}

check() {
  cd "$srcdir/$pkgname"/build

  make check
}

package() {
  cd "$srcdir/$pkgname"/build

  if [[ ${LANG/en_US} ]] || [[ ${LANG/es_CO} ]]; then
    make DESTDIR="$pkgdir/" PAPER=letter install
  else
    make DESTDIR="$pkgdir/" install
  fi
  
  ## Copypaste from core package's PKGBUILD...
  
  # add compatibility symlinks
  ln -s eqn $pkgdir/usr/bin/geqn
  ln -s tbl $pkgdir/usr/bin/gtbl
  ln -s soelim $pkgdir/usr/bin/zsoelim

  # FS33760 - TERMCAP variables not followed
  # TODO: everyone is doing this - find out why upstream does not...
  #
  # Having being privy the whole thing longer than 10 years ago... Blech! V.
  #
  cat $srcdir/site.tmac >> \
    $pkgdir/usr/share/groff/site-tmac/man.local
  cat $srcdir/site.tmac >> \
    $pkgdir/usr/share/groff/site-tmac/mdoc.local
}

# vim:set ft=sh ts=2 sw=2 et:
