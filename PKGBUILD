# Maintainer: fuero <fuerob@gmail.com>
_pkgname=GitVersion
pkgname=gitversion
# renovate: datasource=github-releases depName=GitTools/GitVersion
pkgver=6.0.2
pkgrel=3
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
  # Use dotnet-sdk-bin from AUR
  #'dotnet-sdk>=8.0.8.sdk303'
  'dotnet-sdk-bin'
)
sha512sums=('7ba2bb753421fb6f3661a8b7e1ec5ff550e8ab7fb26156353b452a4e68c4873ba4326f249c4810bd9f1e97663ff152319fbb14e89794cb71b2cb80bb1945c1d1'
            '5dbfd6a0c7c82c8137f5d09868f6a242c9befdf6224316d6f55e9b5782d9e615e35ad853db53c3776922764979a00c478cb006c83a52e87a354f933974554f5d')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/dotnet-sdk-ver.patch"
}

build() {
  mkdir "${srcdir}/build"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  dotnet publish \
    src/GitVersion.App/GitVersion.App.csproj \
    --runtime linux-x64 \
    --sc \
    --framework net8.0 \
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
