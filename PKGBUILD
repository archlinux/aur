# Maintainer: Donald Webster (fryfrog@gmail.com)

pkgname=unifi-video
pkgver=3.8.0
pkgrel=1
pkgdesc="Centralized management system for Ubiquiti UniFi Surveillance Cameras"
arch=('x86_64')
url="https://www.ubnt.com/"
license=('custom')
depends=('mongodb' 'java-runtime>=8' 'java-jsvc' 'lsb-release')
conflicts=('unifi-video-beta')
install=unifi-video.install
source=("${pkgname}-${pkgver}.deb::https://dl.ubnt.com/firmwares/ufv/v${pkgver}/${pkgname}.Ubuntu16.04_amd64.v${pkgver}.deb"
        'unifi-video.service'
        'unifi-video.sysusers'
        'unifi-video.patch'
        'server.xml.patch')

sha256sums=('dc80b09465f3950c747b17788d98f6ee2c9d204efb022b5ae6cd2310eb493739'
            '9df948b046347c25e7c83e4837284ef63d9f8d3f28daa20a6c36e203e3ebfdb3'
            '90fb2f826a70d3b7815cd6a2253c2af6754c17504be28ef92ee223bd02093730'
            '6f52396de7f587372c66b4f269fa3ed51c9c230dc4ca1c4c83f56d8cfb714990'
            '4e0d86bbbe8d836862fe5dd9f2a7a3bea9f37a375507d8a6bc2dde9f374219c5')

package() {
    tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"/
    rm -r "${pkgdir}/etc"
    mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
    chmod +x ${pkgdir}/usr/bin/unifi-video ${pkgdir}/usr/lib/unifi-video/bin/ubnt.* ${pkgdir}/usr/lib/unifi-video/bin/evo*

    cd "${pkgdir}/usr/bin"
    patch -N < "${srcdir}/unifi-video.patch"

    cd "${pkgdir}/usr/lib/unifi-video/conf"
    patch -N < "${srcdir}/server.xml.patch"

    install -D -m 644 "${srcdir}/unifi-video.service" "${pkgdir}/usr/lib/systemd/system/unifi-video.service"
    install -D -m 644 "${srcdir}/unifi-video.sysusers" "${pkgdir}/usr/lib/sysusers.d/unifi-video.conf"

    mkdir -p "${pkgdir}/usr/lib/unifi-video/logs" "${pkgdir}/usr/lib/unifi-video/work"
}

# vim:set ts=2 sw=2 et:
