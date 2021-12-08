# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

_name=Microsoft.ComponentDetection
pkgname=component-detection
pkgver=1.0.6
pkgrel=1
pkgdesc='Scans your project to determine what components you use'
arch=('x86_64')
url='https://github.com/microsoft/component-detection'
license=('MIT')
depends=('icu')
makedepends=('dotnet-sdk')
options=("staticlibs")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0711b0458b92095ae5fc31266dc3eca46030b983d0961268abbba263bb6d77100960ea580348649283f76083cb150dacfe2be2bcac649fea7917c6ad684e9fb9')

build() {
  cd "$pkgname-$pkgver"
  MSBUILDDISABLENODEREUSE=1 dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
    -p:PublishTrimmed=true \
    --output $pkgname \
    "./src/${_name}/${_name}.csproj"
}

package() {
  cd "$pkgname-$pkgver"

  install -d $pkgdir/usr/{bin,lib}
  cp -r $pkgname "$pkgdir/usr/lib/"
  ln -s "/usr/lib/$pkgname/$_name" "$pkgdir/usr/bin/$pkgname"
}
