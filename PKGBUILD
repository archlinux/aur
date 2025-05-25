# Maintainer: Darrell Enns <darrell at darrellenns dot com>
# Contributor: qubidt <qubidt at gmail dot com>
# Contributor: loredan13
# Contributor: lf <packages at lfcode dot ca>
pkgname=ender3-v3-se-klipper-with-display-git
_pkgname=klipper
pkgver=r5834.94a5d37f
pkgrel=1
pkgdesc="3D printer firmware with motion planning on the host. Fork for Ender 3 V3 SE + screen support."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jpcurti/ender3-v3-se-klipper-with-display"
license=('GPL3')
groups=()
depends=(
	python-cffi
	python-pyserial
	python-greenlet
	python-jinja
	python-can
	libusb
)
optdepends=(
	'ncurses: for choosing compilation config'
	'avrdude: for flashing firmware on AVR MCU'
	'stm32flash: for flashing firmware on STM MCU'
	'avr-gcc: for AVR MCU firmware compilation'
	'avr-binutils: for AVR MCU firmware compilation'
	'avr-libc: for AVR MCU firmware compilation'
	'python-numpy: for resonance measurement'
	'python-matplotlib: for resonance measurement'
	'dfu-util: for flashing firmware on STM32 MCUs'
)
optdepends_x86_64=(
	'arm-none-eabi-newlib: for ARM MCU firmware compilation'
	'arm-none-eabi-gcc: for ARM MCU firmware compilation'
	'arm-none-eabi-binutils: for ARM MCU firmware compilation'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=("etc/${_pkgname}/klipper.cfg"
        "usr/lib/klipper/.config")
options=()
install='klipper.install'
source=("${_pkgname}::git+https://github.com/jpcurti/ender3-v3-se-klipper-with-display"
        'use-system-wide-python-in-flash-sdcard.sh.patch'
        'klipper.service'
        'sysusers.conf'
        'tmpfiles.conf')
noextract=()
md5sums=('SKIP'
         '6804cf8a81091a5c43d8985e4791582f'
         '4ccfb9669d304b99146b92a4912ae1fd'
         'cf3715af9f53cc1660e412abe3697342'
         'd707e8986ed6cf189461f03bdaf365aa')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
       cd "$srcdir/$_pkgname"
       patch -p1 < "$srcdir/use-system-wide-python-in-flash-sdcard.sh.patch"
}

build() {
	cd "$srcdir/$_pkgname"
	python -m compileall klippy
	python klippy/chelper/__init__.py
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 "$srcdir/klipper.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -m775 -d "$pkgdir/usr/lib/${_pkgname}"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/docs"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/config"
	install -m775 -d "$pkgdir/usr/lib/${_pkgname}/klippy"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/lib"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/src"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/scripts"
	install -m2775 -d "$pkgdir/etc/${_pkgname}"
	install -m2775 -d "$pkgdir/usr/lib/${_pkgname}/out"
	install -m2775 -d "$pkgdir/var/lib/${_pkgname}"

	cp -ra "$srcdir/${_pkgname}/docs"/* "$pkgdir/usr/lib/${_pkgname}/docs"/
	cp -ra "$srcdir/${_pkgname}/config/"* "$pkgdir/usr/lib/${_pkgname}/config"/
	cp -ra "$srcdir/${_pkgname}/klippy/"* "$pkgdir/usr/lib/${_pkgname}/klippy"/
	cp -ra "$srcdir/${_pkgname}/scripts/"* "$pkgdir/usr/lib/${_pkgname}/scripts"/
	cp -ra "$srcdir/${_pkgname}/lib/"* "$pkgdir/usr/lib/${_pkgname}/lib"/
	cp -ra "$srcdir/${_pkgname}/Makefile" "$pkgdir/usr/lib/${_pkgname}"/
	cp -ra "$srcdir/${_pkgname}/src/"* "$pkgdir/usr/lib/${_pkgname}/src"/

	mkdir -p "$pkgdir//usr/share/doc"
	ln -s "/usr/lib/${_pkgname}/docs" "$pkgdir/usr/share/doc/${_pkgname}"

	touch "$srcdir/${_pkgname}/.config"
	install -m664 "$srcdir/${_pkgname}/.config" "$pkgdir/usr/lib/${_pkgname}/.config"

	python scripts/make_version.py ARCHLINUX > "$pkgdir/usr/lib/${_pkgname}/klippy/.version"
}
