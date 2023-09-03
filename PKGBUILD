# Maintainer: boogiepop <boogiepop@gmx.com>

_pkgbase=8852bu
pkgname=$_pkgbase-dkms-git
pkgver=1.15.7.112.2
pkgrel=1
pkgdesc="Kernel modules and firmware for RealTek RTL8852bu"
arch=('any')
url="https://github.com/radxa-pkg/${_pkgbase}-dkms.git"
license=('GPL')
provides=(${pkgname}=${pkgver} ${_pkgbase}-dkms=${pkgver})
source=(git+$url dkms.conf
        'https://github.com/radxa-pkg/radxa-firmware/raw/main/firmware/rtl8852bu_config'
        'https://github.com/radxa-pkg/radxa-firmware/raw/main/firmware/rtl8852bu_fw')
sha256sums=('SKIP'
            'cf94de86cb9e66fc1c60ec4d91895909d859caaa130c686e7376c0b5ef12bd78'
            '2f9968b88d3f434fd67ffa00387fb7eaf0f04e2f9d04e6c5e22f39d359a53c4a'
            '32944034b3eca0dc442d9561e349b24b70b34bba6fd91788c94e1aaa1dca8a65')
depends=('dkms' 'python' 'bc')

prepare() {
    cd ${srcdir}/$_pkgbase-dkms
	for patch in $(cat debian/patches/series)
	do
	patch -p1 -i debian/patches/$patch
	done
}

pkgver() {
	cd ${srcdir}/$_pkgbase-dkms
	_version=$(git tag -l --sort -version:refname | head -n 1)
	printf ${_version//[-]/\.}
}

package() {
    # Copy dkms.conf
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}-dkms/src/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  
  install -d "${pkgdir}/usr/lib/firmware"
  install -Dm755 rtl8852bu_config "$pkgdir/usr/lib/firmware/"
  install -Dm755 rtl8852bu_fw "$pkgdir/usr/lib/firmware/"

  # Blacklists conflicting module
  # install -Dm644 ${pkgname}.conf "${srcdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
