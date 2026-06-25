# Maintainer: fuero <fuerob@gmail.com>
_pkgname=GitVersion
pkgname=gitversion
# renovate: datasource=github-releases depName=GitTools/GitVersion
pkgver=6.7.0
pkgrel=6
_dotnet_version=10.0
pkgdesc='From git log to SemVer in no time'
arch=('x86_64')
url="https://github.com/GitTools/GitVersion"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
options=(
  '!debug'
  '!strip'
  'staticlibs'
)
license=('MIT')
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
makedepends=(
  "dotnet-sdk>=${_dotnet_version}"
  'moreutils'
  'jq'
)
sha512sums=('d86688a3fa6bc68fa72ee10c0ba6372dd6cb9ffeab24bfce2f2ddf10e27a9c4bffb636a27660fc3a1edd4a60980bfc990dd6c8c53748c5de6f6253193b7f4893')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  jq -r 'del(.sdk)' < global.json | sponge global.json
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet publish \
    src/GitVersion.App/GitVersion.App.csproj \
    --runtime linux-x64 \
    --framework "net${_dotnet_version}" \
    --sc \
    --configuration release \
    --output "${srcdir}/build" \
    -p:DebugType=None \
    -p:DebugSymbols=false \
    -p:Optimize=true \
    -p:PublishTrimmed=false \
    -p:PublishReadyToRun=true \
    -p:PublishSingleFile=true \
    -p:IncludeNativeLibrariesForSelfExtract=true
}

#check() {
#  cd "${srcdir}/${_pkgname}-${pkgver}"
#
#  export NUGET_PACKAGES="$PWD/nuget"
#  export DOTNET_NOLOGO=true
#  export DOTNET_CLI_TELEMETRY_OPTOUT=true
#  for i in src/*.Tests
#  do
#    dotnet test \
#      --runtime linux-x64 \
#      --framework "net${_dotnet_version}" \
#      ./${i}
#  done
#}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D "${srcdir}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
