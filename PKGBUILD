# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-builder
pkgver=1.3.22
pkgrel=2
pkgdesc="A command line tool for compiling Arduino sketches"
arch=('i686' 'x86_64')
url="https://github.com/arduino/arduino-builder"
license=('GPL')
makedepends=('go' 'git' 'unzip')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arduino/arduino-builder/archive/${pkgver}.tar.gz")
sha512sums=('1e569825ea9ab4915ff676579480d8806e4a14ff1afd284fd3e839d11fda6c049ec0f0cbb832c8eb034364fac47ab7d94a01bd0b40f167526da968d13fddabf0')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export GOPATH="${srcdir}/${pkgname}-${pkgver}"
	go get -fix github.com/go-errors/errors
	go get -fix github.com/stretchr/testify
	go get -fix github.com/jstemmer/go-junit-report
	go build arduino.cc/arduino-builder
}

check() {
	# Test will download ~1GB of testfiles
    echo "Running check() for the first time might take a while as it downloads ~1GB of testfiles. Skip with --nocheck"
	export GOPATH="${srcdir}/${pkgname}-${pkgver}"
	go test -timeout 60m arduino.cc/...
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Install main tool
	install -Dm755 "arduino-builder" "${pkgdir}/usr/bin/arduino-builder"

	# Add documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
