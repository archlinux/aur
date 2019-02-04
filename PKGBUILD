# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

_pkgbase=tbsecp3-driver-git
pkgname=${_pkgbase}-dkms
pkgver=r20190204.054540.aab6f8f
pkgrel=1
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
            'd168c144f7dd80dd33c961b9f1e0cbeaf34e3df155ce457aa508ee786a4958ae')

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
