# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Zack Baldwin <zack@zackb.com>

pkgname=ombi-bin
_pkgname="${pkgname%-bin}"
pkgver=4.53.4
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
sha256sums_x86_64=('d61c46752b30716b6b94d62bc0a374a4a069e7c90b8df3ec0615511c591f9298')
sha256sums_aarch64=('60350fcb9b080a8fbfe206580bcd0f97decd0cc831d5a3028b09d1e961f3666e')
sha256sums_armv7h=('d93cb5d5a597e08479989006c64cdf39b734386b522a3a603672d015949f232f')

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
