pkgname=i3lock-color
pkgver=2.12.c.5
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/PandorasFox/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'pam' 'libev' 'cairo' 'libxkbcommon-x11'
         'libjpeg-turbo' 'xcb-util-xrm' 'pkgconf')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock')
source=("https://github.com/Raymo111/i3lock-color/archive/$pkgver.tar.gz")
sha256sums=('62c9bdff2759186426b184ed45e4c1aae1dc3c582499d94da68d9b08662a96a9')

build() {
	cd "$pkgname-$pkgver"

	# Fix ticket FS#31544, sed line taken from gentoo
	sed -i -e 's:login:system-auth:' pam/i3lock 
	
	autoreconf -fi
	./configure --prefix="$pkgdir/usr/" \
        --sysconfdir="$pkgdir/etc/" \
        --enable-debug=no \
        --disable-sanitizers
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
