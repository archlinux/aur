# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://readarr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname=readarr-nightly-bin
pkgver=0.4.13.2757
pkgrel=1
pkgdesc='Ebook and audiobook collection manager for newsgroup and torrent users (nightly builds)'
arch=(x86_64 aarch64 armv7h)
url='https://readarr.com'
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
source_x86_64=("Readarr.nightly.${pkgver}.linux-core-x64.tar.gz::https://readarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Readarr.nightly.${pkgver}.linux-core-arm64.tar.gz::https://readarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Readarr.nightly.${pkgver}.linux-core-arm.tar.gz::https://readarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('9b505e7e93a71c9d2fdc4689cf4a3cd691e3927b419cf5bb6e1aed43b5a91edc'
            'd8111e48780aa7417f43b3d6d1a447be2b3c574542f615fad2bf39b57b4ec871'
            'fcfa28c1be4f67cfa641dc6076780ee07ab973e55bf676174315e417f73003ad'
            'a4cfdf882ab62dea54d85dfae4a633cf21bce597a19c3287d90c024e3ff399ce')
sha256sums_x86_64=('37fd48f41037a0d3eb0083069f4689c5d394d171011390e9b78cb79a28e961d6')
sha256sums_aarch64=('4075910f0e83631740ad4d0f402a8612c739fe3cef9327083668f485d9a5475d')
sha256sums_armv7h=('5b66182dbba14ea9cbda2111cc9757c9e8890488797f666f4be004332173c4ad')

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
