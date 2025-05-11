# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://readarr.servarr.com/v1/update/develop?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname=readarr-develop-bin
pkgver=0.4.16.2793
pkgrel=1
pkgdesc='Ebook and audiobook collection manager for newsgroup and torrent users (develop branch)'
arch=(x86_64 aarch64 armv7h)
url='https://readarr.com'
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
provides=(readarr)
conflicts=(readarr)
options=(!debug)
install=readarr.install
source=(
  package_info
  readarr.service
  readarr.sysusers
  readarr.tmpfiles
)
source_x86_64=("Readarr.develop.${pkgver}.linux-core-x64.tar.gz::https://readarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Readarr.develop.${pkgver}.linux-core-arm64.tar.gz::https://readarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Readarr.develop.${pkgver}.linux-core-arm.tar.gz::https://readarr.servarr.com/v1/update/develop/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('c53f8d84eea20eb57f4fa200d18ccfee7ddac57e087f3ef00efb8e22862c9dde'
            'd8111e48780aa7417f43b3d6d1a447be2b3c574542f615fad2bf39b57b4ec871'
            'fcfa28c1be4f67cfa641dc6076780ee07ab973e55bf676174315e417f73003ad'
            'a4cfdf882ab62dea54d85dfae4a633cf21bce597a19c3287d90c024e3ff399ce')
sha256sums_x86_64=('b097270b2b013512f4ad8fa57935bda139873dad4ea24f280ba6ad780c8fe7c0')
sha256sums_aarch64=('3d06160290f29791c5bfe94d162fd5434b2e1b7d901e6d22723b048c7a297ff5')
sha256sums_armv7h=('b70f511207aa2071b1d68ee3b07af89aaac3da6d016685b0d5dd19c69f32b654')

package() {
  install -dm755 "${pkgdir}/usr/lib/readarr/bin"

  # License
  install -Dm644 Readarr/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"
  rm Readarr/LICENSE.md

  # Remove Service Helpers, and Update files
  rm Readarr/ServiceInstall*
  rm Readarr/ServiceUninstall*
  rm -rf Readarr/Readarr.Update

  # Disable built in updater.
  install -Dm644 package_info "${pkgdir}/usr/lib/readarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/readarr/package_info"

  # Copy Readarr
  cp -dr Readarr/* "${pkgdir}/usr/lib/readarr/bin"

  # Systemd
  install -Dm644 readarr.service "${pkgdir}/usr/lib/systemd/system/readarr.service"
  install -Dm644 readarr.sysusers "${pkgdir}/usr/lib/sysusers.d/readarr.conf"
  install -Dm644 readarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/readarr.conf"
}
