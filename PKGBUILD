# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Helpful URL: http://services.sonarr.tv/v1/releases

pkgname='sonarr-develop'
pkgver=4.0.0.825
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

provides=('sonarr')

conflicts=(
  'sonarr'
)

source_x86_64=("https://github.com/Sonarr/Sonarr/releases/download/v${pkgver}/Sonarr.develop.${pkgver}.linux-x64.tar.gz")
source_aarch64=("https://github.com/Sonarr/Sonarr/releases/download/v${pkgver}/Sonarr.develop.${pkgver}.linux-arm64.tar.gz")
source_armv7h=("https://github.com/Sonarr/Sonarr/releases/download/v${pkgver}/Sonarr.develop.${pkgver}.linux-arm.tar.gz")

source=(
  'sonarr.service'
  'sonarr.sysusers'
  'sonarr.tmpfiles'
  'package_info'
)

noextract=()
sha256sums=('1cf3a248187bcc39353bc10ace0c124f46b7c4efd1fac1bd6087a6eb8060e948'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            '7bf87304383b7d58ecab59b3686d00a8f1b6fbe4af3a86da35a887e4cebee411'
            'a6b37e75143a309b1d8c163c3f90f7f0275fd730015c3f74e3ad27c278b1ae90')
sha256sums_x86_64=('34237ec423b8d1fd769d2ccf33dbc5565c131719aac1543f1007c123dc6bcaee')
sha256sums_aarch64=('44d0c180638681b3801be8dcd100d3ebc6f337b7ce5882f7654eda575f17287e')
sha256sums_armv7h=('c4da888f965a39594f96c55fc66c56720423ad64fec548560cfd5c5619577657')
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
