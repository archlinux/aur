# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-builder
pkgver=1.5.1
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
sha512sums=('0b35a768cf20e13a6dea73f81451462f578cbdf5fe0071b28eb7916e3cd225bdfd850d18289be590534f95cdebeb3d1da9e2f116ffe81a9a193374b7997a7da1'
            'SKIP')
validpgpkeys=('326567C1C6B288DF32CB061A95FA6F43E21188C4') # Arduino Packages <support@arduino.cc>

build() {
	# TODO Symlink will fail in test https://github.com/golang/go/issues/15507
	#mkdir -p "${srcdir}/build/src/github.com/arduino/arduino-builder"
	#ln -sf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build/src/github.com/arduino/arduino-builder"
	#cp -a "${srcdir}/${pkgname}-${pkgver}/." "${srcdir}/build/src/github.com/arduino/arduino-builder"
	# export GOPATH="${srcdir}/build"
	#cd "${srcdir}/build"

	# go get github.com/go-errors/errors
	# go get github.com/stretchr/testify
	# go get github.com/jstemmer/go-junit-report
	# go get -u github.com/arduino/go-paths-helper
	# go get -u github.com/arduino/go-properties-orderedmap
	# go get -u github.com/arduino/go-timeutils
	# go get google.golang.org/grpc
	# go get github.com/golang/protobuf/proto
	# go get golang.org/x/net/context
	# go get github.com/fsnotify/fsnotify
	# go get github.com/schollz/closestmatch
	# go get github.com/arduino/arduino-cli
	# go build github.com/arduino/arduino-builder

	cd "${srcdir}/${pkgname}-${pkgver}"
	go build

	# TODO Fix ctags test environment at build time
	# https://github.com/arduino/arduino-builder/issues/202
}

check() {
	# Test will download ~1GB of testfiles
	echo "Running check() for the first time might take a while as it downloads ~1GB of testfiles. Skip with --nocheck"
	#export GOPATH="${srcdir}/build"
	cd "${srcdir}/${pkgname}-${pkgver}"
	#go test -timeout 60m ...
}

package() {
	# Fix platform.txt for arch arduino-ctags
	# cd "${srcdir}/build/src/github.com/arduino/arduino-builder/hardware"
	# sed -i 's#^tools.ctags.path=.*#tools.ctags.path=/usr/bin#' platform.txt
	# sed -i 's#^tools.ctags.cmd.path=.*#tools.ctags.cmd.path={path}/arduino-ctags#' platform.txt

	#cd "${srcdir}/build"
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Install main tool
	install -Dm755 "arduino-builder" "${pkgdir}/usr/bin/arduino-builder"

	# Install platform.txt files
	# install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "${srcdir}"/build/src/github.com/arduino/arduino-builder/hardware/*

	# Add documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${pkgname}-${pkgver}/README.md"
}
