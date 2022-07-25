# Maintainer: DanielNak <daniel@tee.cat>
# Python package author: Matt Gorko <https://github.com/MattGorko>

_branch=master
_author=MattGorko
_pkgname=U2F-Emulated
pkgname=u2f-emulated
pkgver=1.0
pkgrel=1
pkgdesc="Software that emulates U2F through a virtual USB device."
arch=('any')
url="https://github.com/$_author/$pkgname"
license=('GPL2')
# depends=('')
makedepends=('clang')
checkdepends=('criterion')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
	"https://github.com/$_author/$pkgname/archive/refs/heads/master.zip"
	"$pkgname.service"
)
sha256sums=(
	'7eb4057524c1fb02d7883d189732428fe16fa36ac8ef1582304ad6d021698745'
	'8f03a228dc9c86d977714f2e8975a0c920e6faf3521912eb0cae789c77870786'
)
install=$pkgname.install

build() {
	cd "$srcdir/$_pkgname-$_branch"
	sed -i "s#keys#/usr/share/$pkgname/keys#g" setup.sh
	make
}

check() {
	cd "$srcdir/$_pkgname-$_branch"
	make check
}

package(){
	cd "$srcdir"
	install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
	cd "$_pkgname-$_branch"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm755 setup.sh "$pkgdir/usr/bin/$pkgname-setup"
	install -Dm644 README* "$pkgdir/usr/share/$pkgname/README"
}
