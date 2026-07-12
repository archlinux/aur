# Maintainer: Kcocoa <kamforzn2@proton.me>

pkgname=cli-proxy-api
pkgver=7.2.67
pkgrel=4
pkgdesc="Proxy server providing OpenAI, Gemini, Claude, and Codex compatible APIs"
arch=('x86_64')
url="https://github.com/router-for-me/CLIProxyAPI"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.26')
conflicts=('cli-proxy-api-bin')
backup=('etc/cli-proxy-api/config.yaml')
install='cli-proxy-api.install'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'cli-proxy-api.service'
  'cli-proxy-api.sysusers'
  'cli-proxy-api.tmpfiles'
)
sha256sums=('a0830bca9d363a2f9ccda34e3fd18fa7df0f895ccca8e2bcffc1c4ea5c5a1860'
            '4d04bb0c77b32beea913709771b21736d2c80a602f661ef9ad3a9debb9c2e8f3'
            '216ce81546d176c915838a42d555cd144b2b15fb8cd50dc17f14572a9e6e469a'
            'b13d239780c269e493b3d0abb63fafca7de9d3d377cd4fcae66327dcb91bd9b3')

prepare() {
  cd "CLIProxyAPI-$pkgver"

  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "CLIProxyAPI-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir/gopath"

  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -X main.Version=$pkgver -X main.Commit=v$pkgver" \
    -o cliproxyapi \
    ./cmd/server
}

package() {
  cd "CLIProxyAPI-$pkgver"

  install -Dm755 cliproxyapi "$pkgdir/usr/bin/cliproxyapi"
  install -Dm640 config.example.yaml "$pkgdir/etc/cli-proxy-api/config.yaml"
  sed -i \
    -e 's|auth-dir: "~/.cli-proxy-api"|auth-dir: "/var/lib/cli-proxy-api/auths"|' \
    -e 's|  dir: "plugins"|  dir: "/var/lib/cli-proxy-api/plugins"|' \
    "$pkgdir/etc/cli-proxy-api/config.yaml"

  install -Dm644 "$srcdir/cli-proxy-api.service" \
    "$pkgdir/usr/lib/systemd/system/cli-proxy-api.service"
  install -Dm644 "$srcdir/cli-proxy-api.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/cli-proxy-api.conf"
  install -Dm644 "$srcdir/cli-proxy-api.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/cli-proxy-api.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
