# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

_name=Microsoft.ComponentDetection
pkgname=component-detection
pkgver=8.0.1 # renovate: datasource=github-tags depName=microsoft/component-detection
pkgrel=1
pkgdesc='Scans your project to determine what components you use'
arch=('x86_64')
url='https://github.com/microsoft/component-detection'
license=('MIT')
depends=('icu')
makedepends=('dotnet-sdk')
options=("staticlibs")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('75d4ebf20d8f63b28727f525d3db48c0115738929d6c9bc4adb56e319e66a4391edf16b4ada793e5d306392694b0b387c7869c275d714cce6f378ba020db8ad0')

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
