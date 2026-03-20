# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Helpful URL: https://services.sonarr.tv/v1/releases

pkgname=sonarr-bin
pkgver=4.0.17.2952
pkgrel=1
pkgdesc='Smart PVR for newsgroup and torrent users'
arch=(x86_64 aarch64 armv7h)
url='https://sonarr.tv'
license=('GPL-3.0-or-later')
groups=(servarr-bin)
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
source_x86_64=("Sonarr.main.${pkgver}.linux-x64.tar.gz::https://services.sonarr.tv/v1/update/main/download?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Sonarr.main.${pkgver}.linux-arm64.tar.gz::https://services.sonarr.tv/v1/update/main/download?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Sonarr.main.${pkgver}.linux-arm.tar.gz::https://services.sonarr.tv/v1/update/main/download?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('ea2073b568f98dc9d7a91ce11f279d2d8b5a5bb8bad01136a05cb7907e00bd47'
            'a5fc162aeafb2c6322176db736a503047a39f2740eea4dead05438ed47187fbd'
            '00141d4cbf34daa6d91b26179d4847ec970e2767382e18fdf9af2ec84a0ff43e'
            'd6b18a83dd9c213470d984f71ddcefcd64d12bb87f68225cc4ebf5fa4a831703'
            '3d912d367eeb89ead06dc9dc45de093f48ddc601188731d54775c33e04e369aa')
sha256sums_x86_64=('d5142372067d727979421ca7b1d60601ceecd9758af3a7dafacc6ebba831777a')
sha256sums_aarch64=('7c8cedbac631b5283664a7710574f1245a0d38968c5fef9418d535d2a437dd43')
sha256sums_armv7h=('b283613b4a4b8464ab657072dd10a7e19749112948720e11c020bead90ef78a9')

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
