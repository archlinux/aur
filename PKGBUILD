# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Zack Baldwin <zack@zackb.com>

pkgname=ombi-develop-bin
_pkgname="${pkgname%-bin}"
__pkgname="_${pkgname%-develop}"
pkgver=4.49.2
pkgrel=1
pkgdesc='A media request tool that automatically syncs with your media servers'
arch=(x86_64 aarch64 armv7h)
url='https://ombi.io'
license=('GPL-2.0-or-later')
depends=(
  gcc-libs
  glibc
  zlib
)
optdepends=(
  'jellyfin-server: The Free Software Media System'
  'plex-media-server: Plex Media Server'
  'emby-server: The open media solution'
  'sonarr: Smart PVR for newsgroup and torrent users'
  'radarr: Movie organizer/manager for usenet and torrent users'
)
provides=(ombi)
conflicts=(ombi)
options=(!strip !debug) # !strip is needed to avoid a fatal error
install=ombi.install
source=(
  ombi.service
  ombi.sysusers
  ombi.tmpfiles
  ombi.install
)
source_x86_64=("${pkgname}-${pkgver}.x86_64.tar.gz::https://github.com/Ombi-app/Ombi/releases/download/v${pkgver}/linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.aarch64.tar.gz::https://github.com/Ombi-app/Ombi/releases/download/v${pkgver}/linux-arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}.armv7h.tar.gz::https://github.com/Ombi-app/Ombi/releases/download/v${pkgver}/linux-arm.tar.gz")
noextract=(
  "${pkgname}-${pkgver}.x86_64.tar.gz"
  "${pkgname}-${pkgver}.aarch64.tar.gz"
  "${pkgname}-${pkgver}.armv7h.tar.gz"
)
sha256sums=('24f1dbe25589719e831d512624ceeb1289a7037002b74d9473719c8564a8950f'
            'd78dadc24ddb11e3ef07269a0a1c6dcf8ca8d32d39d152eaa9bffab6c32dba36'
            '71fe8ec1810d7ab91b30d8e07b9edc6f97827034935404124cc6e428bbc7c5bf'
            '9b1514478af3e13284214495066e6233318c25e44929947e66dcf299daa7c23c')
sha256sums_x86_64=('cdfd5500594ac3cb4c0b8a822381db297c690c92a1c51e113fd04b85a6ce77b6')
sha256sums_aarch64=('15733a4068924389d62fa664beffa6a1b1a0ee8c7e5c9e930652db997157d34f')
sha256sums_armv7h=('51e0cd9de63fe3ca7ce2374919eea0618aea3f8b561058e73a136d98d8d3eee8')

prepare() {
  mkdir -p "ombi"
  tar -xf "${pkgname}-${pkgver}.${CARCH}.tar.gz" -C "ombi"
}

package() {
  install -dm755 "${pkgdir}/var/lib/ombi"
  install -Dm644 "ombi/appsettings.json" "${pkgdir}/var/lib/ombi/appsettings.json"

  install -dm755 "${pkgdir}/usr/lib/ombi"
  cp -dpr --no-preserve=ownership "${srcdir}/ombi/"* "${pkgdir}/usr/lib/ombi"

  install -Dm644 "ombi.service" "${pkgdir}/usr/lib/systemd/system/ombi.service"
  install -Dm644 "ombi.sysusers" "${pkgdir}/usr/lib/sysusers.d/ombi.conf"
  install -Dm644 "ombi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ombi.conf"
}
