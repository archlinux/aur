# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

_name=Microsoft.ComponentDetection
pkgname=component-detection
pkgver=4.9.6 # renovate: datasource=github-tags depName=microsoft/component-detection
pkgrel=1
pkgdesc='Scans your project to determine what components you use'
arch=('x86_64')
url='https://github.com/microsoft/component-detection'
license=('MIT')
depends=('icu')
makedepends=('dotnet-sdk-6.0')
options=("staticlibs")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('17604901297338f0e81e5401a194b3c491eabf72d0320f4579802b671876a3c64b7fd5b15201e299747ae53ac6e5ffc99be95170bd5a0573422a2022b1c6f2a2')

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
