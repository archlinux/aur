
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://radarr.lidarr.audio/v1/update/aphrodite?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="radarr-aphrodite"
pkgver=3.0.0.2913
pkgrel=1
pkgdesc="Movie download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Radarr/Radarr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('libmediainfo' 'sqlite')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

provides=('radarr')
conflicts=('radarr') 

source_x86_64=("Radarr.aphrodite.${pkgver}.linux-core-x64.tar.gz::https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("Radarr.aphrodite.${pkgver}.linux-core-arm64.tar.gz::https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("Radarr.aphrodite.${pkgver}.linux-core-arm.tar.gz::https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('radarr.service'
        'radarr.tmpfiles'
        'radarr.sysusers'
        'package_info')

sha512sums=('b9725386f513db6e9cd2eaef33dc8b34b21e43faacd2c9e1c29df2e6acf8e6bbfcf055222b114c13e5d149166f6e3145ba0336502b6f4965554f14102425ef61'
            '2ef38a061f4438349f7dafe209328fe9de5f44712f16435805e2622050be45a3fffd1838d9fccef2d6aa7603cf05b01280df6fed957b66d2d67ceaeeedcd5f6f'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e'
            '973a610d4b2748270924f47c447904571b706b30d5577cd834134a90e42d4af393f15307ef3d27bc7ce96ca997db3783db8568d854fff8504b3e5e84b92b7119')
sha512sums_x86_64=('46cde6c3deb292f757d7a2d75a0e22e5f46fbe810d2a4a3c2d1fae415c2a9dc8e334f645417be94bf8d891b2a3c93bd9919a6ad160abd56f62b5efd0992b4b0a')
sha512sums_aarch64=('f97a8cb75b0582a6e0be230f53909ed5b471972e8f0a0dc40847fa71da601c7dbcf94354c871024400b37ed494a09ebe251dacbc0c039e00fe86e3507f942133')
sha512sums_armv7h=('71d896652b99c7c3e95bfc116500012c43a45aae4aa64dc8ddb7f31dfdf7e457aef3a2df6e11709af3a6abe0ead91e93ef21dc91dd6593b8d0d892fe2d663bc6')


package() {
  rm -rf "${srcdir}/Radarr/Radarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/radarr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/radarr/bin"
  chmod +x "${pkgdir}/usr/lib/radarr/bin/Radarr"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/radarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/radarr/package_info"

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -D -m 644 "${srcdir}/radarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -D -m 644 "${srcdir}/radarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
