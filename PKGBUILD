# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Helpful URL: https://services.sonarr.tv/v1/releases

pkgname=sonarr-develop
_pkgname=Sonarr
pkgver=4.0.15.2940
pkgrel=1
pkgdesc='Smart PVR for newsgroup and torrent users (develop branch)'
arch=(x86_64 aarch64 armv7h)
url='https://sonarr.tv'
license=('GPL-3.0-or-later')
groups=(servarr-develop)
depends=(
  aspnet-runtime-6.0
  gcc-libs
  glibc
  sqlite
)
makedepends=(dotnet-sdk-6.0 yarn)
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
provides=(sonarr)
conflicts=(sonarr)
install=sonarr.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Sonarr/Sonarr/archive/refs/tags/v${pkgver}.tar.gz"
  package_info
  sonarr.service
  sonarr.sysusers
  sonarr.tmpfiles
)
sha256sums=('1df03d0e283568d74671a8ff21d780ff1712e765afb699217b0bcc47a66d69fa'
            'a6b37e75143a309b1d8c163c3f90f7f0275fd730015c3f74e3ad27c278b1ae90'
            'a5fc162aeafb2c6322176db736a503047a39f2740eea4dead05438ed47187fbd'
            '00141d4cbf34daa6d91b26179d4847ec970e2767382e18fdf9af2ec84a0ff43e'
            'd6b18a83dd9c213470d984f71ddcefcd64d12bb87f68225cc4ebf5fa4a831703')

case ${CARCH} in
  x86_64) _CARCH='x64' ;;
  aarch64) _CARCH='arm64' ;;
  armv7h) _CARCH='arm' ;;
esac

_framework='net6.0'
_runtime="linux-${_CARCH}"
_output='_output'
_artifacts="${_output}/${_framework}/${_runtime}/publish"
_branch='develop'

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Remove upstream dotnet version
  rm global.json

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  dotnet new globaljson --sdk-version 6.0.113 --force

  # Prepare backend
  dotnet restore "src/${_pkgname}.sln" \
    --runtime "${_runtime}" \
    --locked-mode

  # Prepare frontend
  yarn install --frozen-lockfile --network-timeout 120000
}

build() {
  cd "${_pkgname}-${pkgver}"

  # Build backend
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  dotnet build "src/${_pkgname}.sln" \
    --framework "${_framework}" \
    --runtime "${_runtime}" \
    --no-self-contained \
    --no-restore \
    --configuration Release \
    -p:Platform=Posix \
    -p:AssemblyVersion=${pkgver} \
    -p:AssemblyConfiguration=${_branch} \
    -p:RuntimeIdentifiers="${_runtime}" \
    -t:PublishAllRids \
    && dotnet build-server shutdown # Build servers do not terminate automatically

  # Build frontend
  yarn run build --env production
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/sonarr/bin/UI"

  # Remove Service Helpers, Update, and Windows files
  rm "${_artifacts}/ServiceInstall"*
  rm "${_artifacts}/ServiceUninstall"*
  rm "${_artifacts}/Sonarr.Windows."*
  rm -rf "${_output}/Sonarr.Update"

  # Copy backend
  cp -dr "${_artifacts}/"* "${pkgdir}/usr/lib/sonarr/bin"
  # Copy frontend
  cp -dr "${_output}/UI/"* "${pkgdir}/usr/lib/sonarr/bin/UI"

  # Set executable permissions
  chmod 755 "${pkgdir}/usr/lib/sonarr/bin/ffprobe"

  # License
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

  # Disable built in updater.
  cd "${srcdir}"
  install -Dm644 package_info "${pkgdir}/usr/lib/sonarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/sonarr/package_info"

  # Systemd
  install -Dm644 sonarr.service "${pkgdir}/usr/lib/systemd/system/sonarr.service"
  install -Dm644 sonarr.sysusers "${pkgdir}/usr/lib/sysusers.d/sonarr.conf"
  install -Dm644 sonarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/sonarr.conf"
}
