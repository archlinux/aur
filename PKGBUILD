_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.045.08
pkgrel=3
pkgdesc="A kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
#source=(https://github.com/mtorromeo/r8168/archive/$pkgver/r8168-$pkgver.tar.gz
source=(http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0010-r8168-8.045.08.tar.bz2
        dkms.conf
        linux-4.15-2.patch)
install=r8168-dkms.install

prepare() {
	cd "r8168-$pkgver"
	patch -p1 -i "$srcdir/linux-4.15-2.patch"
}
 

package() {
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
		-e "s/@PKGVER@/${_pkgbase}/g" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "${_pkgbase}-$pkgver"
	rm src/Makefile_linux24x
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
sha256sums=('29a17aa12b80786cf016799bbe01da8fdd8ee0a4e90b18e740935d81046ec74d'
            '260d8142e944f3144cbc704534e662d427318d8b32dc7a2852a855be72e8d763'
            '483a698f443dae45f2ee56e2f66c4efe26ea678a82ff29fec4258a55325154fd')
