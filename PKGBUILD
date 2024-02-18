# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
pkgname=freesweep
pkgver=1.0.2
pkgrel=1
pkgdesc="a console minesweeper-style game written in C for *nix"
arch=('x86_64' 'i686')
url="https://github.com/rwestlund/freesweep"
license=('GPL')
depends=('ncurses')
backup=('etc/sweeprc' "var/games/$pkgname/sweeptimes")
install=$pkgname.install
source=("freesweep-${pkgver}.tar.gz::https://github.com/rwestlund/freesweep/archive/v${pkgver}.tar.gz")
sha512sums=('1695bb29efbaed5e6baf5faadcbd685e8e6b4ccb5d52567a833b5f5eeb69200fc220579fea7d6907bffc92a06e9b220bca494e8597394820a421f81f0af1d3aa')

# Scores do not really work currently; They are saved,
# but for some reason not read / parsed correctly by the program,
# i.e. no scores are displayed.

# Furthermore it is doubtable whether /var/games/$pkgname
# is an appropriate location, regarding the Arch Packaging Guidelines.
# The alternative would be /var/lib/$pkgname.
# If you change this, don't forget to adjust package() appropriately.
_scoresdir="/var/games/$pkgname"
#_scoresdir="/var/lib/$pkgname"

prepare()
{
	cd "$pkgname-$pkgver"
	ln -sf /usr/share/libtool/build-aux/config.sub .
	ln -sf /usr/share/libtool/build-aux/config.guess .
	sed -i "s/0.8/$pkgver/" sweeprc
	sed -i "s@mkstr(SCORESDIR)@\"$_scoresdir\"@" pbests.c
	sed -Ei s/'^VERSION\s*=\s*1\.0\.1$'/"VERSION = ${pkgver}"/ Makefile.in
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
	install -m 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -m 644 -t "$pkgdir/usr/share/doc/$pkgname/" TODO

	# Comment this line out, if you don't need it:
	install -m 775 -g games -d "$pkgdir/var/games"
	install -m 775 -g games -d "$pkgdir/$_scoresdir"
	install -m 664 -g games -t "$pkgdir/$_scoresdir/" sweeptimes
}
