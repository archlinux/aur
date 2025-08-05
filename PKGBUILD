# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://whisparr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64&includeMajorVersion=true

pkgname=whisparr-nightly-bin
pkgver=2.0.0.1212
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
            'cc241da00a2941ce3f37d918590e53366c8423b6385a23298adf7a82c65bedff'
            'dfe5d421bc8c8bd9cfd46ee0183e61b572c28d31c8114dded887998bc432d22b'
            '0b235aed73eb0155d77c485ccff415e82e520d27013ba498ac70574e7106a762')
sha256sums_x86_64=('711c3bf75a7e6b147f1708ae3d35d929a6c4637a0cd6aeb8e87aa6640ad2f2f3')
sha256sums_aarch64=('c22ebc1dd12653c7c628b4a2816ee2351b77f050a2a110c57943b546b55f3bcd')
sha256sums_armv7h=('6760e6bfb2a4a03cc65c5a37d7d7af2b66736ed378591a6a3b7ea15625507787')

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
