# Maintainer: jmattheis <contact AT jmattheis DOT de>
# Contributor: ml <ml@visu.li>
pkgname=gotify-server
pkgver=2.2.1
pkgrel=1
pkgdesc='A simple server for sending and receiving messages in real-time per WebSocket.'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://gotify.net/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'gzip' 'yarn')
backup=('etc/gotify/config.yml')
install=gotify-server.install
options=(emptydirs)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gotify/server/archive/v${pkgver}.tar.gz"
  'sysusers.d'
  'gotify-server.service'
  'config.patch'
)
sha256sums=('812243d51f9f517400e05821474e0bd6b50ab87695139d14caf57db52b0e9dba'
            '39fc913f205bbb102ba42ce3d419f2feb0f9143f14ccffd242b3cd5f51a8c0de'
            '9aa04ff9a2981aa885d4f8df7467c4d7722aa12de7ae27376a4a11b559a0d1e2'
            'a8a511e2b98fa548391a1602fcfa05df0e10fae6f5904cbfc4202566f2dd8265')

prepare() {
  patch -N -p1 -d "server-$pkgver" <config.patch
}

build() {
  local _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  cd "server-$pkgver"
  (
    cd ui

    if node --help | grep -q -- "--openssl-legacy-provider"; then
      export NODE_OPTIONS=--openssl-legacy-provider
    fi

    yarn --frozen-lockfile
    NODE_ENV=production yarn --frozen-lockfile build
  )
  go run hack/packr/packr.go -- .
  export CGO_CFLAGS="$CFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw'
  go build \
    -o "$pkgname" \
    -trimpath \
    -ldflags "-X 'main.Version=${pkgver}' \
              -X 'main.Commit=${_commit}' \
              -X 'main.BuildDate=$(date -u -d "@${SOURCE_DATE_EPOCH}" +%F-%T)' \
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
