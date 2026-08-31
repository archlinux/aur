# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=whisparr-eros-develop
_pkgname=Whisparr
__pkgname=Whisparr-Eros
pkgver=3.4.0.1412
_pkgver=${pkgver%.*}-develop.${pkgver##*.}
pkgrel=1
pkgdesc='Adult movie organizer/manager for usenet and torrent users (develop branch)'
arch=(x86_64 aarch64 armv7h)
url='https://whisparr.com'
license=('GPL-3.0-or-later')
groups=(servarr)
depends=(
  aspnet-runtime-10.0
  gcc-libs
  glibc
  sqlite
  zlib
)
makedepends=(dotnet-sdk-10.0 yarn aspnet-targeting-pack-10.0)
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
install=whisparr-eros.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Whisparr/Whisparr-Eros/archive/refs/tags/v${_pkgver}.tar.gz"
  package_info
  whisparr-eros.service
  whisparr-eros.sysusers
  whisparr-eros.tmpfiles
)
sha256sums=('133a41ba0cf4be17a3351d10720ac4a94534257d519fc8228014da7bbded3ca4'
            '66ede8c26b84f6313501d17edfa44b8bec5778e0ff3cc1bdb42476fabd1f0410'
            '3964160cb383c88c8d335da2ca37cf800a282b32f68b4093595694f4ac8fe99c'
            '050f751d01333298bccfa84dbe11550031075f595009c15d37b089eaf453b19c'
            '98be10c54d9c371e985af5b347a8991942e3d92a67010787f4b5ef8987b1f64a')

case ${CARCH} in
  x86_64) _CARCH='x64' ;;
  aarch64) _CARCH='arm64' ;;
  armv7h) _CARCH='arm' ;;
esac

_framework='net10.0'
_runtime="linux-${_CARCH}"
_output='_output'
_artifacts="${_output}/${_framework}/${_runtime}/publish"
_branch='eros-develop'

prepare() {
  cd "${__pkgname}-${_pkgver}"

  # Remove upstream dotnet version
  rm global.json

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  # Uncomment after dotnet-sdk reaches 10.0.101
  # dotnet new globaljson --sdk-version 10.0.101 --force

  # Prepare backend
  dotnet restore "src/${_pkgname}.sln" \
    --runtime "${_runtime}" \
    --locked-mode

  # Prepare frontend
  yarn install --frozen-lockfile --network-timeout 120000
}

build() {
  cd "${__pkgname}-${_pkgver}"

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
    -p:AssemblyFileVersion=${pkgver} \
    -p:AssemblyInformationalVersion=${_pkgver} \
    -p:AssemblyConfiguration=${_branch} \
    -p:RuntimeIdentifiers="${_runtime}" \
    -t:PublishAllRids \
    && dotnet build-server shutdown # Build servers do not terminate automatically

  # Build frontend
  yarn run build --env production
}

package() {
  cd "${__pkgname}-${_pkgver}"

  install -dm755 "${pkgdir}/usr/lib/whisparr-eros/bin/UI"

  # Remove Service Helpers, Update, and Windows files
  rm "${_artifacts}/ServiceInstall"*
  rm "${_artifacts}/ServiceUninstall"*
  rm "${_artifacts}/Whisparr.Windows."*
  rm -rf "${_output}/Whisparr.Update"

  # Copy backend
  cp -dr "${_artifacts}/"* "${pkgdir}/usr/lib/whisparr-eros/bin"
  # Copy frontend
  cp -dr "${_output}/UI/"* "${pkgdir}/usr/lib/whisparr-eros/bin/UI"

  # Set executable permissions
  chmod 755 "${pkgdir}/usr/lib/whisparr-eros/bin/ffprobe"

  # License
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

  # Disable built in updater.
  cd "${srcdir}"
  install -Dm644 package_info "${pkgdir}/usr/lib/whisparr-eros"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/whisparr-eros/package_info"

  # Systemd
  install -Dm644 whisparr-eros.service "${pkgdir}/usr/lib/systemd/system/whisparr-eros.service"
  install -Dm644 whisparr-eros.sysusers "${pkgdir}/usr/lib/sysusers.d/whisparr-eros.conf"
  install -Dm644 whisparr-eros.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/whisparr-eros.conf"
}
