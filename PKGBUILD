# Maintainer: Donald Webster (fryfrog@gmail.com)

pkgname=unifi-video
pkgver=3.4.0
pkgrel=1
pkgdesc="Centralized management system for Ubiquiti UniFi Surveillance Cameras"
arch=('x86_64')
url="https://www.ubnt.com/"
license=('custom')
depends=('mongodb' 'jre8-openjdk-headless' 'java-jsvc' 'lsb-release')
conflicts=('unifi-video-beta')
install=unifi-video.install
source=("http://dl.ubnt.com/firmwares/unifi-video/${pkgver}/unifi-video_${pkgver}~Ubuntu14.04_amd64.deb"
        'unifi-video.service'
        'unifi-video.sysusers'
        'unifi-video.patch')

sha256sums=('0397ddc2e19222aaaf9f77c5168f57232179a20e9d51b82bd13ed699bcbfd03b'
            '9df948b046347c25e7c83e4837284ef63d9f8d3f28daa20a6c36e203e3ebfdb3'
            '90fb2f826a70d3b7815cd6a2253c2af6754c17504be28ef92ee223bd02093730'
            '6908be4aa55e98d358b057bb493bfcbb2e553fbe2e048de36f8cb8cce31a247c')

package() {
    msg2 "Extracting unifi-video..."
    tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"/

    msg2 "Removing unwanted /etc with init.d script and sudoers file..."
    rm -r "${pkgdir}/etc"

    msg2 "Moving /usr/sbin -> /usr/bin..."
    mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"

    msg2 "Making unifi-video executable..."
    chmod +x "${pkgdir}/usr/bin/unifi-video"

    msg2 "Patching java version check..."
    cd "${pkgdir}/usr/bin"
    patch -N < "${srcdir}/unifi-video.patch"

    msg2 "Installing systemd files..."
    install -D -m 644 "${srcdir}/unifi-video.service" "${pkgdir}/usr/lib/systemd/system/unifi-video.service"
    install -D -m 644 "${srcdir}/unifi-video.sysusers" "${pkgdir}/usr/lib/sysusers.d/unifi-video.conf"

    msg2 "Creating directories..."
    mkdir -p "${pkgdir}/usr/lib/unifi-video/logs" "${pkgdir}/usr/lib/unifi-video/work"
}

# vim:set ts=2 sw=2 et:
