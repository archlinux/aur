# Maintainer: ml <ml@visu.li>
# @TODO systemd socket, ui
pkgname=gotify-server
pkgver=2.0.13
_commit=b2b56e09af0ec937a74291d2582cc038fde950e8
pkgrel=2
pkgdesc='A simple server for sending and receiving messages in real-time per WebSocket.'
arch=(x86_64)
url='https://gotify.net/'
license=('MIT')
makedepends=('git' 'go')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gotify/server/archive/v${pkgver}.tar.gz"
  'sysusers.d'
  'tmpfiles.d'
  'config.yml'
  'gotify-server.service'
)
sha256sums=('a18177dce403df17e21d8b15551d0525d7c0140a5f8a06148df1db1bc2749639'
            '2052ac82ceb607701bd505c9df4170bb65c14601a4c8dda3c4ee36fd399c3dfa'
            '6d90cb466122331b983fac2d20a53f82c96db3e340297ec218cf296d0083dbc5'
            '4023cd8e241accc8e650dd5a93fbad0c3f9c3ca87b1a83d1fd39c83178216dfa'
            '9c187715b12269ff4bf6768b1e7813daafb5812df1f3bc010c894c7b736743fa')

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
  install -Dm644 sysusers.d "$pkgdir/usr/lib/sysusers.d/gotify.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/gotify.conf"
  install -Dm644 config.yml "$pkgdir/etc/gotify/config.yml"
  install -Dm644 gotify-server.service "$pkgdir/usr/lib/systemd/system/gotify-server.service"

  cd "server-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
