# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

_pkgbase=tbsecp3-driver-git
pkgname=${_pkgbase}-dkms
pkgver=r20200325.042649.39b474f
pkgrel=2
pkgdesc="TBSECP3 driver - standalone version (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/AlexanderS/tbsecp3-driver"
license=('GPL2')
makedepends=('git')
depends=('dkms')
conflicts=("${_pkgbase}" 'tbs-dvb-drivers' 'tbs-linux_media-git-dkms' 'tbs-linux_media-git')
provides=("${_pkgbase}")
source=('git+https://github.com/AlexanderS/tbsecp3-driver.git'
        'dkms.conf')
sha256sums=('SKIP'
            '58f3ed8b0a8756da67368c12fbb044bfe190d61124f3aec7fb06724c6f0cfc81')

pkgver() {
    cd "$srcdir/tbsecp3-driver"
    printf "r%s.%s" "$(git show -s --date=format:'%Y%m%d.%H%M%S' --format=%cd)" "$(git rev-parse --short HEAD)"
}

package() {
    # Copy dkms.conf
    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Copy sources
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
    cp -r "${srcdir}/tbsecp3-driver"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
