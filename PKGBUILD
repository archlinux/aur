# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-builder
pkgver=1.3.25
pkgrel=3
pkgdesc="A command line tool for compiling Arduino sketches"
arch=('x86_64')
url="https://github.com/arduino/arduino-builder"
license=('GPL')
depends=('arduino-ctags')
makedepends=('go-pie' 'git' 'unzip')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arduino/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3740530800f8a3cfe1fe20a91579e6b632b76c2c4ace68c7b178a2d234032d5887abee3d0360c3039f2fec912a0d5cabe948bf930a7d9ea23221625456ad5357')

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
