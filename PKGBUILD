# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Sven Frenzel <aur@frenzel.dk>
# Helpful URL: https://services.lidarr.audio/v1/update/master?version=0.0.0.0&os=linux&runtime=netcore&arch=x64&includeMajorVersion=true

pkgname=lidarr-bin
pkgver=2.13.3.4711
pkgrel=1
pkgdesc='Music collection manager for newsgroup and torrent users.'
arch=(x86_64 aarch64 armv7h)
url='https://lidarr.audio'
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
provides=(lidarr)
conflicts=(lidarr)
options=(!debug)
install=lidarr.install
source=(
  lidarr.service
  lidarr.sysusers
  lidarr.tmpfiles
  package_info
)
source_x86_64=("Lidarr.master.${pkgver}.linux-core-x64.tar.gz::https://lidarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Lidarr.master.${pkgver}.linux-core-arm64.tar.gz::https://lidarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Lidarr.master.${pkgver}.linux-core-arm.tar.gz::https://lidarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('48f4cc5040b1a51e624f5be4977078b77bf7f87b9c1fb7fa34e844da4c831401'
            '85098d47734e8087480f8a29eafec50faa453487221ef01173888155d2b06e42'
            'd71e37213ac65722e42f6f2c5772d4515c2d28a77b9f7608dc05c787d86ebaa5'
            'fa802821da0c2844b72fbe72d4b58c5b10f9c22a0805deb735d96f137029a5c4')
sha256sums_x86_64=('db86cd2b888781aa1bc58a72f8e240a1c1ae815d02c05dead4d0fa99a11a6126')
sha256sums_aarch64=('724d80b294642a6f217733bbd1a71319451df164ce7af209179d18c107ff476d')
sha256sums_armv7h=('0f2cb09507ef02f0d52aa1675998fe3d44c9852256bd2a57b0b3fd616af16892')

package() {
  install -dm755 "${pkgdir}/usr/lib/lidarr/bin"

  # License
  install -Dm644 Lidarr/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"
  rm Lidarr/LICENSE.md

  # Remove Service Helpers, and Update files
  rm Lidarr/ServiceInstall*
  rm Lidarr/ServiceUninstall*
  rm -rf Lidarr/Lidarr.Update

  # Disable built in updater.
  install -Dm644 package_info "${pkgdir}/usr/lib/lidarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/lidarr/package_info"

  # Copy Lidarr
  cp -dr Lidarr/* "${pkgdir}/usr/lib/lidarr/bin"

  # Systemd
  install -Dm644 lidarr.service "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -Dm644 lidarr.sysusers "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -Dm644 lidarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
