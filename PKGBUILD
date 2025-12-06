# Maintainer: fuero <fuerob@gmail.com>
_pkgname=GitVersion
pkgname=gitversion
# renovate: datasource=github-releases depName=GitTools/GitVersion
pkgver=6.5.1
pkgrel=4
_dotnet_version=10.0
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
sha512sums=('65fe0316017766d76fa5b203b26e4b5ec0c48156a3feeee63d2b7fcba30c9e7b48f1ceeb76241964f63f5c16674a81e93ed14b8ea0f6cadafc925a59fbfc3550'
            'aa2f668c93555b3cfb27a611c5c2620992562d605d3b346b45bf71774d78eb4f5e5fc4ec7ecf1aa56a4a3adcb141f3669ae5c571bb45974ceeda88fedcec3dd4')

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
