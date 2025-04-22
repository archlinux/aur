# Maintainer: fuero <fuerob@gmail.com>
_pkgname=GitVersion
pkgname=gitversion
# renovate: datasource=github-releases depName=GitTools/GitVersion
pkgver=6.2.0
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
  'dotnet-sdk>=9.0'
)
sha512sums=('055fb8470f81132b6181f2b01a81ff8855c751827e42e1b20a6d18253144e36f7e549e2c98fd19ef8e44d46f1a0147f5557245df041bb814ad869d5818abf31a'
            '82007a00342b36c70e1b431485a484d51a23a8b034065d71ca7779cd77d685bb9bb93df581624e828473d2adafb894e6f24ca9468a0b6dc8bf130992af4d3789')

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
    --framework net9.0 \
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
