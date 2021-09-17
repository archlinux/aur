# Maintainer: Timur Demin <me@tdem.in>
# Contributor: Federico Giuliani <federico.giuliani86 at gmail dot com>

pkgname=airsonic-advanced-bin
pkgver=10.6.0
pkgrel=2
pkgdesc="Free, web-based media streamer and jukebox fork"
arch=('any')
url="https://github.com/airsonic-advanced/airsonic-advanced"
license=('GPL3')
depends=('java-runtime-headless' 'ttf-dejavu')
provides=(airsonic)
conflicts=(airsonic)
backup=('etc/airsonic/airsonic.conf')
noextract=(airsonic-${pkgver}.war airsonic.sysusers airsonic.tmpfiles)
source=(airsonic-${pkgver}.war::${url}/releases/download/v${pkgver}/airsonic.war
        src-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
        airsonic.sysusers
        airsonic.tmpfiles)

_dirname=airsonic-advanced-${pkgver}

prepare() {
    sed -i 's/\/var\/airsonic/\/var\/lib\/airsonic/' \
        "${srcdir}/${_dirname}/contrib/airsonic.service" \
        "${srcdir}/${_dirname}/contrib/airsonic-systemd-env"
    sed -i 's/\/etc\/sysconfig\/airsonic/\/etc\/airsonic\/airsonic.conf/' \
        "${srcdir}/${_dirname}/contrib/airsonic.service"
}

package() {
    install -dm755 "${pkgdir}/var/lib/airsonic"
    install -dm755 "${pkgdir}/var/lib/airsonic/playlists"
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    install -dm755 "${pkgdir}/etc/airsonic"

    install -Dm644 \
        "${srcdir}/airsonic-${pkgver}.war" \
        "${pkgdir}/var/lib/airsonic/airsonic.war"
    install -Dm644 \
        "${srcdir}/${_dirname}/contrib/airsonic-systemd-env" \
        "${pkgdir}/etc/airsonic/airsonic.conf" 
    install -Dm644 \
        "${srcdir}/${_dirname}/contrib/airsonic.service" \
        "${pkgdir}/usr/lib/systemd/system/airsonic.service"
    install -Dm644 \
        "${srcdir}/airsonic.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/airsonic.conf"
    install -Dm644 \
        "${srcdir}/airsonic.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/airsonic.conf" 
}

sha256sums=('528f417e59499161ad7fd8b86d391e3c7eff70e0825465e315f86d3417664c69'
            '00697cbb42ce4742098bfad27795fbf91093698dcff00070724e39c3c36ddee2'
            '25af0b92b247df928db5ac8fec3fb4fa2cdc717e649729d5e0c059a5b81e058e'
            '952c15c8c6b53b9c63a96eb6b2402eae42bde56dc9c6c60484cf039a03a82963')
