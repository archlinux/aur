# Maintainer: slatkin <slatkin@gmail.com>
pkgname=goflux
pkgver=0.1.0
pkgrel=1
pkgdesc='Miniflux desktop reader'
arch=('x86_64')
url='https://github.com/slatkin/goflux'
license=('custom')
depends=('webkit2gtk-4.1')
makedepends=('go' 'npm' 'imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slatkin/goflux/archive/v${pkgver}.tar.gz")
sha256sums=('c929b0063d8af00217555ab70fba8208dda53ffbff1c4a5363922a61db5a692e')

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=1
  export GOPATH="$srcdir/go"
  export GOMODCACHE="$srcdir/go/pkg/mod"
  export GOCACHE="$srcdir/go/cache"

  cd frontend
  npm ci
  npm run build
  cd ..

  go build -v \
    -tags webkit2_41 \
    -ldflags "-s -w" \
    -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  local icon_src="assets/appicon.png"
  for sz in 16 32 48 64 128 256; do
    install -dm755 "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps"
    magick "$icon_src" -resize "${sz}x${sz}" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/$pkgname.png"
  done
}
