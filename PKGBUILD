# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=ombi-develop
_pkgname=Ombi
pkgver=4.53.0
pkgrel=1
pkgdesc='A media request tool that automatically syncs with your media servers'
arch=(x86_64 aarch64 armv7h)
url='https://ombi.io'
license=('GPL-2.0-or-later')
depends=(
  aspnet-runtime-8.0
  gcc-libs
  glibc
)
makedepends=(dotnet-sdk-8.0 yarn)
optdepends=(
  'jellyfin-server: The Free Software Media System'
  'plex-media-server: Plex Media Server'
  'emby-server: The open media solution'
  'sonarr: Smart PVR for newsgroup and torrent users'
  'radarr: Movie organizer/manager for usenet and torrent users'
)
provides=(ombi)
conflicts=(ombi)
install=ombi.install
source=(
  "${pkgname}-${pkgver}::https://github.com/Ombi-app/Ombi/archive/refs/tags/v${pkgver}.tar.gz"
  ombi.service
  ombi.sysusers
  ombi.tmpfiles
  ombi.install
)
sha256sums=('2203403ad67fa90ffe06a56e6d4f03be09bc3868f1937925b9ab650693d38363'
            '24f1dbe25589719e831d512624ceeb1289a7037002b74d9473719c8564a8950f'
            'd78dadc24ddb11e3ef07269a0a1c6dcf8ca8d32d39d152eaa9bffab6c32dba36'
            '71fe8ec1810d7ab91b30d8e07b9edc6f97827034935404124cc6e428bbc7c5bf'
            '9b1514478af3e13284214495066e6233318c25e44929947e66dcf299daa7c23c')

case ${CARCH} in
  x86_64) _CARCH='x64' ;;
  aarch64) _CARCH='arm64' ;;
  armv7h) _CARCH='arm' ;;
esac

_framework='net8.0'
_runtime="linux-${_CARCH}"
_output='bin'
_artifacts="${_output}/${_framework}/${_runtime}/publish"

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Install dotnet-setversion
  if [[ ! -f /tmp/dotnet-setversion/setversion ]]; then
    dotnet tool install --tool-path /tmp/dotnet-setversion dotnet-setversion
  fi

  # Prepare frontend
  yarn --cwd src/Ombi/ClientApp install --immutable --immutable-cache --check-cache
}

build() {
  cd "${_pkgname}-${pkgver}"

  # Restore and build backend
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  /tmp/dotnet-setversion/setversion -r ${pkgver}
  dotnet publish "src/${_pkgname}" \
    --framework "${_framework}" \
    --runtime ${_runtime} \
    --no-self-contained \
    --configuration Release \
    --output build

  # Build frontend
  export NODE_ENV=production
  yarn --cwd src/Ombi/ClientApp run build
}

package() {
  cd "${_pkgname}-${pkgver}/build"

  # appsettings.json
  install -Dm644 appsettings.json "${pkgdir}/var/lib/ombi/appsettings.json"

  # Copy backend
  install -dm755 "${pkgdir}/usr/lib/ombi/ClientApp/dist/"
  cp -dpr --no-preserve=ownership * "${pkgdir}/usr/lib/ombi"
  cd ../../

  # Copy frontend
  cp -dpr --no-preserve=ownership "${_pkgname}-${pkgver}/src/${_pkgname}/ClientApp/dist" "${pkgdir}/usr/lib/ombi/ClientApp"

  # Install systemd service files
  install -Dm644 "ombi.service" "${pkgdir}/usr/lib/systemd/system/ombi.service"
  install -Dm644 "ombi.sysusers" "${pkgdir}/usr/lib/sysusers.d/ombi.conf"
  install -Dm644 "ombi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ombi.conf"
}
