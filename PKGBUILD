# mkspiffs - Tool to build and unpack SPIFFS images
# Maintainer: Martin Thierer <thierer@web.de>
# Contributor: Christian Hammacher <bmasterc@gmail.com>

pkgname=mkspiffs-git
pkgver=0.2.3.r7.f248296
pkgrel=1
pkgdesc="Tool to build and unpack SPIFFS images"
arch=('x86' 'x86_64')
url="https://github.com/igrr/mkspiffs"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'gcc')
provides=("mkspiffs")
conflicts=("mkspiffs")
source=(
	'git+https://github.com/igrr/mkspiffs.git'
	'git+https://github.com/pellepl/spiffs.git')
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
	make clean
	make dist CPPFLAGS="-DSPIFFS_OBJ_META_LEN=4" BUILD_CONFIG_NAME=-custom
}

check() {
	cd "$srcdir/mkspiffs"
	make test
}

package() {
	# This package provides only a single executable
	install -D -m755 $srcdir/mkspiffs/mkspiffs $pkgdir/usr/bin/mkspiffs
	install -D -m644 $srcdir/mkspiffs/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
