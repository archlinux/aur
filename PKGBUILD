# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://whisparr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64&includeMajorVersion=true

pkgname=whisparr-nightly-bin
pkgver=2.0.0.1282
pkgrel=1
pkgdesc='Adult movie organizer/manager for usenet and torrent users (nightly builds)'
arch=(x86_64 aarch64 armv7h)
url='https://whisparr.com'
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
provides=(whisparr)
conflicts=(whisparr)
options=(!debug)
install=whisparr.install
source=(
  package_info
  whisparr.service
  whisparr.sysusers
  whisparr.tmpfiles
)
source_x86_64=("Whisparr.nightly.${pkgver}.linux-core-x64.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Whisparr.nightly.${pkgver}.linux-core-arm64.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Whisparr.nightly.${pkgver}.linux-core-arm.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('50da66b86fb42b6457a84c61fe02af5845599fd67f538c79457713795d96d8ed'
            'c8c0b16a154e8c7ed47fea616ff0f1bc9319993c0561e0866f0e20faad779de8'
            'dfe5d421bc8c8bd9cfd46ee0183e61b572c28d31c8114dded887998bc432d22b'
            '0b235aed73eb0155d77c485ccff415e82e520d27013ba498ac70574e7106a762')
sha256sums_x86_64=('6516d5d67c402221d42fc0f39a500945c14e9e5e6df3ebabdf35e1c36f6651f9')
sha256sums_aarch64=('006111843f0489391a5f0ec65956963c556e42472549aacd386320b3eeb3c5f2')
sha256sums_armv7h=('010bc4f6f3f8f05a597ca636a3db6d9f20bea5f6e215432c3b7748593f98e1ca')

package() {
  install -dm755 "${pkgdir}/usr/lib/whisparr/bin"

  # License
  install -Dm644 Whisparr/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  rm Whisparr/LICENSE

  # Remove Service Helpers, and Update files
  rm Whisparr/ServiceInstall*
  rm Whisparr/ServiceUninstall*
  rm -rf Whisparr/Whisparr.Update

  # Disable built in updater.
  install -Dm644 package_info "${pkgdir}/usr/lib/whisparr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/whisparr/package_info"

  # Copy Whisparr
  cp -dr Whisparr/* "${pkgdir}/usr/lib/whisparr/bin"

  # Systemd
  install -Dm644 whisparr.service "${pkgdir}/usr/lib/systemd/system/whisparr.service"
  install -Dm644 whisparr.sysusers "${pkgdir}/usr/lib/sysusers.d/whisparr.conf"
  install -Dm644 whisparr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/whisparr.conf"
}
