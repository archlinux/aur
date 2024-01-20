# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Helpful URL: http://services.sonarr.tv/v1/releases

pkgname='sonarr'
pkgver=4.0.1.929
pkgrel=1
pkgdesc='TV download automation for usenet and torrents.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://sonarr.tv/'
license=('GPL3')

depends=(
  'sqlite'
)

optdepends=(
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'qbittorrent: torrent downloader'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'jackett: torrent indexer proxy'
  'nzbhydra2: torznab and usenet indexer proxy'
  'prowlarr: torrent and usenet indexer proxy'
)

source_x86_64=("http://github.com/Sonarr/Sonarr/releases/download/v${pkgver}/Sonarr.main.${pkgver}.linux-x64.tar.gz")
source_aarch64=("http://github.com/Sonarr/Sonarr/releases/download/v${pkgver}/Sonarr.main.${pkgver}.linux-arm64.tar.gz")
source_armv7h=("http://github.com/Sonarr/Sonarr/releases/download/v${pkgver}/Sonarr.main.${pkgver}.linux-arm.tar.gz")

source=(
  'sonarr.service'
  'sonarr.sysusers'
  'sonarr.tmpfiles'
  'package_info'
)

noextract=()
sha256sums=('ea1190896fb444e74ce16546ddec851575d083906964c63d4794d47186bdd587'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            '7bf87304383b7d58ecab59b3686d00a8f1b6fbe4af3a86da35a887e4cebee411'
            '19112dc0051224b4de66f28077c93b6ee06e163b5194e6aecf62dedf66ff45a9')
sha256sums_x86_64=('f58361ca1c679e7d827ac5cb247e42b3bc81f70db76140193eb93dbc41ef7af9')
sha256sums_aarch64=('4410b27e8ce60695ab9ac7cc71d6f506a7015e3eb808c0eb8293194f38fce594')
sha256sums_armv7h=('8cea527a1d3414c9ee0ddcde76b3fd009c4d087b3a82d701f32e50797019cb93')

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
