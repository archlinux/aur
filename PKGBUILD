# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://whisparr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64&includeMajorVersion=true

pkgname=whisparr-nightly-bin
pkgver=2.2.0.develop.336
_pkgver=${pkgver//.develop/-develop}
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
source_x86_64=("Whisparr.${pkgver}.linux-x64.tar.gz::https://github.com/Whisparr/Whisparr/releases/download/v${_pkgver}/Whisparr.${_pkgver}.linux-x64.tar.gz")
source_aarch64=("Whisparr.${pkgver}.linux-arm64.tar.gz::https://github.com/Whisparr/Whisparr/releases/download/v${_pkgver}/Whisparr.${_pkgver}.linux-arm64.tar.gz")
source_armv7h=("Whisparr.${pkgver}.linux-arm.tar.gz::https://github.com/Whisparr/Whisparr/releases/download/v${_pkgver}/Whisparr.${_pkgver}.linux-arm.tar.gz")
sha256sums=('50da66b86fb42b6457a84c61fe02af5845599fd67f538c79457713795d96d8ed'
            'c8c0b16a154e8c7ed47fea616ff0f1bc9319993c0561e0866f0e20faad779de8'
            'dfe5d421bc8c8bd9cfd46ee0183e61b572c28d31c8114dded887998bc432d22b'
            '0b235aed73eb0155d77c485ccff415e82e520d27013ba498ac70574e7106a762')
sha256sums_x86_64=('edf9295c293d14a1614a721fb63d186b7b8c8dc0c2ba894dddbaadaaaea34497')
sha256sums_aarch64=('05a25692017ef3e43d2f05803d881e76525be71efb4700d947906009599d36c0')
sha256sums_armv7h=('cc1b745146790c3126724fca5ae06395069ab86db8028a2687e07fa79fd3607d')

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
