# Maintainer: Lily Wilson <hotaru@thinkindifferent.net>
pkgname=raspberrypi-userland-aarch64-git
pkgver=r688.517cdc3
pkgrel=1
pkgdesc="aarch64-compatible bits of /opt/vc for Raspberry Pi (vcgencmd, tvservice, etc.)" 
arch=('aarch64')
url="https://github.com/raspberrypi/userland"
license=('custom')
makedepends=('git' 'cmake')
source=('git+https://github.com/raspberrypi/userland.git'
        'arm64.patch'
        'raspberrypi-userland.conf')
md5sums=('SKIP'
         '1fcd17a5c76e1643ade6cf1d2751190c'
         '72e0d5818fc513ece1b964f25f7e7882')

pkgver() {
	cd "$srcdir/userland"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/userland"
	patch -p1 -i "$srcdir/arm64.patch"
}

build() {
	cd "$srcdir/userland"
	./buildme --native
}

package() {
	cd "$srcdir/userland"
        install -Dm755 -t "$pkgdir/opt/vc/bin" build/bin/*
        install -Dm644 -t "$pkgdir/opt/vc/lib" build/lib/*
	install -Dm644 -t "$pkgdir/etc/ld.so.conf.d" "$srcdir/raspberrypi-userland.conf"
        install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
