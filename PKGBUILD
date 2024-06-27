# Maintainer: Aikawa Yataro <aikawayataro@protonmail.com>
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

pkgbase=rtw88-fixed-dkms-git
pkgname=(rtw88-fixed-dkms-git rtw88-fixed-firmware-git)
_name=rtw88
pkgver=r429.0e5a197
pkgrel=1
pkgdesc='Latest Realtek Wifi 5 drivers'
arch=('any')
url='https://github.com/lwfinger/rtw88'
makedepends=('git')
install='rtw88-fixed.install'
source=('git+https://github.com/lwfinger/rtw88.git'
        'rtw88-fixed.conf')
sha256sums=('SKIP'
            '1323e5a73ca52212bd8158852f98eeab9b4cbb7fba106fb3b0e627ce05d89dde')

pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_rtw88-fixed-dkms-git() {
    depends=(dkms)
    conflicts=(rtw88-dkms-git)

    cd "${srcdir}/${_name}"

    install -dm755 "${pkgdir}/usr/src/${_name}-${pkgver}"
    cp -dr * "${pkgdir}/usr/src/${_name}-${pkgver}"

    # Set name and version
    sed -e "s/^PACKAGE_NAME=.*/PACKAGE_NAME=${_name}/"         \
            -e "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=${pkgver}/" \
            -i "${pkgdir}/usr/src/${_name}-${pkgver}/dkms.conf"

    # Blacklists conflicting modules
    install -Dm644 ../rtw88-fixed.conf -t "${pkgdir}/usr/lib/modprobe.d"
}

package_rtw88-fixed-firmware-git() {
    pkgdesc+=' - firmware'

    cd "${srcdir}/${_name}"

    install -dm755 "${pkgdir}/usr/lib/firmware/rtw88"
    cp *.bin "${pkgdir}/usr/lib/firmware/rtw88"
}
