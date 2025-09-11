# Maintainer: fuero <fuerob@gmail.com>
_pkgname=GitVersion
pkgname=gitversion
# renovate: datasource=github-releases depName=GitTools/GitVersion
pkgver=6.4.0
pkgrel=4
_dotnet_version=9.0
pkgdesc='From git log to SemVer in no time'
arch=('x86_64')
url="https://github.com/GitTools/GitVersion"
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
  'dotnet-sdk-ver.patch'
)
options=('!strip' 'staticlibs')
license=('MIT')
depends=('glibc')
makedepends=(
  "dotnet-sdk>=${_dotnet_version}"
)
sha512sums=('0f15df3c339e978a34e7b5d6ee77af1ccb6be7e702099003faf6ebba23f41e9bbbb0e69199e734ce2cd05f225b39d6c783d151f10e745b98c5e11739750b3c60'
            '323ad7b23bed74b8b2530a3555f0ca4d350244d1cda5603217393f661754cfa193806886fe4d24efda1d96779bbfa7097603850bb778ca9b906518778e06c77e')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/dotnet-sdk-ver.patch"
}

build() {
  mkdir "${srcdir}/build"
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
