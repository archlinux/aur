# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-builder
pkgver=1.3.25
pkgrel=1
pkgdesc="A command line tool for compiling Arduino sketches"
arch=('i686' 'x86_64')
url="https://github.com/arduino/arduino-builder"
license=('GPL')
depends=('arduino-ctags')
makedepends=('go' 'git' 'unzip')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arduino/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a64caa7e8ce96d6e5cd32e5b35bcc51c8dba908a14ddea4c95a9e1f8853009c454805777d483fe94db3595e267746c22b475beab8fc511b0ce2470d216eeb55a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export GOPATH="${srcdir}/${pkgname}-${pkgver}"
	go get -fix github.com/go-errors/errors
	go get -fix github.com/stretchr/testify
	go get -fix github.com/jstemmer/go-junit-report
	go build arduino.cc/arduino-builder

	# TODO Fix ctags test environment at build time
	# https://github.com/arduino/arduino-builder/issues/202
}

check() {
	# Test will download ~1GB of testfiles
	echo "Running check() for the first time might take a while as it downloads ~1GB of testfiles. Skip with --nocheck"
	export GOPATH="${srcdir}/${pkgname}-${pkgver}"
	go test -timeout 60m arduino.cc/...
}

package() {
	# Fix platform.txt for arch arduino-ctags
	cd "${srcdir}/${pkgname}-${pkgver}/src/arduino.cc/builder/hardware/"
	sed -i 's#^tools.ctags.path=.*#tools.ctags.path=/usr/bin#' platform.txt
	sed -i 's#^tools.ctags.cmd.path=.*#tools.ctags.cmd.path={path}/arduino-ctags#' platform.txt

	cd "${srcdir}/${pkgname}-${pkgver}"

	# Install main tool
	install -Dm755 "arduino-builder" "${pkgdir}/usr/bin/arduino-builder"

	# Install platform.txt files
	install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "${srcdir}/${pkgname}-${pkgver}"/src/arduino.cc/builder/hardware/*

	# Add documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
