# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname="sonarr-phantom"
pkgver=3.0.5.1143
pkgrel=3
pkgdesc="TV download automation for usenet and torrents."
arch=(any)
url="http://www.sonarr.tv"
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

provides=('sonarr')

conflicts=('sonarr'
           'sonarr-develop')

source=(
  "https://download.sonarr.tv/v3/phantom-develop/${pkgver}/Sonarr.phantom-develop.${pkgver}.linux.tar.gz"
  'sonarr.service'
  'sonarr.sysusers'
  'sonarr.tmpfiles'
  'package_info'
)

noextract=()
sha256sums=('52ce3d951df525ccb2b27b73278c823a0a4cf0048a44acabff9597d2b1af1054'
            'b95d8e15c59e24e355a5098e322f3200f81dbcc8bb183c1767e1eeb42fa0cada'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            '7bf87304383b7d58ecab59b3686d00a8f1b6fbe4af3a86da35a887e4cebee411'
            '74853b5a042b88d77ddb98aa284d9ed3f47df7e44e6410c2062b5d62423e3418')

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
