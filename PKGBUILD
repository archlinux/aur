# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-builder
pkgver=1.5.2
pkgrel=2
pkgdesc="A command line tool for compiling Arduino sketches"
arch=('x86_64')
url="https://github.com/arduino/arduino-builder"
license=('GPL')
depends=('arduino-ctags')
makedepends=('go-pie' 'git' 'unzip')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/arduino/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
		"${pkgname}-${pkgver}.tar.xz.asc::https://github.com/arduino/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('5cced4b0b6b284266e28b659fb96d6c8a3ad23ff834f48876d8ab59d12a31d406ef5283acc350cab2196086cbc951f78ad7c2c7355bd77ba05d921ff50d15616'
            'SKIP')
validpgpkeys=('326567C1C6B288DF32CB061A95FA6F43E21188C4') # Arduino Packages <support@arduino.cc>

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build

	# TODO Fix ctags test environment at build time
	# https://github.com/arduino/arduino-builder/issues/202
}

#check()
#{
	# Test will download ~1GB of testfiles
	#echo "Running check() for the first time might take a while as it downloads ~1GB of testfiles. Skip with --nocheck"
	#cd "${srcdir}/${pkgname}-${pkgver}"
	#go test -timeout 60m github.com/arduino/arduino-cli/...
#}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Install main tool
	install -Dm755 "arduino-builder" "${pkgdir}/usr/bin/arduino-builder"

	# Install platform.txt files
	install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "${srcdir}"/${pkgname}-${pkgver}/hardware/*

	# Fix platform.txt for arch arduino-ctags
	echo 'tools.ctags.path=/usr/bin' > "${pkgdir}/usr/share/arduino/hardware/platform.txt"
	echo 'tools.ctags.cmd.path={path}/arduino-ctags' >> "${pkgdir}/usr/share/arduino/hardware/platform.txt"

	# Add documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${pkgname}-${pkgver}/README.md"
}
