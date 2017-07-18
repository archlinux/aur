# Maintainer: Donald Webster (fryfrog@gmail.com)

pkgname=unifi-video
pkgver=3.7.1
pkgrel=1
pkgdesc="Centralized management system for Ubiquiti UniFi Surveillance Cameras"
arch=('x86_64')
url="https://www.ubnt.com/"
license=('custom')
depends=('mongodb' 'java-runtime>=8' 'java-jsvc' 'lsb-release')
conflicts=('unifi-video-beta')
install=unifi-video.install
source=("http://dl.ubnt.com/firmwares/unifi-video/${pkgver}/unifi-video_${pkgver}~Ubuntu16.04_amd64.deb"
        'unifi-video.service'
        'unifi-video.sysusers'
        'unifi-video.patch'
        'server.xml.patch')

sha256sums=('51c32e1bffa1da71dfa27c549b854e6ce06176dd5e3abe3027a06591ab27e31d'
            '9df948b046347c25e7c83e4837284ef63d9f8d3f28daa20a6c36e203e3ebfdb3'
            '90fb2f826a70d3b7815cd6a2253c2af6754c17504be28ef92ee223bd02093730'
            'c0a968719e4d6ad81c040f47a57cf0e157bac244e9473d4b9d579d3c4bc881ca'
            '0636452a8e45a64f0adf108afbb5823921fb013b427eaf644d9bae0d97c27b93')

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
