# Maintainer: Jbsco <https://github.com/Jbsco>
pkgname=hadlink-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='High-assurance URL shortener with formally verified SPARK core'
arch=('x86_64')
url='https://github.com/Jbsco/hadlink'
license=('AGPL-3.0-or-later')
depends=('sqlite')
provides=('hadlink')
conflicts=('hadlink')
install=hadlink-bin.install
backup=('etc/hadlink/hadlink.conf')
source=("hadlink-${pkgver}.tar.gz::https://github.com/Jbsco/hadlink/releases/download/v${pkgver}/hadlink-linux-x64.tar.gz"
        "hadlink-shorten.service::https://raw.githubusercontent.com/Jbsco/hadlink/v${pkgver}/deploy/systemd/hadlink-shorten.service"
        "hadlink-redirect.service::https://raw.githubusercontent.com/Jbsco/hadlink/v${pkgver}/deploy/systemd/hadlink-redirect.service"
        "hadlink.conf::https://raw.githubusercontent.com/Jbsco/hadlink/v${pkgver}/deploy/systemd/hadlink.conf"
        "hadlink.sysusers"
        "hadlink.tmpfiles")
sha256sums=('e3a8f4049568020d47997747ef8cf1ded76d1ca4f60209ce6b04ce6b5e361d0b'
            '142e8577209be0edc91a99155d8ea4266f8eb4aace81901be7bcd76800d63f2a'
            '034076cc94daa3095109e57d5ba123cd7950cb811a2ef294dc24f66cf4ae1d7f'
            'c0dc4a11a0c06d5307af0eceabf73fdc0a432bf337df451d1292bec3b01de713'
            '3f86c4b7a821080e3548aafc63af204b01373a01a8cacb30955cb5f936d6787d'
            '335fd4d12858142aa05a3e5e742e8053316da6ee54d9a14e9d7851b5c817c562')
noextract=()

package() {
    # Binaries
    install -Dm755 "${srcdir}/hadlink-shorten" "${pkgdir}/usr/bin/hadlink-shorten"
    install -Dm755 "${srcdir}/hadlink-redirect" "${pkgdir}/usr/bin/hadlink-redirect"

    # Shared library
    install -Dm644 "${srcdir}/libHadlink_Core.so" "${pkgdir}/usr/lib/libHadlink_Core.so"

    # Systemd units - patch paths from /usr/local to /usr
    sed -e 's|/usr/local/bin|/usr/bin|g' \
        "${srcdir}/hadlink-shorten.service" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/hadlink-shorten.service"
    sed -e 's|/usr/local/bin|/usr/bin|g' \
        "${srcdir}/hadlink-redirect.service" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/hadlink-redirect.service"

    # Configuration - patch LD_LIBRARY_PATH to /usr/lib
    sed -e 's|/usr/local/lib|/usr/lib|g' \
        "${srcdir}/hadlink.conf" |
        install -Dm644 /dev/stdin "${pkgdir}/etc/hadlink/hadlink.conf"

    # sysusers and tmpfiles
    install -Dm644 "${srcdir}/hadlink.sysusers" "${pkgdir}/usr/lib/sysusers.d/hadlink.conf"
    install -Dm644 "${srcdir}/hadlink.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/hadlink.conf"
}
