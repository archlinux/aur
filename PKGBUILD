# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>

pkgname=airsonic
pkgver=10.6.2
_relver=10.6
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Airsonic/airsonic/"
license=('GPL3')
depends=('java-runtime-headless' 'ttf-dejavu')
backup=('etc/airsonic/airsonic.conf')
noextract=(${pkgname}.war)
source=(${pkgname}-${pkgver}.war::https://github.com/airsonic/airsonic/releases/download/v${pkgver}/${pkgname}.war
        ${pkgname}-systemd-env-${_relver}::https://raw.githubusercontent.com/airsonic/airsonic/release-${_relver}/contrib/${pkgname}-systemd-env
        ${pkgname}-${_relver}.service::https://raw.githubusercontent.com/airsonic/airsonic/release-${_relver}/contrib/${pkgname}.service
        ${pkgname}.sysusers
        ${pkgname}.tmpfiles)

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/var/lib/${pkgname}
  mkdir -p ${pkgdir}/var/lib/${pkgname}/playlists
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  mkdir -p ${pkgdir}/etc/${pkgname}
  cp ${pkgname}-${pkgver}.war ${pkgdir}/var/lib/${pkgname}/${pkgname}.war
  
  sed -i 's/\/var\/airsonic/\/var\/lib\/airsonic/' ${pkgname}-${_relver}.service
  sed -i 's/\/etc\/sysconfig\/airsonic/\/etc\/airsonic\/airsonic.conf/' ${pkgname}-${_relver}.service

  sed -i 's/\/var\/airsonic/\/var\/lib\/airsonic/' ${pkgname}-systemd-env-${_relver}  
  cp ${pkgname}-systemd-env-${_relver} ${pkgdir}/etc/${pkgname}/${pkgname}.conf
  
  install -Dm644 "${srcdir}/${pkgname}-${_relver}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  
}
sha256sums=('94b17d6a7859a9c029dcbcdc672f4d49bd605bf46bdf74ac51ea0d593db67860'
            '059a43fe100d95aaaae8091d1c312f4d3a2a2b4edc1969358dd7be35f6525930'
            '6f2e626e393d1e706e3edb45d5dfabf026d9360016d0c2643430c4503dc3e9e2'
            '25af0b92b247df928db5ac8fec3fb4fa2cdc717e649729d5e0c059a5b81e058e'
            '952c15c8c6b53b9c63a96eb6b2402eae42bde56dc9c6c60484cf039a03a82963')

