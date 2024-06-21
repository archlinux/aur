# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

_name=Microsoft.ComponentDetection
pkgname=component-detection
pkgver=4.5.1 # renovate: datasource=github-tags depName=microsoft/component-detection
pkgrel=1
pkgdesc='Scans your project to determine what components you use'
arch=('x86_64')
url='https://github.com/microsoft/component-detection'
license=('MIT')
depends=('icu')
makedepends=('dotnet-sdk-6.0')
options=("staticlibs")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4c27b6161c097ed33f1732ffd3e8bdb4027a86a67cd3675b6f7789abb2cd3f08407616724d8ead00d3b8a5033613ea838811d59d2d33dfc1248ecd03e34d0011')

build() {
  cd "$pkgname-$pkgver"
  rm global.json
  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 \
  MSBUILDDISABLENODEREUSE=1 \
  dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
    -property:MinVerSkip=true \
    -property:PackageVersion=${pkgver} \
    -property:AssemblyVersion=${pkgver}.0 \
    -property:FileVersion=${pkgver}.0 \
    --output $pkgname \
    "./src/${_name}/${_name}.csproj"
}

package() {
  cd "$pkgname-$pkgver"

  install -d $pkgdir/usr/{bin,lib}
  cp -r $pkgname "$pkgdir/usr/lib/"
  ln -s "/usr/lib/$pkgname/$_name" "$pkgdir/usr/bin/$pkgname"
}
