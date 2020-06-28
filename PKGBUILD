
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://radarr.lidarr.audio/v1/update/aphrodite?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="radarr-aphrodite"
pkgver=3.0.0.3092
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
            '525e3b46f0c947b42bddee85b5a6f50dd3e31921530ba3eb68473136c98bc068f277e7a72f3298165a316a6e0606518865c24f4c130d78e8883832235f8706c6')
sha512sums_x86_64=('015cca675e8f8f748843342284452ab9014aa49131e764c59740daff161086bf11ebd0eb742f1e06f3b0080bc6e03e97e7c3569379d18abc91da166df0483a98')
sha512sums_aarch64=('66b49302d43ee79c83ecfb91cb029e5cfec542571081be649d3e3ca080ea8d4f9219c29ca415e009f7ec2a70dd9bb50f34b50d76255a84dea43a98f494ffa064')
sha512sums_armv7h=('ddfaf5c93e33a25cb6a7c62fcdd8fc2082c7dbf5041441100ca76f4e5e755ee2792ae1cc239e735625c389bee0f9d7af652eb5e86b8486a790eed0420c556765')


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
