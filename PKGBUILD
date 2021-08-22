# Maintainer: Henri Derycke <nheir.kim@gmail.com>
pkgname=bluez-alsa-git
pkgver=3.1.0.r47.gaac8742
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
	50-migration.conf)
md5sums=('SKIP'
         '03c52b1709e491bf8e90f284075c392e')
install=bluealsa.install

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed "s:bluez.service:bluetooth.service:" -i $pkgname/misc/systemd/bluealsa.service.in
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
		--enable-systemd
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
	install -Dm0644 $srcdir/50-migration.conf $pkgdir/usr/lib/systemd/system/bluealsa.service.d/50-migration.conf
}
