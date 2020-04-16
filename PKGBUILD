# Maintainer: Henri Derycke <nheir.kim@gmail.com>
pkgname=bluez-alsa-git
pkgver=2.1.0.r43.g49ad348
pkgrel=1
pkgdesc="Bluetooth Audio ALSA Backend"
arch=('x86_64' 'armv7h' 'aarch64' 'armv6h')
url="https://github.com/Arkq/bluez-alsa"
license=('MIT')
depends=(
	'alsa-lib' 'bluez-libs' 'dbus' 'glib2' 'sbc'
	'libfdk-aac'         # --enable-aac
#	'lame'               # --enable-mp3lame
#	'mpg123'             # --enable-mpg123
#	'readline'           # --enable-rfcomm
#	'libbsd' 'ncurses'   # --enable-hcitop
)
makedepends=('git')
source=("$pkgname::git+https://github.com/Arkq/bluez-alsa.git"
	"https://github.com/Arkq/bluez-alsa/wiki/files/Systemd-integration/bluealsa.service"
	bluealsa.conf)
md5sums=('SKIP'
         'e9f0e82a8a8a4893ad26bc7013b18b2e'
         '2413afa4e59dfdb288955d0436d6d22d')
install=bluealsa.install

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	autoreconf --install
	local flags=(
	#	--enable-debug
		--enable-aac
	#	--enable-mp3lame
	#	--enable-mpg123
	#	--enable-msbc
	#	--enable-rfcomm
	#	--enable-hcitop
	)
	./configure --prefix=/usr \
	            --sysconfdir=/etc \
	            "${flags[@]}"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 $srcdir/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm0644 $srcdir/bluealsa.service $pkgdir/usr/lib/systemd/system/bluealsa.service
	install -Dm0644 $srcdir/bluealsa.conf $pkgdir/etc/default/bluealsa
}
