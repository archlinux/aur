# Maintainer: slatkin <slatkin@gmail.com>
pkgname=anus-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Miniflux desktop reader (git)'
arch=('x86_64')
url='https://github.com/slatkin/anus'
license=('MIT')
depends=('webkit2gtk-4.1')
makedepends=('go' 'npm' 'imagemagick' 'git')
provides=('anus')
conflicts=('anus')
source=("$pkgname::git+https://github.com/slatkin/anus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  export CGO_ENABLED=1
  export GOPATH="$srcdir/go"
  export GOMODCACHE="$srcdir/go/pkg/mod"
  export GOCACHE="$srcdir/go/cache"

  cd frontend
  npm ci
  VITE_API=wails npm run build
  cd ..

  go build -v \
    -tags webkit2_41,production \
    -ldflags "-s -w" \
    -o anus \
    .

  chmod -R u+w "$srcdir/go/pkg/mod"
}

package() {
  cd "$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 anus "$pkgdir/usr/bin/anus"
  install -Dm644 anus.desktop "$pkgdir/usr/share/applications/anus.desktop"

  local icon_src="assets/appicon.png"
  for sz in 16 32 48 64 128 256; do
    install -dm755 "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps"
    magick "$icon_src" -resize "${sz}x${sz}" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/anus.png"
  done

  install -Dm644 assets/appicon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/anus.svg"
}
