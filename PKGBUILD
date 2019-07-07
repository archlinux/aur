# mkspiffs - Tool to build and unpack SPIFFS images for the ESP8266
# Maintainer: Christian Hammacher <bmasterc@gmail.com>

pkgname=mkspiffs-git
pkgver=0.2.3.r6.983970e
pkgrel=1
pkgdesc="Tool to build and unpack SPIFFS images for the ESP8266"
arch=('x86' 'x86_64')
url="https://github.com/igrr/mkspiffs"
license=('MIT')
depends=()
makedepends=('git' 'gcc')
provides=("mkspiffs")
conflicts=("mkspiffs")
source=(
	'git://github.com/igrr/mkspiffs.git'
	'git://github.com/pellepl/spiffs.git')
md5sums=('SKIP'
         'SKIP')

# Handle submodule as of
# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules
prepare() {
	cd $srcdir/mkspiffs
	git submodule init
	git config submodule.spiffs.url $srcdir/spiffs
	git submodule update
}

pkgver() {
	cd "$srcdir/mkspiffs"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/mkspiffs"
	make
}

check() {
	cd "$srcdir/mkspiffs"
	make test
}

package() {
	# This package provides only a single executable
	install -D -m755 $srcdir/mkspiffs/mkspiffs $pkgdir/usr/bin/mkspiffs
}
