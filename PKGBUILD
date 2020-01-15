# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: SakalisC <chrissakalis (gmail)>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple keylogger supporting also USB keyboards."
license=('GPLv3')
arch=('i686' 'x86_64')
url="https://github.com/kernc/logkeys"
install="logkeys.install"
backup=('etc/conf.d/logkeysd')
source=("https://github.com/kernc/logkeys/archive/$pkgver.tar.gz"
        "logkeysd.conf" "logkeys.service")

md5sums=('333a0b97fc50f98dcf5cf7202dec51ab'
         'c05608a47e303e8f604f46d1ed22aa4a'
         'bd70a5e5601168bbf7bf7f91ee530d14')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	cd build
	../configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install

	install -Dm0644 "$srcdir/logkeysd.conf" "$pkgdir/etc/conf.d/logkeysd"
	install -Dm0644 "$srcdir/logkeys.service" "$pkgdir/usr/lib/systemd/system/logkeys.service"

	cd "../keymaps"
	for filename in $(ls *.map); do
		install -D -m 644 "${filename}" "${pkgdir}/usr/share/lkmaps/${filename}"
	done

}
