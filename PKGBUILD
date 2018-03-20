# Maintainer: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-2018.02-arm-v7a-linux-gnueabihf
_srcname=OSELAS.Toolchain
pkgver=2018.02.0
pkgrel=1
pkgdesc="OSELAS cross toolchain for ARMv7a hardfloat, pinned 2018.02 release"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses')
options=('!strip')
makedepends=('ptxdist-2018.02>=2018.02.0' 'gcc>=7.2.1')
source=("https://public.pengutronix.de/oselas/toolchain/OSELAS.Toolchain-${pkgver}.tar.bz2")
sha256sums=('a5292724dc06e814d8f6d4712146e712d77d48872335595eca12ce80f83adb92')

build() {
	cd "${srcdir}/${_srcname}-${pkgver}"

	CONF="ptxconfigs/arm-v7a-linux-gnueabihf_gcc-7.3.1_glibc-2.27_binutils-2.30_kernel-4.15-sanitized.ptxconfig"
	sed -i "$CONF" \
		-e "s/^PTXCONF_DESTDIR=\".*\"/PTXCONF_DESTDIR=\"${srcdir//\//\\\/}\/dest\"/"
	ptxdist-2018.02 select "$CONF"

	# fetch all sources first to avoid download fail during build phase
	ptxdist-2018.02 get
	ptxdist-2018.02 go -q -j
}

package() {
	cp -a ${srcdir}/dest/* ${pkgdir}
}

# vim: ts=4
