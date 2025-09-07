pkgname=unfs3
pkgver=0.11.0
pkgrel=1
pkgdesc="A user-space implementation of the NFSv3 server specification"
arch=('x86_64')
url="https://unfs3.github.io/"
license=("BSD")
makedepends=("flex")
depends=('rpcbind' 'flex' 'libtirpc')
source=("https://github.com/unfs3/unfs3/archive/refs/tags/unfs3-$pkgver.tar.gz"
		"unfsd.conf"
		"unfsd"
		"unfsd.service")
md5sums=('8aa8e9fe97f28b7bd39a69c4ca1f565a'
		 '7c28cd320ac4868cc6f0ca089fbf2e75'
		 'e1010b2da0d5fb962112eed243b2b5ed'
		 '4dfcdd618b7b2229d9b6082401a52880')

prepare() {
	cd "${srcdir}/unfs3-unfs3-${pkgver}"
}

build() {
	cd "${srcdir}/unfs3-unfs3-${pkgver}"
	./bootstrap
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/unfs3-unfs3-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/unfs3/COPYING"

	cd "$srcdir"
	install -Dm755 unfsd "$pkgdir/etc/rc.d/unfsd"
	install -Dm644 unfsd.conf "$pkgdir/etc/conf.d/unfsd.conf"
	install -Dm644 unfsd.service "$pkgdir/usr/lib/systemd/system/unfsd.service"
}
