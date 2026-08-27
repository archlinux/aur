# Maintainer: jmattheis <contact AT jmattheis DOT de>
# Contributor: ml <ml@visu.li>
pkgname=gotify-server
pkgver=3.1.0
pkgrel=1
pkgdesc='A simple server for sending and receiving messages in real-time per WebSocket.'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://gotify.net/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'gzip' 'yarn')
backup=('etc/gotify/server.env')
install=gotify-server.install
options=(emptydirs)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gotify/server/archive/v${pkgver}.tar.gz"
  'sysusers.d'
  'gotify-server.service'
  'config.patch'
)
sha256sums=('0223df90d3f757bcdbe238df42d219b48410fdea059c7d6f34fc9ddc5c66db27'
            '39fc913f205bbb102ba42ce3d419f2feb0f9143f14ccffd242b3cd5f51a8c0de'
            'fd77369ddf3ec0097066517ade97fe06bb1336557adbac41a11f37df852c9814'
            'aed307a8c5072d0f329a43a270ec4d32584fb0a2967e3be44c2a72d7ffaa4a0c')

prepare() {
  patch -N -p1 -d "server-$pkgver" <config.patch
}

build() {
  local _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  cd "server-$pkgver"
  (
    cd ui
    PUPPETEER_SKIP_DOWNLOAD=true yarn --frozen-lockfile
    NODE_ENV=production yarn --frozen-lockfile build
  )
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

package() {
  install -Dm644 sysusers.d "$pkgdir/usr/lib/sysusers.d/gotify.conf"
  install -Dm644 gotify-server.service "$pkgdir/usr/lib/systemd/system/gotify-server.service"
  # required for StandardOutput in gotify-server.service
  install -dm755 "$pkgdir/var/log/gotify"

  cd "server-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 gotify-server.env.example "$pkgdir/etc/gotify/server.env"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
