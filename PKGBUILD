# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-builder
pkgver=1.3.21
pkgrel=2
pkgdesc="A command line tool for compiling Arduino sketches"
arch=('i686' 'x86_64')
url="https://github.com/arduino/arduino-builder"
license=('GPL')
depends=('')
makedepends=('go' 'git' 'unzip')
optdepends=('ctags')
options=(!strip)
source=("https://github.com/arduino/arduino-builder/archive/${pkgver}.tar.gz")
sha512sums=('9d724585294f1107fb0d1f55cfbbe831a15e11460d5152329fb76e2794ac8b98f62b0c149cb8bb6de8cbe6090222c0f199478f7030c6505f49561e891a27ed04')

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
