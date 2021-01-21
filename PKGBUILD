# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
pkgname=contiki
pkgver=3.1
pkgrel=2
pkgdesc="Contiki, the open source OS for the Internet of Things"
arch=('x86_64')
url="https://github.com/contiki-os/contiki"
license=('BSD')
depends=('ant' 'ncurses' 'jdk8-openjdk')
makedepends=('unzip' 'rsync')
optdepends=(
	'arm-none-eabi-gcc: compile code for CC2538-based platforms'
	'msp430-elf-gcc: compile code for MSP430'
)
provides=("${pkgname}")
conflicts=()
epoch=1
source=(
	"${pkgname}::git+https://github.com/contiki-os/contiki.git#branch=release-3-1"
	"example-makefile"
	"hello-world-test.patch"
	"run-cooja.sh"
)
options=(!strip)

sha256sums=(
	'SKIP'
	'ff5cedd12ab776ffd6574d8da892ac3b12c9327be3285df851bcd5c08fa3125f'
	'd9b72876e9a4f69f8036c5ef594f0547d2c28b6ba83bb682a25932a88c96238f'
	'614f49c22522a738be102a93972d0f075864ae6580c7daa47ad0bf69f7969880'
)

prepare() {
	cd "${pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "${pkgname}/tools/cooja"
	ant compile jar
}

check() {
	patch -p1 < "hello-world-test.patch"
	cd "${pkgname}/examples/hello-world"
	make
	printf "Running hello-world.native\n"
	./hello-world.native </dev/null >/dev/null
	make clean
	rm -f hello-world.native
	cd "${srcdir}"
	patch -p1 -R < "hello-world-test.patch"
}

package() {
	install -m644 -d "${pkgdir}/usr/share/${pkgname}/"
	rsync -ravq "${srcdir}/${pkgname}/" "${pkgdir}/usr/share/${pkgname}/"
	install -m644 -D "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "${srcdir}/example-makefile" "${pkgdir}/usr/share/${pkgname}/example-makefile"
	install -m755 -D "${srcdir}/run-cooja.sh" "${pkgdir}/usr/bin/cooja"
}
