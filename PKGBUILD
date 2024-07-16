# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=savilerow-bin
_pkgname=savilerow
pkgver=1.10.0
pkgrel=2
pkgdesc="A modelling assistant for Constraint Programming"
arch=('x86_64')
url="https://www-users.york.ac.uk/peter.nightingale/savilerow"
license=('GPL-3.0-or-later AND MIT AND GPL-2.0-or-later')
depends=(java-runtime bash)
provides=(savilerow)
source=("$pkgname-$pkgver.tar.gz::$url/$_pkgname-$pkgver-linux.tgz"
	"savilerow-shim.sh")
sha256sums=('3eedd957803ca783ef2e3a075408b4b029594a388ea0ae29c57651cc26c8836b'
            'a26d063017332f8aa2960fc4bd2713d3087f13ce1f9c29366f35135f26a43ffd')

package() {
	# we have to use this shim script instead of a symlink so that the
	# directory resolution in the startup script succeeds
	install -Dm0755 "savilerow-shim.sh" "$pkgdir/usr/bin/savilerow"

	cd "$_pkgname-$pkgver-linux"
	install -Dm0755 -t "$pkgdir/opt/$_pkgname" savilerow savilerow.jar

	# the vendored dependencies have to go here, otherwise we must patch
	# the startup script
	cd bin
	install -Dm0755 -t "$pkgdir/opt/$_pkgname/bin" \
		fzn-chuffed kissat minion symmetry_detect

	cd "$srcdir/$_pkgname-$pkgver-linux"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" "savilerow-manual.pdf"
	ln -sr "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/doc/$_pkgname"

	_licensedir="$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 0644 COPYING "$_licensedir/COPYING"
	install -Dm 0644 LICENSES/cadical/LICENSE "$_licensedir/vendored/cadical.txt"
	install -Dm 0644 LICENSES/chuffed/LICENSE "$_licensedir/vendored/chuffed.txt"
	install -Dm 0644 LICENSES/minion/LICENSE.txt "$_licensedir/vendored/minion.txt"
	ln -sr "$_licensedir" "$pkgdir/usr/share/licenses/$_pkgname"
}
