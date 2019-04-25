pkgname="i3lock-color"
pkgver=2.12
pkgrel=1
_version="2.12.c"
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/PandorasFox/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'pam' 'libev' 'cairo' 'libxkbcommon-x11' 'libjpeg-turbo' 'xcb-util-xrm' 'pkgconf')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock')
source=("https://github.com/PandorasFox/i3lock-color/archive/${_version}.tar.gz")
sha256sums=('c2ba4cfa51fee3fd2cab439805d213d8614407d93cf8eecbd4e6fa5cb4c9b7a3')

build() {
	cd "${srcdir}/${pkgname}-${_version}"

	# Fix ticket FS#31544, sed line taken from gentoo
	sed -i -e 's:login:system-auth:' pam/i3lock 
	
	autoreconf -fi
	./configure --prefix="$pkgdir/usr/" --sysconfdir="$pkgdir/etc/" --enable-debug=no --disable-sanitizers
	make
}

package() {
	cd "${srcdir}/${pkgname}-${_version}"
	make install
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
