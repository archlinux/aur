# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: jab416171 <jab416171@gmail.com>
# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=seerr
pkgver=2.7.3
pkgrel=1
pkgdesc='Request management and media discovery tool for the Plex ecosystem'
arch=(x86_64 aarch64)
url='https://github.com/seerr-team/seerr'
license=('MIT')
depends=(
  bash
  gcc-libs
  glibc
  nodejs
)
optdepends=(
  'jellyfin-server: The Free Software Media System'
  'plex-media-server: Plex Media Server'
  'emby-server: The open media solution'
  'sonarr: Smart PVR for newsgroup and torrent users'
  'radarr: Movie organizer/manager for usenet and torrent users'
)
makedepends=(pnpm)
backup=(
  etc/conf.d/seerr
  usr/lib/seerr/config/settings.json
)
options=(!strip !debug)
install=seerr.install
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  # "arch.patch::${url}/compare/develop...pnpm-10-for-arch-folks.patch"
  arch.patch
  seerr.sysusers
  seerr.tmpfiles
  seerr.service
  seerr.conf.d
)
sha256sums=('d0444cecd385452e452954b13b8a0e2b9b299fbef0cecc70c44ad089d8d84b78'
            '8d4024798d173dd9e90e07edd5c0f3a0f556e14c5958bf72c1bc8fbd93f46bab'
            '092221b83ded237f57003587533f623d9bc70455493dae9508bb0edac226f9cd'
            '202d6e4c1d4ee555c33fe7e8473c74aef795e145f3bbc885333c003a75e17f14'
            'ee4a4ed8b2ff41fe00582e11283526a08a2ed1154e8e278d898d98c8184c65eb'
            '5a446cc8fa0a47a49dbbd6920d49eb4569f988e808cbb0bdbb609ab179a94426')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i "../arch.patch"

  sed -i 's/husky install//' package.json

  echo "{\"commitTag\": \"${pkgver}\"}" > committag.json

  export NEXT_TELEMETRY_DISABLED=1
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"

  export NEXT_TELEMETRY_DISABLED=1
  export CYPRESS_INSTALL_BINARY=0
  # See: https://aur.archlinux.org/packages/jellyseerr#comment-998270
  export SHARP_IGNORE_GLOBAL_LIBVIPS=1
  pnpm build
  pnpm prune --prod --ignore-scripts
}

package() {
  cd "${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/seerr"

  # Copy seerr
  cp -dr --no-preserve='ownership' ./{.next,dist,public,node_modules} "${pkgdir}/usr/lib/seerr"
  cp -d --no-preserve='ownership' ./{package.json,jellyseerr-api.yml,next.config.js} "${pkgdir}/usr/lib/seerr"

  # Remove cache
  rm -rf "${pkgdir}/usr/lib/seerr/.next/cache"

  # Fix paths
  find "${pkgdir}/usr/lib/seerr/.next" -type f -print0 | xargs -0 sed -i "s^${srcdir}/${pkgname}-${pkgver}^/usr/lib/seerr^g"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Systemd
  cd "${srcdir}"
  install -Dm644 seerr.conf.d "${pkgdir}/etc/conf.d/seerr"
  install -Dm644 seerr.sysusers "${pkgdir}/usr/lib/sysusers.d/seerr.conf"
  install -Dm644 seerr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/seerr.conf"
  install -Dm644 seerr.service "${pkgdir}/usr/lib/systemd/system/seerr.service"
}
