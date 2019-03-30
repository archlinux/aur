# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-builder
pkgver=1.4.4
pkgrel=1
pkgdesc="A command line tool for compiling Arduino sketches"
arch=('x86_64')
url="https://github.com/arduino/arduino-builder"
license=('GPL')
depends=('arduino-ctags')
makedepends=('go-pie' 'git' 'unzip')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/arduino/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
		"${pkgname}-${pkgver}.tar.xz.asc::https://github.com/arduino/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('306bb7330036c188b02e3fa85da8b595f91426eea177a5bc59098c8ee497549af41ce92fc15ae6ac8aa5eb6293b9ab52104ea7263ef801eb75150d7efddc7038'
            'SKIP')
validpgpkeys=('326567C1C6B288DF32CB061A95FA6F43E21188C4') # Arduino Packages <support@arduino.cc>

build() {
	# TODO Symlink will fail in test https://github.com/golang/go/issues/15507
	mkdir -p "${srcdir}/build/src/github.com/arduino/arduino-builder"
	#ln -sf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build/src/github.com/arduino/arduino-builder"
	cp -a "${srcdir}/${pkgname}-${pkgver}/." "${srcdir}/build/src/github.com/arduino/arduino-builder"
	export GOPATH="${srcdir}/build"
	cd "${srcdir}/build"

	go get github.com/go-errors/errors
	go get github.com/stretchr/testify
	go get github.com/jstemmer/go-junit-report
	go get -u github.com/arduino/go-properties-map
	go get -u github.com/arduino/go-timeutils
	go get google.golang.org/grpc
	go get github.com/golang/protobuf/proto
	go get golang.org/x/net/context
	go get github.com/fsnotify/fsnotify
	go get github.com/schollz/closestmatch
	#go get github.com/arduino/arduino-builder
	go build github.com/arduino/arduino-builder/arduino-builder

	# TODO Fix ctags test environment at build time
	# https://github.com/arduino/arduino-builder/issues/202
}

check() {
	# Test will download ~1GB of testfiles
	echo "Running check() for the first time might take a while as it downloads ~1GB of testfiles. Skip with --nocheck"
	export GOPATH="${srcdir}/build"
	go test -timeout 60m github.com/arduino/arduino-builder/...
}

package() {
	# Fix platform.txt for arch arduino-ctags
	cd "${srcdir}/build/src/github.com/arduino/arduino-builder/hardware"
	sed -i 's#^tools.ctags.path=.*#tools.ctags.path=/usr/bin#' platform.txt
	sed -i 's#^tools.ctags.cmd.path=.*#tools.ctags.cmd.path={path}/arduino-ctags#' platform.txt

	cd "${srcdir}/build"

	# Install main tool
	install -Dm755 "arduino-builder" "${pkgdir}/usr/bin/arduino-builder"

	# Install platform.txt files
	install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "${srcdir}"/build/src/github.com/arduino/arduino-builder/hardware/*

	# Add documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${pkgname}-${pkgver}/README.md"
}
