# SPDX-License-Identifier: 0BSD
# Maintainer: jaytau <95355656+jay-tau@users.noreply.github.com>

pkgname=kino-tui
_pkgname=kino
pkgver=0.6.0
pkgrel=1
pkgdesc='Terminal client for browsing and playing Plex or Jellyfin media'
arch=('x86_64' 'aarch64')
url='https://github.com/mmcdole/kino'
license=('MIT')
depends=('glibc' 'ca-certificates')
makedepends=('go>=1.25.5')
optdepends=('mpv: recommended media player'
            'vlc: alternative media player'
            'xdg-utils: fallback playback via the system URL handler')
conflicts=('kino')
options=('!lto' '!debug')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40f4fa8d1be118003c2146879b3a4760852e9e816158f869cbec6dc4457a0fb5')

prepare() {
  cd "$_pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  GOFLAGS=-modcacherw go mod download
}

build() {
  cd "$_pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  go build -buildvcs=false -trimpath -buildmode=pie -mod=readonly -modcacherw \
    -ldflags="-linkmode=external -X main.Version=v$pkgver" \
    -o kino ./cmd/kino
}

check() {
  cd "$_pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  go test -mod=readonly ./...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 kino "$pkgdir/usr/bin/kino"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md config.example.yaml
}
