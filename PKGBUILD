# Maintainer: Yuri Nudelman <yuranu@gmail.com>
pkgname=crash-lzo-git
pkgver=7.2.8.r7.g007f844
pkgrel=1
pkgdesc="Linux kernel crashdump analysis tool with lzo"
arch=('i686' 'x86_64')
url="https://github.com/crash-utility/crash"
license=('GPL')
makedepends=('git' 'wget')
depends=('lzo' 'xz' 'ncurses' 'zlib')
conflicts=('crash')
source=('git+https://github.com/crash-utility/crash')
md5sums=('SKIP')

pkgver() {
	cd crash
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd crash
	# Crash makefile will use wget to grab sources of gdb in compile time
	# So we may come 2 this point with a couple of error states:
	# 1. Sources archive partially validated
	# 2. Sources archive partially extracted
	# Download is pretty long, so wouldn't want to do it if not needed, so check tar validity
	# and re-download in case of a problem.
	# For the extract, there is no <good> way to verify it, reextract.
	if ls gdb-*.tar.gz >/dev/null 2>/dev/null ; then
		if ! tar -tvf gdb-*.tar.gz >/dev/null 2>/dev/null ; then
			echo 'Found broken gdb download, deleting'
			rm gdb-*.tar.gz
		else
			echo 'Found valid gdb download, validating extract'
			tar -xvf gdb-*.tar.gz
		fi
	fi
}

build() {
	cd crash
	CPPFLAGS="$CPPFLAGS -O2" make lzo
}

package() {
	cd crash
	mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man8 "$pkgdir"/usr/include/crash/
	install crash "$pkgdir"/usr/bin/
	install crash.8 "$pkgdir"/usr/share/man/man8/
	install defs.h "$pkgdir"/usr/include/crash/
}
