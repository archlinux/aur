# Maintainer: Henri Derycke <nheir.kim@gmail.com>
pkgname=bluez-alsa-git
pkgver=3.1.0.r22.gdab0fad
pkgrel=1
pkgdesc="Bluetooth Audio ALSA Backend"
arch=('x86_64' 'armv7h' 'aarch64' 'armv6h')
url="https://github.com/Arkq/bluez-alsa"
license=('MIT')
depends=(
	'alsa-lib' 'bluez' 'dbus' 'glib2' 'sbc'
	'bluez-libs'         # bluealsa-play
	'libfdk-aac'         # --enable-aac
#	'lame'               # --enable-mp3lame
#	'mpg123'             # --enable-mpg123
#	'libopenaptx'        # --with-libopenaptx
#	'readline'           # --enable-rfcomm
#	'libbsd' 'ncurses'   # --enable-hcitop
)
makedepends=('git' 'python-docutils')
source=("$pkgname::git+https://github.com/Arkq/bluez-alsa.git"
	"https://github.com/Arkq/bluez-alsa/wiki/files/Systemd-integration/bluealsa.service"
	bluealsa.conf)
md5sums=('SKIP'
         'e9f0e82a8a8a4893ad26bc7013b18b2e'
         '2413afa4e59dfdb288955d0436d6d22d')
backup=('etc/default/bluealsa')
install=bluealsa.install

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed "s:dbus-org.bluez.service:bluetooth.service:" -i bluealsa.service
}

build() {
	cd "$pkgname"
	autoreconf --install
	# See https://github.com/Arkq/bluez-alsa/wiki/Installation-from-source#3-configure-the-build-directory
	# for options details
	local flags=(
		--enable-aac
	#	--enable-aptx --enable-aptx-hd --with-libopenaptx
	#	--enable-ldac
	#	--enable-mp3lame
	#	--enable-mpg123
	#	--enable-msbc
	#	--enable-ofono
		--enable-manpages
	#	--enable-a2dpconf
	#	--enable-cli
	#	--enable-rfcomm
	#	--enable-hcitop
	#	--enable-upower
	#	--enable-debug
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
