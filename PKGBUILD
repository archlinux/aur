# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Helpful URL: https://services.sonarr.tv/v1/releases

pkgname=sonarr-develop-bin
pkgver=4.0.16.2943
pkgrel=1
pkgdesc='Smart PVR for newsgroup and torrent users (develop branch)'
arch=(x86_64 aarch64 armv7h)
url='https://sonarr.tv'
license=('GPL-3.0-or-later')
groups=(servarr-develop-bin)
depends=(
  gcc-libs
  glibc
  sqlite
  zlib
)
optdepends=(
  'postgresql: postgresql database'
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'qbittorrent: torrent downloader'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'nodejs-flood: torrent downloader'
  'vuze: torrent downloader'
  'aria2: torrent downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'jackett: torrent indexer proxy'
  'nzbhydra2: torznab and usenet indexer proxy'
  'prowlarr: torrent and usenet indexer proxy'
  'autobrr: irc, torrent and usenet indexer proxy'
)
provides=(sonarr)
conflicts=(sonarr)
options=(!debug)
install=sonarr.install
source=(
  package_info
  sonarr.service
  sonarr.sysusers
  sonarr.tmpfiles
  sonarr.install
)
source_x86_64=("Sonarr.develop.${pkgver}.linux-x64.tar.gz::https://services.sonarr.tv/v1/update/develop/download?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Sonarr.develop.${pkgver}.linux-arm64.tar.gz::https://services.sonarr.tv/v1/update/develop/download?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Sonarr.develop.${pkgver}.linux-arm.tar.gz::https://services.sonarr.tv/v1/update/develop/download?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('1a609451c6de4fe0f03c8019e2232b04a552bea98e5863f7e49bba9f00ed05ba'
            'a5fc162aeafb2c6322176db736a503047a39f2740eea4dead05438ed47187fbd'
            '00141d4cbf34daa6d91b26179d4847ec970e2767382e18fdf9af2ec84a0ff43e'
            'd6b18a83dd9c213470d984f71ddcefcd64d12bb87f68225cc4ebf5fa4a831703'
            '3d912d367eeb89ead06dc9dc45de093f48ddc601188731d54775c33e04e369aa')
sha256sums_x86_64=('9277f067d9200481cbac16acc245a9b4f30c3d574711fed73e4d457fa602fa9b')
sha256sums_aarch64=('957ac9e56d884242fb52dfacfb92403b25644ff620bad5d9330b7031924946f1')
sha256sums_armv7h=('52673b1ebe8c338b2b9ecdbbc332992e8be52bb560ff143332e4719b2da54453')

package() {
  install -dm755 "${pkgdir}/usr/lib/sonarr/bin"

  # License
  install -Dm644 Sonarr/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"
  rm Sonarr/LICENSE.md

  # Remove Service Helpers, and Update files
  rm Sonarr/ServiceInstall*
  rm Sonarr/ServiceUninstall*
  rm -rf Sonarr/Sonarr.Update

  # Disable built in updater.
  install -Dm644 package_info "${pkgdir}/usr/lib/sonarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/sonarr/package_info"

  # Copy Sonarr
  cp -dr Sonarr/* "${pkgdir}/usr/lib/sonarr/bin"

  # Systemd
  install -Dm644 sonarr.service "${pkgdir}/usr/lib/systemd/system/sonarr.service"
  install -Dm644 sonarr.sysusers "${pkgdir}/usr/lib/sysusers.d/sonarr.conf"
  install -Dm644 sonarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/sonarr.conf"
}
