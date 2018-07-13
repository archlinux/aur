# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=nct677x-git
_pkgname=nct6775
pkgver=r158.339e0cc
pkgrel=1
pkgdesc="Nuvoton module for nct677x chips not yet supported in the kernel."
arch=('x86_64')
url="https://github.com/groeck/nct6775"
license=('GPLv2')
depends=('linux>=4.17' 'linux<4.18')
makedepends=('linux-headers>=4.17' 'linux-headers<4.18' 'git')
_extramodules="extramodules-4.17-ARCH"
source=("git://github.com/groeck/nct6775.git")
md5sums=('SKIP')
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

pkgver() {
	cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# fix for Arch
	# 1) set up the TARGET to be the running kernel
	# 2) headers location
	# 3) remove shell dependency on running kernel to figure kern ver
	sed -i -e "/^TARGET/ s,\$(shell uname -r),$_kernver," \
	-i -e '/^KERNEL_BUILD/ s,src/linux-headers-,lib/modules/,' \
	-i -e '/^KERNEL_BUILD/ s,TARGET),TARGET)/build,' "$_pkgname/Makefile" 
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	gzip -9 nct6775.ko
	
	# since this package has already been accepted upstream, we must use the
	# proper directory to avoid overwritting a file owned by core/linux
	# https://bbs.archlinux.org/viewtopic.php?pid=1475510#p1475510
	install -Dm644 nct6775.ko.gz \
		"$pkgdir/usr/lib/modules/$_kernver/updates/nct6775.ko.gz"
}
