# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Markus Hartung <mail@hartmark.se>
# Contributor: éclairevoyant
# Contributor: SilverMight <silver at silvermight dot com>
# Contributor: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: thesqrtminus1  <thesqrtminus1 at gmail dot com>
# Contributor: kstolp <kevinstolp at gmail dot com>
# Contributor: kfgz <ffiasd at gmail dot com>

pkgname=y-cruncher
pkgver=0.8.6.9545
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems"
arch=(x86_64)
url="http://www.numberworld.org/$pkgname"
license=(custom)
options=('!strip')
depends=(glibc gcc-libs numactl onetbb)

#source=("https://github.com/Mysticial/$pkgname/releases/download/v$pkgver/$pkgname.v$pkgver-dynamic.tar.xz")
source=("http://www.numberworld.org/$pkgname/$pkgname%20v$pkgver-dynamic.tar.xz")
b2sums=('da30caff35f4e9a671f4693bea1a5d714df8934afd84923b4c7f44b224918e50a87a65d1dca066256207d78ec6e04bc885446e2f6f5e3d5d0b3d1cfeb6173282')

prepare() {
	cd "$pkgname v$pkgver-dynamic"

	sed '/Username: / s|Username.txt|/etc/xdg/y-cruncher-username.conf|' Username.txt > "$srcdir/$pkgname-username.txt"
	rm Username.txt

	mv "Binaries/Digits/Gamma(⅓).txt" "Binaries/Digits/Gamma(1-3).txt"
	mv "Binaries/Digits/Gamma(¼).txt" "Binaries/Digits/Gamma(1-4).txt"
}

package() {
	cd "$pkgname v$pkgver-dynamic"

	install -vdm755 "$pkgdir/usr/lib/$pkgname/"
	cp -rv --no-preserve=ownership $pkgname Binaries "Custom Formulas" -t "$pkgdir/usr/lib/$pkgname/"

	# add wrapper binary to path
	install -vdm755 "$pkgdir/usr/bin/"
	ln -vs /usr/lib/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

	# place conf file in XDG-compliant directory
	install -vDm755 "$srcdir/$pkgname-username.txt" "$pkgdir/etc/xdg/y-cruncher-username.conf"
	ln -vs /etc/xdg/y-cruncher-username.conf "$pkgdir/usr/lib/$pkgname/Username.txt"

	install -vDm644 'Command Lines.txt' "$pkgdir/usr/share/doc/$pkgname/USAGE"
	install -vDm644 'Read Me.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
