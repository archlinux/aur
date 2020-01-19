# Maintainer: ml <ml@visu.li>
# @TODO config, systemd service/socket, sysusers.d/*.conf, tmpfiles.d/*.conf
pkgname=gotify-server
pkgver=2.0.13
_commit=b2b56e09af0ec937a74291d2582cc038fde950e8
pkgrel=1
pkgdesc='A simple server for sending and receiving messages in real-time per WebSocket.'
arch=(x86_64)
url='https://gotify.net/'
license=('MIT')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gotify/server/archive/v${pkgver}.tar.gz")
sha256sums=('a18177dce403df17e21d8b15551d0525d7c0140a5f8a06148df1db1bc2749639')

build() {
  cd "server-$pkgver"
  export GOPATH="$srcdir"
  local build_date=$(date "+%F-%T" -d "@${SOURCE_DATE_EPOCH}")
  go build \
    -o "$pkgname" \
    -trimpath \
    -buildmode=pie \
    -ldflags "-X 'main.Version=${pkgver}' \
              -X 'main.Commit=${_commit}' \
              -X 'main.BuildDate=${build_date}' \
              -X 'main.Mode=prod' \
              -extldflags=${LDFLAGS}"
}

check() {
  cd "server-$pkgver"
  export GOPATH="$srcdir"
  go test -v ./...
}

package() {
  cd "server-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
