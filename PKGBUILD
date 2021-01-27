_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.4.10
pkgrel=1
pkgdesc="aquantia multigigabit nic driver - \"development preview\""
url="https://github.com/Aquantia/AQtion"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=("${_pkgbase}")
commit="0168526fadfcf86a1c5cc7f332f4e735e934f53c"
source=("https://github.com/Aquantia/AQtion/archive/$commit.tar.gz"
        'net-v5-aquantia-Remove-the-build_skb-path.diff::http://patchwork.ozlabs.org/project/netdev/patch/MWHPR1001MB23184F3EAFA413E0D1910EC9E8FC0@MWHPR1001MB2318.namprd10.prod.outlook.com/raw/')
sha512sums=('6baf486a134d76b383c1d042a5a7e9d8be78e52971791066b8da2484fff6823d10fd7aaba71aebf41c631816c417dc9b5774e4310726d55ae94dd36dfe2e0178'
            '7141ac7adaf871959b8b78e5a716c4dae46664390850517d4302aa7120734678ecee38bc147e4587f0168dc9e0b65283d79e2bda162000bdf37766a186a54dd7')

build() {
  cd "${srcdir}/AQtion-${commit}"
  patch -p6 < ../net-v5-aquantia-Remove-the-build_skb-path.diff
}

package() {
  cd "${srcdir}/AQtion-${commit}"
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cat <<EOF >${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	PACKAGE_NAME="${_pkgbase}"
	BUILT_MODULE_NAME[0]="${_pkgbase}"
	PACKAGE_VERSION="${pkgver}"
	DEST_MODULE_LOCATION[0]="/kernel/drivers/net/ethernet/aquantia/atlantic"
	AUTOINSTALL="yes"
EOF
}
