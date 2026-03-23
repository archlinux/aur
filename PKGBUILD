# Maintainer: fuero <fuerob@gmail.com>
_pkgname=GitVersion
pkgname=gitversion
# renovate: datasource=github-releases depName=GitTools/GitVersion
pkgver=6.6.2
pkgrel=4
_dotnet_version=10.0
pkgdesc='From git log to SemVer in no time'
arch=('x86_64')
url="https://github.com/GitTools/GitVersion"
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
)
options=('!strip' 'staticlibs')
license=('MIT')
depends=('glibc')
makedepends=(
  "dotnet-sdk>=${_dotnet_version}"
  "moreutils"
  "jq"
)
sha512sums=('79fade4751684e5ad234f808494d6c18fcb9fb93f24c6a91fd02ef444b79748d04f7b0ad2c1a5de7e21342c5f4181fd059fd059f7cde944d8eb99b9a0c092bae')


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
    -o "${srcdir}/build" \
    /p:DebugType=None \
    /p:DebugSymbols=false \
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
}
