# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Helpful URL: http://services.sonarr.tv/v1/releases

pkgname='sonarr-develop'
pkgver=4.0.2.1192
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
sha256sums=('ea1190896fb444e74ce16546ddec851575d083906964c63d4794d47186bdd587'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            '7bf87304383b7d58ecab59b3686d00a8f1b6fbe4af3a86da35a887e4cebee411'
            'a6b37e75143a309b1d8c163c3f90f7f0275fd730015c3f74e3ad27c278b1ae90')
sha256sums_x86_64=('0cb9c2337d29154e521df966b6d6e4beb45d1d89e66912cf5f051b350a452881')
sha256sums_aarch64=('309ce5d2525d8be0d0b68101fe5236cfebfe78a4284e9a6f383d04abf7ed51ba')
sha256sums_armv7h=('a96e5b5d9f0cb99c7aee3e29318fca6b08181f596d9e264daab306fae7fb224c')
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
