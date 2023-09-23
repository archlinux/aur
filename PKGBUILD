# Maintainer: OpenSorcerer <alex cat opensourcery dog eu>
pkgname=offen-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="Offen Fair Web Analytics"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.offen.dev/"
license=('GPL')
depends=()
makedepends=('curl')
backup=('etc/offen/offen.env')
source=("https://github.com/offen/offen/releases/download/v$pkgver/offen-v$pkgver.tar.gz"
		"offen.env"
		"offen.service"
		"offen.sysusers"
		"offen.tmpfiles")
noextract=('*.asc' 'offen-darwin*' 'offen-windows*')
sha256sums=('f0997f8cc57d8f935c6745beaa506526da639ad6c7b691b2bf40f95ba425283c'
            'd47828c1b98920a24dfdb3d0b806af7c5a44f8159a74c389809e08f3302794c3'
            '1f7912b9993baf719dc1a1b9ef6cd72540a3d4e3ac3ecd3bd4998753061c37fe'
            '537e9e5cc3cce7afea6e5ed7ca1d6590d522eca14c8c399085c8655289f8af80'
            '7f767254ef32b14da6a74d87e27ada0b11a8372d3a8c773231b0a492238af97c')

package() {
	cd "$srcdir"

	# place Systemd files
	install -Dm644 offen.service "$pkgdir/usr/lib/systemd/system/offen.service"
	install -Dm644 offen.sysusers "$pkgdir/usr/lib/sysusers.d/offen.conf"
	install -Dm644 offen.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/offen.conf"

	# place config
	install -Dm644 offen.env "$pkgdir/etc/offen/offen.env"

	# place binary
	if [ $arch == "x86_64" ]; then
		install -Dm755 offen-linux-amd64 "$pkgdir/usr/bin/offen"
	elif [ $arch == "armv7h" ]; then
		install -Dm755 offen-linux-arm-v7 "$pkgdir/usr/bin/offen"
	elif [ $arch == "aarch64" ]; then
		install -Dm755 offen-linux-arm64 "$pkgdir/usr/bin/offen"
	fi

	# place license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"

	# place documentation
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
