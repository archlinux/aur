# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

_name=Microsoft.ComponentDetection
pkgname=component-detection
pkgver=4.0.3 # renovate: datasource=github-tags depName=microsoft/component-detection
pkgrel=1
pkgdesc='Scans your project to determine what components you use'
arch=('x86_64')
url='https://github.com/microsoft/component-detection'
license=('MIT')
depends=('icu')
makedepends=('dotnet-sdk-6.0')
options=("staticlibs")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('07a522215a7d5857ed34c7295b18c4e6df4afdc34934de3011c795ad79b074dc889288c677bd05c30df59aec03c3b31391668ed5767b01948d0c120aafd6ff9c')

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
