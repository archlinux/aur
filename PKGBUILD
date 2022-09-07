# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Important: the versions of the packages linux and linux-header must match

pkgname=riffa-git
pkgver=2.2.2.git20220907
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='RIFFA: A Reusable Integration Framework For FPGA Accelerators'
url='http://riffa.ucsd.edu/'
license=('custom')

# Note : Dependency is on currently running kernel, which the compilation based on, NOT on the kernel package installed
_local_linux_version=$(uname -r | sed -r 's/(-arch)/.arch/')

depends=("linux=$_local_linux_version")
makedepends=("linux-headers=$_local_linux_version")
install='riffa.install'

source=(
	#"git+https://github.com/drichmond/riffa.git"
	"git+https://github.com/marzoul/riffa.git"
	'riffa.install'
	'patch-subdirs.patch'
	'99-riffa.rules'
)
# Note: No check for riffa.install because it is modified by the package() function.
sha256sums=(
	'SKIP'
	'SKIP'
	'102cc4edf8008a193faf15dfe507d8cdb223036de6059b4c8f495b69ead246ac'
	'6dd2aee2ba41d68419004f7a80b87fbd6a1d8c723d5a2b3d293fe460a7364676'
)

pkgver() {
	cd "${srcdir}/riffa"

	# RIFFA version (extracted from Makefile)
	local _distver=$(sed -n -e 's/^RELEASE_VER=\([0-9.a-z]*\)\s*$/\1/p' Makefile)
	# Date of the last git commit
	local _gitver=$(git log -n 1 --date=short | sed -n -e 's/^Date:\s*\([0-9-]*\)\s*$/\1/p' | tr -d -)

	echo $_distver.git$_gitver;
}

prepare() {
	cd "${srcdir}/riffa"

	# At least for Linux >= 5.12
	patch -p0 -N -i ../../patch-subdirs.patch

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

	install -Dm0755 "${srcdir}/99-riffa.rules" "${pkgdir}/etc/udev/rules.d/99-riffa.rules"

	cd "${srcdir}/riffa/driver/linux"

	install -D riffa.ko "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/riffa/riffa.ko"

	install -Dm0644 riffa.h        "${pkgdir}/usr/include/riffa.h"
	install -Dm0644 riffa_driver.h "${pkgdir}/usr/include/riffa_driver.h"

	install -Dm0755 libriffa.so.1.0 "${pkgdir}/usr/lib/libriffa.so.1.0"
	ln -sf "/usr/lib/libriffa.so.1.0" "${pkgdir}/usr/lib/libriffa.so.1"
	ln -sf "/usr/lib/libriffa.so.1.0" "${pkgdir}/usr/lib/libriffa.so"

}
