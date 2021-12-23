# Maintainer: Donald Webster (fryfrog@gmail.com)
# Contributor: Torben Nehmer (torben+aur-unifi-video at nehmer dot net)

pkgname=unifi-video
pkgver=3.10.13
pkgrel=2
pkgdesc="Centralized management system for Ubiquiti UniFi surveillance cameras."
arch=('x86_64')
url="https://www.ubnt.com/"
license=('custom')
makedepends=('zip')
depends=(
  'mongodb'
  'java-runtime>=8'
  'java-jsvc'
  'lsb-release'
  'which'
)
conflicts=('unifi-video-beta')
install=unifi-video.install
source=("${pkgname}-${pkgver}.deb::https://dl.ubnt.com/firmwares/ufv/v${pkgver}/${pkgname}.Ubuntu18.04_amd64.v${pkgver}.deb"
        'unifi-video.service'
        'unifi-video.sysusers'
        'unifi-video.tmpfiles'
        'unifi-video.patch')

sha256sums=('5838c616b0f83601563cd371a0c64eb0ccdaee6fc6b3237a95b94ac59c224745'
            '9df948b046347c25e7c83e4837284ef63d9f8d3f28daa20a6c36e203e3ebfdb3'
            '90fb2f826a70d3b7815cd6a2253c2af6754c17504be28ef92ee223bd02093730'
            '1ba38968cd5822b336bcffde0a150ea8c2358471abbcbde641de1ad9555bbff1'
            '9e04a0ffe891fbda0ae0f7a7f3edbcc59118dfc4bd4fea19c1b44954579a3952')
            
package() {
    tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"/
    rm -r "${pkgdir}/etc"
    mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
    chmod +x ${pkgdir}/usr/bin/unifi-video ${pkgdir}/usr/lib/unifi-video/bin/ubnt.* ${pkgdir}/usr/lib/unifi-video/bin/evo*

    cd "${pkgdir}/usr/bin"
    patch -N < "${srcdir}/unifi-video.patch"

    # see also: https://logging.apache.org/log4j/2.x/security.html
    echo "Fixing Log4j JNDI Lookup vulnerability by removing JndiLookup.class (CVE-2021-45046)"
    cd "${pkgdir}/usr/lib/unifi-video/lib"
    zip -v -q -d log4j-core-*.jar org/apache/logging/log4j/core/lookup/JndiLookup.class

    install -D -m 644 "${srcdir}/unifi-video.service" "${pkgdir}/usr/lib/systemd/system/unifi-video.service"
    install -D -m 644 "${srcdir}/unifi-video.sysusers" "${pkgdir}/usr/lib/sysusers.d/unifi-video.conf"
    install -D -m 644 "${srcdir}/unifi-video.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/unifi-video.conf"
}

# vim:set ts=2 sw=2 et:
