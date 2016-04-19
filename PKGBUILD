# Maintainer: Donald Webster (fryfrog@gmail.com)

pkgname=unifi-video
pkgver=3.2.2
pkgrel=2
pkgdesc="Centralized management system for Ubiquiti UniFi Surveillance Cameras"
arch=('x86_64')
url="https://www.ubnt.com/"
license=('custom')
depends=('mongodb' 'jre8-openjdk-headless' 'java-jsvc' 'lsb-release')
install=unifi-video.install
source=("http://dl.ubnt.com/firmwares/unifi-video/$pkgver/unifi-video_$pkgver~Ubuntu14.04_amd64.deb"
        'unifi-video.service'
        'unifi-video.sysusers'
        'unifi-video.patch')
sha256sums=('4dba35c7d948567f098f13f5ac1faff7e4601ae99bc6477b8817a69f0dcfaeb4'
            'e0b26acb0d6c3c66e4b21d1f96db357532f2bc52c48acc7a5c3c9b6a21115819'
            '90fb2f826a70d3b7815cd6a2253c2af6754c17504be28ef92ee223bd02093730'
            '26a11592d01ead22dbf2c083aae5cec320917902b516cfc595c12d158876bddb')

package() {
    msg2 "Extracting unifi-video..."
    tar xf "${srcdir}/data.tar.gz" -C "$pkgdir"/

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
