# Maintainer: respiranto <respiranto@icloud.com>
pkgname=freesweep
pkgver=0.92
pkgrel=2
pkgdesc="a console minesweeper-style game written in C for *nix"
arch=('x86_64' 'i686')
url="http://freecode.com/projects/freesweep"
license=('GPL')
depends=('ncurses')
backup=('etc/sweeprc' "var/games/$pkgname/sweeptimes")
install=$pkgname.install
source=("https://freesweep.googlecode.com/files/freesweep-0.92.tar.gz")
md5sums=('e9ac8d2bc63b5d37863c731e13e023da')

# Scores do not really work currently; They are saved,
# but for some reason not read / parsed correctly by the program,
# i.e. no scores are displayed.

# Furthermore it is doubtable whether /var/games/$pkgname
# is an appropriate location, regarding the Arch Packaging Guidelines.
# The alternative would be /var/lib/$pkgname.
# If you change this don't forget to adjust install() appropriately.
_scoresdir="/var/games/$pkgname"
#_scoresdir="/var/lib/$pkgname"

prepare()
{
	cd "$pkgname-$pkgver"
	ln -sf /usr/share/libtool/build-aux/config.sub .
	ln -sf /usr/share/libtool/build-aux/config.guess .
	sed -i "s/0.8/$pkgver/" sweeprc
	sed -i "s@mkstr(SCORESDIR)@\"$_scoresdir\"@" pbests.c
}

build()
{
	cd "$pkgname-$pkgver"
	./configure --with-prefsdir=/etc --with-scoresdir="$_scoresdir"
	make
	touch sweeptimes
}

package()
{
	cd "$pkgname-$pkgver"
	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin/" freesweep
	install -m 755 -d "$pkgdir/etc"
	install -m 644 -t "$pkgdir/etc/" sweeprc
	install -m 755 -d "$pkgdir/usr/share/man/man6"
	install -m 644 -t "$pkgdir/usr/share/man/man6/" freesweep.6
	install -m 755 -d "$pkgdir/usr/share/doc/$pkgname"
	install -m 644 -t "$pkgdir/usr/share/doc/$pkgname/" README

	# Comment this line out, if you don't need it:
	install -m 775 -g games -d "$pkgdir/var/games"
	install -m 775 -g games -d "$pkgdir/$_scoresdir"
	install -m 664 -g games -t "$pkgdir/$_scoresdir/" sweeptimes
}
