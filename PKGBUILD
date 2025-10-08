# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://services.lidarr.audio/v1/update/develop?version=0.0.0.0&os=linux&runtime=netcore&arch=x64&includeMajorVersion=true

pkgname=lidarr-develop
_pkgname=Lidarr
pkgver=2.14.5.4836
pkgrel=1
pkgdesc='Music collection manager for newsgroup and torrent users (develop branch)'
arch=(x86_64 aarch64 armv7h)
url='https://lidarr.audio'
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
provides=(lidarr)
conflicts=(lidarr)
install=lidarr.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Lidarr/Lidarr/archive/refs/tags/v${pkgver}.tar.gz"
  lidarr.service
  lidarr.sysusers
  lidarr.tmpfiles
  package_info
)
sha256sums=('c8e8cb72ccfdca038eaeb8830584915fecf3748a8b41fffeafaa80547149ee0d'
            '48f4cc5040b1a51e624f5be4977078b77bf7f87b9c1fb7fa34e844da4c831401'
            '85098d47734e8087480f8a29eafec50faa453487221ef01173888155d2b06e42'
            'd71e37213ac65722e42f6f2c5772d4515c2d28a77b9f7608dc05c787d86ebaa5'
            'ea7786c48dce48db0ecfe2feace923d122981f6af86a01985c3662a76153a620')

case ${CARCH} in
  x86_64) _CARCH='x64' ;;
  aarch64) _CARCH='arm64' ;;
  armv7h) _CARCH='arm' ;;
esac

_framework='net6.0'
_runtime="linux-${_CARCH}"
_output="_output"
_artifacts="${_output}/${_framework}/${_runtime}/publish"
_branch='develop'

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Prepare backend
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  dotnet restore src/${_pkgname}.sln \
    --runtime ${_runtime} \
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
  dotnet build src/${_pkgname}.sln \
    --framework ${_framework} \
    --runtime ${_runtime} \
    --no-self-contained \
    --no-restore \
    --configuration Release \
    -p:Platform=Posix \
    -p:AssemblyVersion=${pkgver} \
    -p:AssemblyConfiguration=${_branch} \
    -p:RuntimeIdentifiers=${_runtime} \
    -t:PublishAllRids \
    && dotnet build-server shutdown # Build servers do not terminate automatically

  # Build frontend
  yarn run build --env production
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/lidarr/bin/UI"

  # Remove Service Helpers, Update, and Windows files
  rm "${_artifacts}/ServiceInstall"*
  rm "${_artifacts}/ServiceUninstall"*
  rm "${_artifacts}/Lidarr.Windows."*

  # Copy backend
  cp -dr "${_artifacts}/"* "${pkgdir}/usr/lib/lidarr/bin"
  # Copy frontend
  cp -dr "${_output}/UI/"* "${pkgdir}/usr/lib/lidarr/bin/UI"

  # License
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

  # Disable built in updater.
  cd "${srcdir}"
  install -Dm644 package_info "${pkgdir}/usr/lib/lidarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/lidarr/package_info"

  # Systemd
  install -Dm644 lidarr.service "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -Dm644 lidarr.sysusers "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -Dm644 lidarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
