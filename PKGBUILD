# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Helpful URL: http://services.sonarr.tv/v1/releases

pkgname='sonarr'
pkgver=3.0.9.1549
pkgrel=1
pkgdesc='TV download automation for usenet and torrents.'
arch=(any)
url='https://sonarr.tv/'
license=('GPL3')

depends=(
  'mono'
  'libmediainfo'
  'sqlite'
)

optdepends=(
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'jackett: torrent indexer proxy'
)

source=(
  "https://download.sonarr.tv/v3/main/${pkgver}/Sonarr.main.${pkgver}.linux.tar.gz"
  'sonarr.service'
  'sonarr.sysusers'
  'sonarr.tmpfiles'
  'package_info'
)

noextract=()
sha256sums=('05ad67aef9e599590f23e384a704a13717cd2eba714be37bc2cc776a391c1a84'
            '52e72fde34bc8d123cd2ea0dd10c35685de9873d866935fc15bb6bf1a0ebb686'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            '7bf87304383b7d58ecab59b3686d00a8f1b6fbe4af3a86da35a887e4cebee411'
            '19112dc0051224b4de66f28077c93b6ee06e163b5194e6aecf62dedf66ff45a9')

package() {
  rm -rf "${srcdir}/Sonarr/Sonarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/sonarr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Sonarr/"* "${pkgdir}/usr/lib/sonarr/bin"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/sonarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/sonarr/package_info"

  install -D -m 644 "${srcdir}/sonarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/sonarr.conf"
  install -D -m 644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"
  install -D -m 644 "${srcdir}/sonarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sonarr.conf"
}
