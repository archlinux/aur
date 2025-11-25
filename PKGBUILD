# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

_name=Microsoft.ComponentDetection
pkgname=component-detection
pkgver=6.2.0 # renovate: datasource=github-tags depName=microsoft/component-detection
pkgrel=1
pkgdesc='Scans your project to determine what components you use'
arch=('x86_64')
url='https://github.com/microsoft/component-detection'
license=('MIT')
depends=('icu')
makedepends=('dotnet-sdk')
options=("staticlibs")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7070bda6cb4c64a81e423308476307db71f10da8bf18f6b17ff00f9980bb5e0cf12b7c5b71d39f45dfd85c9dbded407e9e52018f236a9aa95744406c6570f420')

build() {
  cd "$pkgname-$pkgver"
  rm global.json
  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 \
  MSBUILDDISABLENODEREUSE=1 \
  DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1 \
  DOTNET_CLI_TELEMETRY_OPTOUT=1 \
  dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
    -property:MinVerSkip=true \
    -property:PackageVersion=${pkgver} \
    -property:AssemblyVersion=${pkgver}.0 \
    -property:FileVersion=${pkgver}.0 \
    -property:TreatWarningsAsErrors=false \
    --output $pkgname \
    "./src/${_name}/${_name}.csproj"
}

package() {
  cd "$pkgname-$pkgver"

  install -d $pkgdir/usr/{bin,lib}
  cp -r $pkgname "$pkgdir/usr/lib/"
  ln -s "/usr/lib/$pkgname/$_name" "$pkgdir/usr/bin/$pkgname"
}
