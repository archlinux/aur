# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Helpful URL: http://services.sonarr.tv/v1/releases

pkgname='sonarr-develop'
pkgver=4.0.0.497
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

source_x86_64=("https://download.sonarr.tv/v4/develop/${pkgver}/Sonarr.develop.${pkgver}.linux-x64.tar.gz")
source_aarch64=("https://download.sonarr.tv/v4/develop/${pkgver}/Sonarr.develop.${pkgver}.linux-arm64.tar.gz")
source_armv7h=("https://download.sonarr.tv/v4/develop/${pkgver}/Sonarr.develop.${pkgver}.linux-arm.tar.gz")

source=(
  'sonarr.service'
  'sonarr.sysusers'
  'sonarr.tmpfiles'
  'package_info'
)

noextract=()
sha256sums=('2373381d508403469cf58396b1f8f7cc7778ba619604469006bdfdc3f2f25960'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            '7bf87304383b7d58ecab59b3686d00a8f1b6fbe4af3a86da35a887e4cebee411'
            'a6b37e75143a309b1d8c163c3f90f7f0275fd730015c3f74e3ad27c278b1ae90')
sha256sums_x86_64=('dc11d2c1f28b39751b6f4bdce87e9283fab12c72b399f98ab56259706a7e2081')
sha256sums_aarch64=('9ded7313186c921ffd89364a870af5367466eb5c9e6d4c982b2e5b8c6925e4b3')
sha256sums_armv7h=('73b56e18d0395c54336562a828d4d13823c83c8c7085cdd38d227c15dcf26d01')
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
