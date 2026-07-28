# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: jab416171 <jab416171@gmail.com>
# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=seerr
pkgver=3.4.0
pkgrel=1
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
makedepends=(
  bc
  fd
  pnpm
)
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
sha256sums=('74971d8a1284bd35c277547a38b916f7879f3e9d76f0ff2c7550e295653fe38d'
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
  cp -d --no-preserve='ownership' ./{package.json,seerr-api.yml,committag.json} "${pkgdir}/usr/lib/seerr"

  # Remove cache
  rm -rf "${pkgdir}/usr/lib/seerr/.next/cache"

  # Delete Webpack/Terser caches in node_modules
  rm -rf "${pkgdir}/usr/lib/seerr/node_modules/.cache"

  # Remove unneeded files
  echo "Pruning node_modules…"
  export nmdir="${pkgdir}/usr/lib/seerr/node_modules"
  export f_b4=0
  export d_b4=0
  export s_b4=0
  export f_af=0
  export d_af=0
  export s_af=0
  s_b4=$(du -s "${nmdir}" | awk '{print $1}')
  f_b4=$(fd -u -t f '' "${nmdir}" | wc -l)
  d_b4=$(fd -u -t d '' "${nmdir}" | wc -l)
  fd -iu -t d    '^\.github$|^\.vscode$|^\.deps$|^\.idea$|^\.nyc_output$|^\.circleci$|^\.devcontainer$|^\.rollup\.cache$' "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    'win64-bin'                                  "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    'osx-bin'                                    "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    'test' -E '*test@*' -E '*minutesTo*'         "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    '^doc$|^docs$'                               "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    '@npmcli$'                                   "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    'example'                                    "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    '@next\+swc-linux-x64-gnu'                   "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    '@swc\+core-linux-x64-gnu'                   "${nmdir}" -X rm -rf "{}"
  fd -iu -t d    'react-devtools-core'                        "${nmdir}" -X rm -rf "{}"
  fd -iu -t d -p 'ace-builds/src$|ace-builds/src-noconflict$' "${nmdir}" -X rm -rf "{}"
  fd -iu -t d -p 'node_modules/react-native$'                 "${nmdir}" -X rm -rf "{}"
  fd -iu         'android'                                    "${nmdir}" -X rm -rf "{}"
  fd -iu         'musl'                                       "${nmdir}" -X rm -rf "{}"
  fd -iu -t f -e 'txt' 'license.*|copyright.*|cmakelists|legal|help|usage|thirdpartynoticetext|authors|config|logo|options|topics|whoami' "${nmdir}" -X rm "{}"
  fd -iu -t f -e 'md' ''                                      "${nmdir}" -X rm "{}"
  fd -iu -t f -e 'markdown' ''                                "${nmdir}" -X rm "{}"
  fd -iu -t f -e 'map' ''                                     "${nmdir}" -X rm "{}"
  fd -iu -t f -e 'yml' ''                                     "${nmdir}" -X rm "{}"
  fd -iu -t f -e 'coffee' ''                                  "${nmdir}" -X rm "{}"
  fd -iu -t f -e 'tgz' ''                                     "${nmdir}" -X rm "{}"
  fd -iu -t f -e 'tar.gz' ''                                  "${nmdir}" -X rm "{}"
  fd -iu -t f -e 'jst' ''                                     "${nmdir}" -X rm "{}"
  fd -iu -t f    '\.DS_Store'                                 "${nmdir}" -X rm "{}"
  fd -iu -t f    'Jenkinsfile'                                "${nmdir}" -X rm "{}"
  fd  -u -t f    'Makefile'                                   "${nmdir}" -X rm "{}"
  fd -iu -t f    'Gulpfile'                                   "${nmdir}" -X rm "{}"
  fd -iu -t f    'gruntfile'                                  "${nmdir}" -X rm "{}"
  fd -iu -t f    '\.git.*'                                    "${nmdir}" -X rm "{}"
  fd -iu -t f    '\.editorconfig'                             "${nmdir}" -X rm "{}"
  fd -iu -t f    '\..*rc$'                                    "${nmdir}" -X rm "{}"
  fd -iu -t f    '\.eslint'                                   "${nmdir}" -X rm "{}"
  fd -iu -t f    '^eslint$'                                   "${nmdir}" -X rm "{}"
  fd -iu -t f    'tslint'                                     "${nmdir}" -X rm "{}"
  fd -iu -t f    '\.npm'                                      "${nmdir}" -X rm "{}"
  fd -iu -t f    '\.jshint'                                   "${nmdir}" -X rm "{}"
  fd -iu -t f    '\.flowconfig'                               "${nmdir}" -X rm "{}"
  fd -iu -t f    'yarn'                                       "${nmdir}" -X rm "{}"
  fd -iu -t f    'changelog'                                  "${nmdir}" -X rm "{}"
  fd -iu -t f    'license' -E '*isLicensePlate*'              "${nmdir}" -X rm "{}"
  fd -iu -t f    'author'                                     "${nmdir}" -X rm "{}"
  fd -iu -t f    'contrib'                                    "${nmdir}" -X rm "{}"
  fd -iu -t f    '\.prettier'                                 "${nmdir}" -X rm "{}"
  f_af=$(fd -u -t f '' "${nmdir}" | wc -l)
  d_af=$(fd -u -t d '' "${nmdir}" | wc -l)
  s_af=$(du -s "${nmdir}" | awk '{print $1}')

  # Display difference and savings
  echo "Pruned node_modules…"
  echo "#files before: ${f_b4}"
  echo "#files  after: ${f_af}"
  echo "#dirs  before: ${d_b4}"
  echo "#dirs   after: ${d_af}"
  echo "Size   before: $(echo "scale=2; ${s_b4} / 1024" | bc) MB"
  echo "Size    after: $(echo "scale=2; ${s_af} / 1024" | bc) MB"
  echo "Savings: $(echo "scale=2; (${s_b4} - ${s_af}) / 1024" | bc) MB"
  echo "Savings: $(echo "scale=4; (1 - (${s_af} / ${s_b4})) * 100" | bc)%"

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
