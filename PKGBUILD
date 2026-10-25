# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://radarr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64&includeMajorVersion=true

pkgname=radarr-nightly-bin
pkgver=7.0.0.10813
pkgrel=1
pkgdesc='Movie organizer/manager for usenet and torrent users (nightly builds)'
arch=(x86_64 aarch64 armv7h)
url='https://radarr.video'
license=('GPL-3.0-or-later')
groups=(servarr-nightly-bin)
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
provides=(radarr)
conflicts=(radarr)
options=(!debug)
install=radarr.install
source=(
  package_info
  radarr.service
  radarr.sysusers
  radarr.tmpfiles
)
source_x86_64=("Radarr.nightly.${pkgver}.linux-core-x64.tar.gz::https://radarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Radarr.nightly.${pkgver}.linux-core-arm64.tar.gz::https://radarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Radarr.nightly.${pkgver}.linux-core-arm.tar.gz::https://radarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('e7d22110337234a9d5ce1ea0f65d0dcd7c76e339c61da77c33b80218638d5c3a'
            '25637c6496aa59673aada6acc6cf41025a5f12a844025ee41d8a6cc66b84b5c0'
            'bb73e0c55711d7ddbf74140b3beb39cb8674ae92be8387c3dd8109bcd53faca8'
            'c68efcb3778cb497d7c256dc97df7413ce09f07ea341e4d2683e7fee321cbcbb')
sha256sums_x86_64=('4b0b795800a0fb79d3707ff5a98b8e6973499289834faa295a10740d39792144')
sha256sums_aarch64=('f759ab5af9593aba5d2411a556042e772f28ad17bc32d2853a74154a1020351a')
sha256sums_armv7h=('15774951e44ed58c621cc198eee1b4efb7cd513f978f5cdb5a86ceca95e2b7d5')

package() {
  install -dm755 "${pkgdir}/usr/lib/radarr/bin"

  # License
  install -Dm644 Radarr/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  rm Radarr/LICENSE

  # Remove Service Helpers, and Update files
  rm Radarr/ServiceInstall*
  rm Radarr/ServiceUninstall*
  rm -rf Radarr/Radarr.Update

  # Disable built in updater.
  install -Dm644 package_info "${pkgdir}/usr/lib/radarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/radarr/package_info"

  # Copy Radarr
  cp -dr Radarr/* "${pkgdir}/usr/lib/radarr/bin"

  # Systemd
  install -Dm644 radarr.service "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -Dm644 radarr.sysusers "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -Dm644 radarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
