# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
pkgname=savilerow-bin
_pkgname=savilerow
pkgver=1.11.0
pkgrel=1
pkgdesc="A modelling assistant for Constraint Programming"
arch=('x86_64')
url="https://www-users.york.ac.uk/peter.nightingale/savilerow"
license=('GPL-3.0-or-later AND MIT AND GPL-2.0-or-later')
depends=(java-runtime bash)
provides=(savilerow)
source=("$pkgname-$pkgver.tar.gz::$url/$_pkgname-$pkgver-linux.tgz"
	"savilerow.sh")
sha256sums=('ab97216dd89103513026b46e6d8c63f00e8e8c83750aba60a6c4b75f8d1c8227'
            'fac0443361d1aac54d72f7773707854fe598da654077ff36096cb6d8fc951cb1')

build() {
	cd $_pkgname-$pkgver-linux
	strip bin/*
}

package() {
	install -Dm0755 "savilerow.sh" "$pkgdir/usr/bin/savilerow"

	cd $_pkgname-$pkgver-linux
	install -Dm0755 $_pkgname.jar "$pkgdir/usr/share/java/$_pkgname.jar"
	install -Dm0755 -t "$pkgdir/usr/lib/$_pkgname/bin" \
		bin/fzn-chuffed bin/kissat bin/minion bin/symmetry_detect
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" "savilerow-manual.pdf"
	ln -sr "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/doc/$_pkgname"

	_licensedir="$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 0644 COPYING "$_licensedir/COPYING"
	install -Dm 0644 LICENSES/chuffed/LICENSE "$_licensedir/vendored/chuffed.txt"
	install -Dm 0644 LICENSES/kissat/LICENSE "$_licensedir/vendored/kissat.txt"
	install -Dm 0644 LICENSES/minion/LICENSE.txt "$_licensedir/vendored/minion.txt"
	ln -sr "$_licensedir" "$pkgdir/usr/share/licenses/$_pkgname"
}
