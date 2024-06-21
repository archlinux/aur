# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>

pkgname=hashdir
pkgver=1.3.2
pkgrel=1
pkgdesc="A command-line utility to hash directories and files"
arch=('x86_64' 'aarch64')
url="https://ultimateanu.github.io/hashdir/"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('dotnet-sdk-8.0')
options=('!strip')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ultimateanu/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('b75a448cad1ff1fdd484b1de8ced1e26ff9eedf70cb24a64cce19db5978fe9b7')

build() {
  cd "$pkgname-$pkgver"

  if [ "$CARCH" = "x86_64" ]; then
    _RUNTIME_IDENTIFIER="linux-x64"
  elif [ "$CARCH" = "aarch64" ]; then
    _RUNTIME_IDENTIFIER="linux-arm64"
  else
    >&2 echo "ERROR: Unsupported architecture '$CARCH'"
    exit 1
  fi

  dotnet publish -c release -p:PublishProfile=binary src/App/App.fsproj -p:RuntimeIdentifier="$_RUNTIME_IDENTIFIER" -o build --framework net8.0
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  cp "build/$pkgname" "$pkgdir/usr/bin"
}
