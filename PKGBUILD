
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="radarr"
pkgver=3.0.0.4204
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

source_x86_64=("https://github.com/Radarr/Radarr/releases/download/v${pkgver}/Radarr.master.${pkgver}.linux-core-x64.tar.gz")
source_aarch64=("https://github.com/Radarr/Radarr/releases/download/v${pkgver}/Radarr.master.${pkgver}.linux-core-arm64.tar.gz")
source_armv7h=("https://github.com/Radarr/Radarr/releases/download/v${pkgver}/Radarr.master.${pkgver}.linux-core-arm.tar.gz")

source=('radarr.service'
        'radarr.tmpfiles'
        'radarr.sysusers'
        'package_info')

sha512sums=('b9725386f513db6e9cd2eaef33dc8b34b21e43faacd2c9e1c29df2e6acf8e6bbfcf055222b114c13e5d149166f6e3145ba0336502b6f4965554f14102425ef61'
            '2ef38a061f4438349f7dafe209328fe9de5f44712f16435805e2622050be45a3fffd1838d9fccef2d6aa7603cf05b01280df6fed957b66d2d67ceaeeedcd5f6f'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e'
            'c5a3387a72b0ee51d111b351527f47c59a2000696d165d93ffa86d1e4c732aee3e156c4e9132517efe1c9804223b3a655f089e234ce0f0783f7d5877d1d6af86')
sha512sums_x86_64=('fcf3700fc170b952235154678a1f013c3e89587b943efa791fb53574ee78363de9c98ce1a6e81674a866c9130df5b5912d0d4f234673470c25d37fb6cdf389e8')
sha512sums_aarch64=('3d59848b87b402f15bfb6ebcda48e375504f566735e68afb37c8b1fba966fc705e02e6b5539f3d04c951eb7f57ca37a4f4964961096322f6e3eae87674749562')
sha512sums_armv7h=('5e77a926eec8458881d3c3ccac0fdf31258161da05241e9e8518fbf5f8204bc2b50809c097ec035bad791477a6cae8863e85b8c53745fa23565c39f0f23c2a9e')


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
