# Maintainer: Lily Wilson <hotaru@thinkindifferent.net>
pkgname=raspberrypi-userland-aarch64-git
pkgver=r768.a246147
pkgrel=1
pkgdesc="aarch64-compatible bits of /opt/vc for Raspberry Pi (vcgencmd, tvservice, etc.)" 
arch=('aarch64')
url="https://github.com/raspberrypi/userland"
license=('custom')
makedepends=('git' 'cmake')
provides=('raspberrypi-firmware' 'raspberrypi-userland-aarch64')
source=('git+https://github.com/raspberrypi/userland.git'
        'raspberrypi-userland.conf'
        'raspberrypi-userland.sh'
        '10-vchiq.rules')
md5sums=('SKIP'
         '72e0d5818fc513ece1b964f25f7e7882'
         '734f220923521411450b7cb48333c142'
         'd54988a1f88048e981fe2c427e2f74d9')

pkgver() {
	cd "$srcdir/userland"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/userland"
        sed -i -e 's/sudo //' buildme
}

package() {
	cd "$srcdir/userland"
	./buildme --aarch64 "$pkgdir"
	cd "$srcdir/userland"
        install -Dm644 -t "$pkgdir/etc/udev/rules.d" "$srcdir/10-vchiq.rules"
	install -Dm644 -t "$pkgdir/etc/ld.so.conf.d" "$srcdir/raspberrypi-userland.conf"
        install -Dm644 -t "$pkgdir/etc/profile.d" "$srcdir/raspberrypi-userland.sh"
        install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
