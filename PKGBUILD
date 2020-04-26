# Maintainer: jmattheis <contact AT jmattheis DOT de>
# Contributor: ml <ml@visu.li>
pkgname=gotify-server
pkgver=2.0.15
_commit=e56f7bc4c7efdb61fea88a0b65d501277604cefa
pkgrel=1
pkgdesc='A simple server for sending and receiving messages in real-time per WebSocket.'
arch=('x86_64' 'i686' 'aarch64' 'armv7')
url='https://gotify.net/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'yarn')
backup=('etc/gotify/config.yml')
install="${pkgname}.install"
options=(emptydirs)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gotify/server/archive/v${pkgver}.tar.gz"
  'sysusers.d'
  'gotify-server.service'
  'config.patch'
)
sha256sums=('8bf545d51e57fc6bd2638d9d7d6f3a68d840a9253b234d4ed71c0fc64ab93a37'
            '39fc913f205bbb102ba42ce3d419f2feb0f9143f14ccffd242b3cd5f51a8c0de'
            '9aa04ff9a2981aa885d4f8df7467c4d7722aa12de7ae27376a4a11b559a0d1e2'
            '8009ba82fa98bfeeb8c51732d8506afdef4ccfdcd4071be5fcf64af06ae2b1f4')

prepare() {
  patch -N -p1 -d "server-$pkgver" <config.patch
}

build() {
  cd "server-$pkgver"
  (
    cd ui
    yarn --non-interactive --frozen-lockfile
    NODE_ENV=production yarn --non-interactive --frozen-lockfile build
  )
  go run hack/packr/packr.go
  local build_date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +%F-%T)
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  go build \
    -o "$pkgname" \
    -trimpath \
    -buildmode=pie \
    -ldflags "-X 'main.Version=${pkgver}' \
              -X 'main.Commit=${_commit}' \
              -X 'main.BuildDate=${build_date}' \
              -X 'main.Mode=prod'"
}

check() {
  cd "server-$pkgver"
  go test -v ./...
}

package() {
  install -Dm644 sysusers.d "$pkgdir/usr/lib/sysusers.d/gotify.conf"
  install -Dm644 gotify-server.service "$pkgdir/usr/lib/systemd/system/gotify-server.service"
  # required for StandardOutput in gotify-server.service
  install -dm755 "$pkgdir/var/log/gotify"

  cd "server-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 config.example.yml "$pkgdir/etc/gotify/config.yml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
