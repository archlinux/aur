# Maintainer: respiranto <respiranto@icloud.com>
pkgname=freesweep
pkgver=0.92
pkgrel=1
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
# i.e. no scores are displayed
_scoresdir="/var/games/$pkgname"

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
	autoconf
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

	# It is doubtable whether /var/games/$pkgname is the appropriate location
	# The alternative would be /var/lib/$pkgname
	install -m 775 -g games -d "$pkgdir/var/games"
	install -m 775 -g games -d "$pkgdir/var/games/$pkgname"
	install -m 664 -g games -t "$pkgdir/var/games/$pkgname/" sweeptimes
}
