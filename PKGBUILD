# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Important: the versions of the packages linux and linux-header must match

pkgname=riffa-git
pkgver=2.2.2.git20161214
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='RIFFA: A Reusable Integration Framework For FPGA Accelerators'
url='http://riffa.ucsd.edu/'
license=('custom')

makedepends=('linux-headers')
install='riffa.install'

source=(
	#"git://github.com/drichmond/riffa.git"
	"git://github.com/marzoul/riffa.git"
	'riffa.install'
	'99-riffa.rules'
)
# Note: No check for riffa.install because it is modified by the package() function.
md5sums=(
	'SKIP'
	'SKIP'
	'd37355781ef46d1f4aa21cd169964f08'
)

pkgver() {
	cd "${srcdir}/riffa"

	# RIFFA version (extracted from Makefile)
	_distver=`sed -n -e 's/^RELEASE_VER=\([0-9.a-z]*\)\s*$/\1/p' Makefile`
	# Date of the last git commit
	_gitver=`git log -n 1 --date=short | sed -n -e 's/^Date:\s*\([0-9-]*\)\s*$/\1/p' | tr -d -`

	echo $_distver.git$_gitver;
}

build() {
	cd "${srcdir}/riffa/driver/linux"

	# Note: Use the debug target to have debug messages in system log at runtime.
	# Warning from RIFFA 2.2.0 documentation:
	#   However they pollute your system log and incur some overhead.
	#   So you may want to install the non-debug version after you’ve completed development.

	make
	#make debug

}

package() {
	# Note: Can't use the riffa provided install commands because all is hardcoded for Red Hat / Debian

	_extramodules=extramodules-`uname -r | sed -e 's/\([[:digit:]]*\).\([[:digit:]]\).*/\1.\2/g'`-ARCH
	sed --follow-symlinks -i -e 's/^\([[:blank:]]*EXTRAMODULES=\).*$/\1'"$_extramodules"'/g' "${srcdir}/riffa.install"

	install -Dm0755 "${srcdir}/99-riffa.rules" "${pkgdir}/etc/udev/rules.d/99-riffa.rules"

	cd "${srcdir}/riffa/driver/linux"

	install -D riffa.ko "${pkgdir}/usr/lib/modules/$_extramodules/riffa.ko"

	install -Dm0644 riffa.h        "${pkgdir}/usr/include/riffa.h"
	install -Dm0644 riffa_driver.h "${pkgdir}/usr/include/riffa_driver.h"

	install -Dm0755 libriffa.so.1.0 "${pkgdir}/usr/lib/libriffa.so.1.0"
	ln -sf "/usr/lib/libriffa.so.1.0" "${pkgdir}/usr/lib/libriffa.so.1"
	ln -sf "/usr/lib/libriffa.so.1.0" "${pkgdir}/usr/lib/libriffa.so"

}
