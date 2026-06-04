# Maintainer: slatkin <slatkin@gmail.com>
pkgname=goflux-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Miniflux desktop reader (git)'
arch=('x86_64')
url='https://github.com/slatkin/goflux'
license=('custom')
depends=('webkit2gtk-4.1')
makedepends=('go' 'npm' 'imagemagick' 'git')
provides=('goflux')
conflicts=('goflux')
source=("$pkgname::git+https://github.com/slatkin/goflux.git")
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
  npm run build
  cd ..

  go build -v \
    -tags webkit2_41,production \
    -ldflags "-s -w" \
    -o goflux .

  chmod -R u+w "$srcdir/go/pkg/mod"
}

package() {
  cd "$pkgname"

  install -Dm755 goflux "$pkgdir/usr/bin/goflux"
  install -Dm644 goflux.desktop "$pkgdir/usr/share/applications/goflux.desktop"

  local icon_src="assets/appicon.png"
  for sz in 16 32 48 64 128 256; do
    install -dm755 "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps"
    magick "$icon_src" -resize "${sz}x${sz}" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/goflux.png"
  done
}
