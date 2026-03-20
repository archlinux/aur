# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=recyclarr
_pkgname=Recyclarr
pkgver=8.5.1
pkgrel=1
pkgdesc='Automatically synchronize recommended settings from the TRaSH guides to your Sonarr/Radarr instances.'
arch=(x86_64 aarch64 armv7h)
url='https://recyclarr.dev'
license=('MIT')
depends=(
  aspnet-runtime-10.0
  gcc-libs
  glibc
  sqlite
)
makedepends=(dotnet-sdk-10.0 git)
optdepends=(
  'sonarr: Smart PVR for newsgroup and torrent users.'
  'radarr: Movie organizer/manager for usenet and torrent users.'
)
backup=('etc/recyclarr/recyclarr.yml')
source=(
  "git+https://github.com/recyclarr/recyclarr.git#tag=v${pkgver}"
  recyclarr.service
  recyclarr.sysusers
  recyclarr.timer
  recyclarr.tmpfiles
  recyclarr.yml
)
sha256sums=('1f2f8706ee03175c56665b6ad4d75349e3a5b38ac5feac49a16ea03fc8fbcbcd'
            '7e45ab478a9e51684aac716c50be7f3283ad478509532a0f60469e2f2c76970d'
            '3d2a1b3690d956a8f195c2cd1b28c28beecda354023e8de78471ca35610fb57d'
            'e8a2959e079a6a77c3eefaf77defd69e76944c2a1378257dcaf0286abde002a6'
            '458b7c0550f3c2e41f63bac197ce55a5699432ee24080f7917b001c0eec2c7ec'
            'ed7f78e603f778e8a80aeb73d4e4781ff900fed8704d72ea7e2d48205f1cc0eb')

case ${CARCH} in
  x86_64) _CARCH='x64' ;;
  aarch64) _CARCH='arm64' ;;
  armv7h) _CARCH='arm' ;;
esac

_framework='net10.0'
_runtime="linux-${_CARCH}"
_artifacts="src/Recyclarr.Cli/bin/Release/${_framework}/publish"

build() {
  cd "${pkgname}"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  # dotnet publish ${_pkgname}.sln \
  dotnet publish src/Recyclarr.Cli \
    --framework ${_framework} \
    --no-self-contained \
    --configuration Release \
    -p:AssemblyVersion=${pkgver} \
    -p:AssemblyConfiguration=master \
    && dotnet build-server shutdown # Build servers do not terminate automatically
}

package() {
  cd "${pkgname}"
  install -dm755 "${pkgdir}/usr/lib/recyclarr"

  cp -dr "${_artifacts}/"* "${pkgdir}/usr/lib/recyclarr"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}"
  install -Dm644 recyclarr.yml "${pkgdir}/etc/recyclarr/recyclarr.yml"
  install -Dm644 recyclarr.service "${pkgdir}/usr/lib/systemd/system/recyclarr.service"
  install -Dm644 recyclarr.timer "${pkgdir}/usr/lib/systemd/system/recyclarr.timer"
  install -Dm644 recyclarr.sysusers "${pkgdir}/usr/lib/sysusers.d/recyclarr.conf"
  install -Dm644 recyclarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/recyclarr.conf"
}
