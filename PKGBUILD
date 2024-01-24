# Maintainer: éclairevoyant
# Contributor: SilverMight <silver at silvermight dot com>
# Contributor: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: thesqrtminus1  <thesqrtminus1 at gmail dot com>
# Contributor: kstolp <kevinstolp at gmail dot com>
# Contributor: kfgz <ffiasd at gmail dot com>

pkgname=y-cruncher
pkgver=0.8.3.9532
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems"
arch=(x86_64)
url="http://www.numberworld.org/$pkgname"
license=(custom)
options=('!strip')
depends=(gcc-libs glibc numactl tbb)
source=("https://github.com/Mysticial/$pkgname/releases/download/v$pkgver/$pkgname.v$pkgver-dynamic.tar.xz")
b2sums=('28b71cef565a0e7f16412e59cf47b90c7a04461a1d9b99e2cddbf67a1702bb784e71c641e3b972104bd2b9cbd3ac062d6d60d94c2f613c1203d897c895dd0f96')

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
