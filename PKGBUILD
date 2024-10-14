# Maintainer: Aikawa Yataro <aikawayataro@protonmail.com>
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

pkgbase=rtw88-fixed-dkms-git
pkgname=(rtw88-fixed-dkms-git rtw88-fixed-firmware-git)
_name=rtw88
pkgver=r512.247209b
pkgrel=1
pkgdesc='Latest Realtek Wifi 5 drivers'
arch=('any')
url='https://github.com/lwfinger/rtw88'
makedepends=('git')
install='rtw88-fixed.install'
source=('git+https://github.com/lwfinger/rtw88.git'
        'rtw88-fixed.conf'
        'firmware-path.patch')
sha256sums=('SKIP'
            '1323e5a73ca52212bd8158852f98eeab9b4cbb7fba106fb3b0e627ce05d89dde'
            '2375b827bae4417b0aebc000c7d8caac47cb89f9f7afd111924c9099b56dc78e')

pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_name}"

    patch --forward --strip=1 --input=../firmware-path.patch # avoid clashing with linux-firmware
}

package_rtw88-fixed-dkms-git() {
    depends=('dkms' 'rtw88-fixed-firmware')
    conflicts=('rtw88-dkms-git')

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
    provides=('rtw88-fixed-firmware')
    pkgdesc+=' - firmware'

    cd "${srcdir}/${_name}"

    install -Dm644 firmware/*_fw.bin -t "${pkgdir}/usr/lib/firmware/rtw88-fixed"
}
