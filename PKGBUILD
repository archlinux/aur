# Maintainer: Joaquín I. Aramendía <samsagax@gmail.com>
# Contributor: Philip Müller <philm@manjaro.org>

pkgname=asus-cirrus-firmware-git
pkgver=r3.5d521dc
pkgrel=3
pkgdesc="ASUS Cirrus firmwares for various sound devices"
url="https://gitlab.com/asus-linux/firmware"
license=('custom')
arch=('any')
makedepends=('git')
source=("asus-firmware::git+https://gitlab.com/asus-linux/firmware"
        'copy-firmware.sh'
        'Makefile'
        'WHENCE'
        'LICENSE.cirrus')
sha256sums=('SKIP'
            '8697b74ff995ec9bffe29c86df8e4461a39058e2aa3c061a33ec92f863168ae9'
            '6a603a9afd5ce2eb0b1d30e4a87862852775d14381e68fcc87dba25c943540f8'
            '8104ab91a9fa4df8e445cffac5afbff41657f952f436eecdc16c644e5a924479'
            'de3ab9496897105826e50ad621689963289e0fe3635b80fc9f420100dcc8304a')

pkgver() {
    cd "asus-firmware"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ${srcdir}/asus-firmware
    cp ${srcdir}/Makefile .
    cp ${srcdir}/copy-firmware.sh .
    cp ${srcdir}/WHENCE .
}

package() {
    cd ${srcdir}/asus-firmware

    ZSTD_CLEVEL=19 make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install-zst

    install -Dm644 "${srcdir}"/LICENSE.cirrus "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.cirrus
}
