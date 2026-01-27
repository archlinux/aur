# Previously: Einhard Leichtfuß <archer@respiranto.de>
# Maintainer: Cookie Engineer <@cookiengineer>
pkgname=freesweep-git
_pkgname=freesweep
pkgver=1.0.2.35.g68c0ee5
pkgrel=1
pkgdesc="A console minesweeper-style game written in C for Unix-like systems"
arch=('x86_64' 'i686')
url="https://github.com/rwestlund/freesweep"
license=('GPL')
depends=('ncurses')
makedepends=('git' 'autoconf' 'automake' 'libtool')
backup=('etc/sweeprc' "var/games/$_pkgname/sweeptimes")
install=$_pkgname.install

source=("git+https://github.com/rwestlund/freesweep.git")
sha512sums=('SKIP')

_scoresdir="/var/games/$_pkgname"
# _scoresdir="/var/lib/$_pkgname"

pkgver() {
	cd "$srcdir/$_pkgname"

	local ver
	ver=$(git describe --long --tags --always)

	# Strip leading "v", convert to Arch version format, drop -dirty
	ver=${ver#v}
	ver=${ver//-/.}
	ver=${ver%%.dirty}

	printf '%s\n' "$ver"
}

prepare() {
  cd "$srcdir/$_pkgname"

  # Regenerate build system
  ./autogen.sh

  # Patch the wrong method
  sed -i 's/mvwprintw(log_win, 0, 0, mesg);/mvwprintw(log_win, 0, 0, "%s", mesg);/' logs.c

  # Patch the score directory constant in bests.c
  sed -i "s@mkstr(SCORESDIR)@\"$_scoresdir\"@" bests.c

  # The default config template may need correct score dir too
  sed -i "s@SCORESDIR@$_scoresdir@" sweeprc.in
}

build() {
  cd "$srcdir/$_pkgname"

  ./configure \
    --prefix=/usr \
    --with-prefsdir=/etc \
    --with-scoresdir="$_scoresdir"

  make
  # ensure sweeptimes exists so score dir install is happy
  touch sweeptimes
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 freesweep "$pkgdir/usr/bin/freesweep"

  install -Dm644 sweeprc.in "$pkgdir/etc/sweeprc"

  install -Dm644 freesweep.6.in "$pkgdir/usr/share/man/man6/freesweep.6"

  install -dm755 "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 README.md TODO "$pkgdir/usr/share/doc/$_pkgname/"

  # optional score directory support
  install -dm775 -g games "$pkgdir/var/games"
  install -dm775 -g games "$pkgdir/$_scoresdir"
  install -m664 -g games sweeptimes "$pkgdir/$_scoresdir/sweeptimes"
}

