# Maintainer: fuero <fuerob@gmail.com>
_pkgname=GitVersion
pkgname=gitversion
# renovate: datasource=github-releases depName=GitTools/GitVersion
pkgver=5.12.0
pkgrel=1
pkgdesc='From git log to SemVer in no time'
arch=('x86_64')
url="https://github.com/GitTools/GitVersion"
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
)
license=('MIT')
depends=('glibc')
makedepends=(
  'dotnet-sdk-6.0'
)
sha512sums=('7d156ed5675d3200d7bc2ccb190234c0647b48e5411fe9c0c3205663dddb30597b48df14f50d16724d1f538f9352b11cddbab2678861e7d6176255139ad11e88')

build() {
  mkdir "${srcdir}/build"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  dotnet publish \
    src/GitVersion.App/GitVersion.App.csproj \
    --runtime linux-x64 \
    --framework net6.0 \
    --sc \
    -o "${srcdir}/build" \
    /p:DebugType=None \
    /p:DebugSymbols=false \
    -p:PublishTrimmed=false \
    -p:PublishReadyToRun=true \
    -p:PublishSingleFile=true \
    -p:IncludeNativeLibrariesForSelfExtract=true
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D "${srcdir}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
