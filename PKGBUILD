# Maintainer: Daniel Weiland <aur.archlinux@failedcaptcha>
# Helpful URL: https://services.lidarr.audio/v1/update/plugins?version=0.0.0.0&os=linux&runtime=netcore&arch=x64&includeMajorVersion=true

pkgname=lidarr-plugins-bin
pkgver=2.14.5.4825
pkgrel=1
pkgdesc='Music collection manager for newsgroup and torrent users (plugins branch)'
arch=(x86_64 aarch64 armv7h)
url='https://lidarr.audio'
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
source_x86_64=("Lidarr.plugins.${pkgver}.linux-core-x64.tar.gz::https://lidarr.servarr.com/v1/update/plugins/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Lidarr.plugins.${pkgver}.linux-core-arm64.tar.gz::https://lidarr.servarr.com/v1/update/plugins/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Lidarr.plugins.${pkgver}.linux-core-arm.tar.gz::https://lidarr.servarr.com/v1/update/plugins/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('48f4cc5040b1a51e624f5be4977078b77bf7f87b9c1fb7fa34e844da4c831401'
            '85098d47734e8087480f8a29eafec50faa453487221ef01173888155d2b06e42'
            'd71e37213ac65722e42f6f2c5772d4515c2d28a77b9f7608dc05c787d86ebaa5'
            'b43bb98d95b23071e17d5db69273c11304b9bdcd6bbaa998ba60f89b7dd0ef1e')
sha256sums_x86_64=('5b221e951a22718f34a3fdc96f3a37e2c42d55f65e007c83fef8b66918204916')
sha256sums_aarch64=('f0b754e271e40fbc1ee42de7cea1e7014f72733d83505d97f2c8cfab22ca64ab')
sha256sums_armv7h=('4ac4d51678052be606b8408f2cc4eef10f60ec5b4f29e41c876d8d5f3707cc5e')

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
