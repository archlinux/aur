# Maintainer: loredan13
# Contributor: lf <packages at lfcode dot ca>
pkgname=klipper-git
pkgver=r3853.338bc82d0
pkgrel=1
pkgdesc="3D printer firmware with motion planning on the host"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/KevinOConnor/klipper"
license=('GPL3')
groups=()
depends=(
	python2-cffi
	python2-pyserial
	python2-greenlet
	python2-jinja
	python2-can
	libusb
)
optdepends=(
	'ncurses: for choosing compilation config'
	'avrdude: for flashing firmware on AVR MCU'
	'stm32flash: for flashing firmware on STM MCU'
	'avr-gcc: for AVR MCU firmware compilation'
	'avr-binutils: for AVR MCU firmware compilation'
	'avr-libc: for AVR MCU firmware compilation'
	'python2-numpy: for resonance measurement'
	'python2-matplotlib: for resonance measurement'
)
optdepends_x86_64=(
	'arm-none-eabi-gcc: for ARM MCU firmware compilation'
	'arm-none-eabi-binutils'
	'arm-none-eabi-newlib: for ARM MCU firmware compilation'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/KevinOConnor/klipper#branch=master' 'klipper.service' 'sysusers.conf' 'tmpfiles.conf')
noextract=()
md5sums=('SKIP'
         'ab5efd8e525d971b482a0fee94a7e7ff'
         '61912d101dc7c68c7314882b80621454'
         'dd799b9d55045d950d407740d4a9a5c5')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 "$srcdir/klipper.service" "$pkgdir/usr/lib/systemd/system/klipper.service"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/klipper.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/klipper.conf"
	install -dm755 "$pkgdir/opt/klipper"
	install -dm775 "$pkgdir/etc/klipper"
	python2 scripts/make_version.py ARCHLINUX > klippy/.version
    python2 -m compileall klippy
	python2 klippy/chelper/__init__.py
	GLOBIGNORE=.git cp -r * "$pkgdir/opt/klipper"

	echo
	echo "Before launching, copy one of example configs in /opt/klipper/config/ to /etc/klipper/klipper.cfg and adjust it to suit your printer"
}
