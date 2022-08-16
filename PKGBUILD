
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="radarr-develop"
pkgver=4.2.1.6478
pkgrel=1
pkgdesc="Movie download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Radarr/Radarr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('sqlite')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

provides=('radarr' 'radarr-aphrodite')
conflicts=('radarr' 'radarr-aphrodite')

source_x86_64=("Radarr.develop.${pkgver}.linux-core-x64.tar.gz::https://radarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("Radarr.develop.${pkgver}.linux-core-arm64.tar.gz::https://radarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("Radarr.develop.${pkgver}.linux-core-arm.tar.gz::https://radarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('radarr.service'
        'radarr.tmpfiles'
        'radarr.sysusers'
        'package_info')

sha512sums=('fa3829ed19801a212d389d902d385589553fe0b0d7920b57f5ebf12d6ffedcd30a58403d61845d5ecd63380c4264115827f7cd602295cb7648db6c5e71601575'
            '2ef38a061f4438349f7dafe209328fe9de5f44712f16435805e2622050be45a3fffd1838d9fccef2d6aa7603cf05b01280df6fed957b66d2d67ceaeeedcd5f6f'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e'
            '3ece517c026422dd9f6a8c20e8832021c12be4fa84c85ec0758adf4c955620d2b0e75ee534a09b0f87ab587b374fcd757c818c722d147fd6cc9065735d7d6e0f')
sha512sums_x86_64=('5b5cdf33284b4c100e1074ff35719ed0c2e154ea4faa13334c5579797f93a6c44330a95d08e8d283b27c5ea8f627e96c5100c59685a2eb623cc3bfe3de572e5f')
sha512sums_aarch64=('f67bac61986e71440f0adaac1fc8321a35d30e3ccce50d2767325f155fbafed3b46402dbc0fef9f3fd3d8094be5c255b7513edbbdc4ea8fd3e05b046f88e7209')
sha512sums_armv7h=('b296a1b5b27fb67e22d3929d302df851c47c1ac6a15f83b4c9b80c3f8cbf30e5280983a28764def45bf77dc7205db03d8cebb850d16180969a138d4bbde50476')


package() {
  rm -rf "${srcdir}/Radarr/Radarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/radarr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/radarr/bin"
  chmod +x "${pkgdir}/usr/lib/radarr/bin/Radarr" "${pkgdir}/usr/lib/radarr/bin/ffprobe"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/radarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/radarr/package_info"

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -D -m 644 "${srcdir}/radarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -D -m 644 "${srcdir}/radarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
