# Maintainer: qubidt <qubidt at gmail dot com>
# Contributor: loredan13
# Contributor: lf <packages at lfcode dot ca>
pkgname=klipper-py3-git
_pkgname=klipper
pkgver=r4325.bea20278
pkgrel=1
pkgdesc="3D printer firmware with motion planning on the host"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/KevinOConnor/klipper"
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
)
optdepends_x86_64=(
	'arm-none-eabi-newlib: for ARM MCU firmware compilation'
	'arm-none-eabi-gcc: for ARM MCU firmware compilation'
	'arm-none-eabi-binutils: for ARM MCU firmware compilation'
)
makedepends=('git')
provides=("$_pkgname")
replaces=()
backup=("etc/${_pkgname}/klipper.cfg")
options=()
install='klipper.install'
source=("${_pkgname}::git+https://github.com/Klipper3d/klipper"
        'klipper.service'
        'sysusers.conf'
        'tmpfiles.conf'
        # data dictionary from https://github.com/Klipper3d/klipper/issues/1438
        'klipper-dict.tar.gz::https://github.com/Klipper3d/klipper/files/7491378/klipper-dict-20211106.tar.gz')
noextract=()
md5sums=('SKIP'
         '135bc8490fafe2d670c619b412deebef'
         'cf3715af9f53cc1660e412abe3697342'
         '94100ed3da74a98bdaed27f395621511'
         '9d0fde55e3e8240bc26b476519018195')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python -m compileall klippy
	python klippy/chelper/__init__.py
}

check() {
	cd "$srcdir/$_pkgname"
	python scripts/test_klippy.py -d "${srcdir}/dict" -t test/ test/klippy/*.test
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 "$srcdir/klipper.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -m755 -d "$pkgdir/usr/share/doc/${_pkgname}"
	install -m755 -d "$pkgdir/usr/share/${_pkgname}/scripts"
	install -m755 -d "$pkgdir/usr/share/${_pkgname}/examples"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/klippy"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/lib"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/src"
	install -m755 -d "$pkgdir/etc/${_pkgname}"
	install -m755 -d "$pkgdir/var/lib/${_pkgname}"

	cp -ra "$srcdir/${_pkgname}/docs"/* "$pkgdir/usr/share/doc/${_pkgname}"/
	cp -ra "$srcdir/${_pkgname}/scripts/"* "$pkgdir/usr/share/${_pkgname}/scripts"/
	cp -ra "$srcdir/${_pkgname}/config/"* "$pkgdir/usr/share/${_pkgname}/examples"/
	cp -ra "$srcdir/${_pkgname}/klippy/"* "$pkgdir/usr/lib/${_pkgname}/klippy"/
	cp -ra "$srcdir/${_pkgname}/lib/"* "$pkgdir/usr/lib/${_pkgname}/lib"/
	cp -ra "$srcdir/${_pkgname}/Makefile" "$pkgdir/usr/lib/${_pkgname}"/
	cp -ra "$srcdir/${_pkgname}/src/"* "$pkgdir/usr/lib/${_pkgname}/src"/

	python scripts/make_version.py ARCHLINUX > "$pkgdir/usr/lib/${_pkgname}/klippy/.version"
}
