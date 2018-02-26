# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

_EFI_ARCH="ia32"

_pkgver="3.0.6"
pkgname="lib32-gnu-efi-libs"
pkgver="${_pkgver}"
pkgrel="1"
pkgdesc="Library for building UEFI Applications using GNU toolchain"
url="http://sourceforge.net/projects/gnu-efi/"
license=('GPL')
arch=('x86_64')
options=('!strip' '!makeflags' '!buildflags')
makedepends=('pciutils')
source=("http://download.sourceforge.net/gnu-efi/gnu-efi-${pkgver}.tar.bz2")
sha1sums=('9f0f75b64c84423f3386da6f3200f5ed7471d9cb')

# override the CFLAGS to build a libefi compatible with i586
_CFLAGS="-march=i586 -mtune=i586 -fno-stack-protector"

build() {
	cd "${srcdir}/gnu-efi-${_pkgver}/"

	CFLAGS="${_CFLAGS}" make ARCH=ia32 lib gnuefi inc #apps
}

package() {
	cd "${srcdir}/gnu-efi-${_pkgver}/"

	CFLAGS="${_CFLAGS}" make ARCH=ia32 INSTALLROOT="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib32" install
	rm -rf "${pkgdir}/usr/include/efi"/{*.h,protocol}

	# install -d "${pkgdir}/usr/share/gnu-efi/apps/${_EFI_ARCH}/"
	# install -D -m0644 "${srcdir}/gnu-efi-${_pkgver}/${_EFI_ARCH}/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/apps/${_EFI_ARCH}/"
}
