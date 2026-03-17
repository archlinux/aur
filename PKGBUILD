pkgname=linux-bing-daily-wallpaper
pkgver=1.0.1
pkgrel=1
pkgdesc="Bing daily wallpaper downloader for Linux"
arch=('x86_64')
url="https://github.com/duongdt011099/linux-bing-daily-wallpaper"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/duongdt011099/linux-bing-daily-wallpaper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=('!strip' '!debug')

build() {
  cd "$pkgname-$pkgver"

  case "$CARCH" in
    x86_64) rid="linux-x64" ;;
    aarch64) rid="linux-arm64" ;;
    *) echo "Unsupported architecture: $CARCH"; exit 1 ;;
  esac

  dotnet publish \
    -c Release \
    -r "$rid" \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:DebugType=None \
    -p:DebugSymbols=false
}

package() {
  cd "$pkgname-$pkgver"

  case "$CARCH" in
    x86_64) rid="linux-x64" ;;
    aarch64) rid="linux-arm64" ;;
  esac

  install -Dm755 \
    "./bin/Release/net10.0/$rid/publish/bwall" \
    "$pkgdir/usr/bin/bwall"

  install -Dm644 bwall.service \
    "$pkgdir/usr/lib/systemd/user/bwall.service"

  install -Dm644 bwall.timer \
    "$pkgdir/usr/lib/systemd/user/bwall.timer"
}