# Maintainer: qubidt <qubidt at gmail dot com>
# Contributor: loredan13
# Contributor: lf <packages at lfcode dot ca>
pkgname=klipper-py3
_pkgname=klipper
pkgver=0.10.0
pkgrel=1
pkgdesc="3D printer firmware with motion planning on the host"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.klipper3d.org/"
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Klipper3d/klipper/archive/refs/tags/v${pkgver}.tar.gz"
        'klipper.service'
        'sysusers.conf'
        'tmpfiles.conf'
        # data dictionary from https://github.com/Klipper3d/klipper/issues/1438
        'klipper-dict.tar.gz::https://github.com/Klipper3d/klipper/files/7491378/klipper-dict-20211106.tar.gz')
noextract=()
md5sums=('5719563d220f09898f3d3c655929b2f6'
         '05777aeafefe89aed2448df45e5bb6ea'
         'cf3715af9f53cc1660e412abe3697342'
         '4c058f09014cf6a3995b761ef81672b1'
         '9d0fde55e3e8240bc26b476519018195')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m compileall klippy
	python klippy/chelper/__init__.py
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python scripts/test_klippy.py -d "${srcdir}/dict" -t test/ test/klippy/*.test
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm644 "$srcdir/klipper.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -m755 -d "$pkgdir/usr/share/doc/${_pkgname}"
	install -m755 -d "$pkgdir/usr/share/${_pkgname}/scripts"
	install -m755 -d "$pkgdir/usr/share/${_pkgname}/examples"
	install -m775 -d "$pkgdir/usr/lib/${_pkgname}/klippy"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/lib"
	install -m755 -d "$pkgdir/usr/lib/${_pkgname}/src"
	install -m2775 -d "$pkgdir/etc/${_pkgname}"
	install -m2775 -d "$pkgdir/usr/lib/out/${_pkgname}"
	install -m2755 -d "$pkgdir/var/lib/${_pkgname}"

	cp -ra "$srcdir/${_pkgname}/docs"/* "$pkgdir/usr/share/doc/${_pkgname}"/
	cp -ra "$srcdir/${_pkgname}/scripts/"* "$pkgdir/usr/share/${_pkgname}/scripts"/
	cp -ra "$srcdir/${_pkgname}/config/"* "$pkgdir/usr/share/${_pkgname}/examples"/
	cp -ra "$srcdir/${_pkgname}/klippy/"* "$pkgdir/usr/lib/${_pkgname}/klippy"/
	cp -ra "$srcdir/${_pkgname}/lib/"* "$pkgdir/usr/lib/${_pkgname}/lib"/
	cp -ra "$srcdir/${_pkgname}/Makefile" "$pkgdir/usr/lib/${_pkgname}"/
	cp -ra "$srcdir/${_pkgname}/src/"* "$pkgdir/usr/lib/${_pkgname}/src"/

	python scripts/make_version.py ARCHLINUX > "$pkgdir/usr/lib/${_pkgname}/klippy/.version"
}
