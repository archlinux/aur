# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: jab416171 <jab416171@gmail.com>
# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=seerr
pkgver=3.0.1
pkgrel=3
pkgdesc='Request management and media discovery tool for the Plex ecosystem'
arch=(x86_64 aarch64)
url='https://github.com/seerr-team/seerr'
license=('MIT')
depends=(nodejs)
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
  seerr.sysusers
  seerr.tmpfiles
  seerr.service
  seerr.conf.d
)
sha256sums=('c5dd29495a04d73b961c8dc4ba2e3e1dd8f042e34a22ff409e80a4e2e180c18d'
            '1a4a8daf655c530ebf24d89d036458aa75d7ae2de21a99a2b10eb02c2df1ac81'
            '8e137d571603af4ad83dd55a79d743bf1360de84af2db05dfb9289ccf649973d'
            '34f139015c3537ced763080832f691f3fca012ee4c126c7c66d8e120085d5290'
            '1945ff5b33dd57622d9450e19a323ac8b0d360d7ba248578dcd31a1f03cfe9e4')

prepare() {
  cd "${pkgname}-${pkgver}"

  echo "{\"commitTag\": \"${pkgver}\"}" > committag.json

  # allow nodejs version mismatch
  echo 'engineStrict: false' > pnpm-workspace.yaml

  export NEXT_TELEMETRY_DISABLED=1
  export HUSKY=0
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"

  export NEXT_TELEMETRY_DISABLED=1
  export CYPRESS_INSTALL_BINARY=0
  # See: https://aur.archlinux.org/packages/jellyseerr#comment-998270
  export SHARP_IGNORE_GLOBAL_LIBVIPS=1
  export COMMIT_TAG=${pkgver}
  pnpm build
  pnpm prune --prod --ignore-scripts
}

package() {
  cd "${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/seerr"

  # Copy seerr
  cp -dr --no-preserve='ownership' ./{.next,dist,public,node_modules} "${pkgdir}/usr/lib/seerr"
  cp -d --no-preserve='ownership' ./{package.json,seerr-api.yml,next.config.js,committag.json} "${pkgdir}/usr/lib/seerr"

  # Remove cache
  rm -rf "${pkgdir}/usr/lib/seerr/.next/cache"

  # Remove unneeded files
  find "${pkgdir}/usr/lib/seerr"         -name "*musl*"                      -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type f -name "*.map"                       -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type f -name "*.md"                        -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type d -name "*android*"                   -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type d -name "win64-bin"                   -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type d -name "@next+swc-linux-x64-gnu*"    -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type d -name "@swc+core-linux-x64-gnu*"    -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type d -name "react-devtools-core"         -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type d -path "*/ace-builds/src"            -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type d -path "*/ace-builds/src-noconflict" -exec rm -rf "{}" +
  find "${pkgdir}/usr/lib/seerr" -type d -path "*/node_modules/react-native" -exec rm -rf "{}" +

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
