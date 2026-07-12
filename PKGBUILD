# Maintainer: Kcocoa <kamforzn2@proton.me>

pkgname=cli-proxy-api
pkgver=7.2.67
pkgrel=2
pkgdesc="Proxy server providing OpenAI, Gemini, Claude, and Codex compatible APIs"
arch=('x86_64')
url="https://github.com/router-for-me/CLIProxyAPI"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.26')
backup=('etc/cliproxyapi/config.yaml')
install='cliproxyapi.install'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'cliproxyapi.service'
  'cliproxyapi.sysusers'
  'cliproxyapi.tmpfiles'
)
sha256sums=('a0830bca9d363a2f9ccda34e3fd18fa7df0f895ccca8e2bcffc1c4ea5c5a1860'
            '57a58c2a750e354b8db46bc572ccc68d2dbca0b65180d8150ea1109f17625fc9'
            '23a8d6ed2449fec2a28a50d63e76b84cb9db33c5840a8fc9ecf6c015a5a689f8'
            '56b83923a262d3a1a35a278a64e5927b7c30a8a0f1f5fadcfffe77045b082eb1')

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
  install -Dm640 config.example.yaml "$pkgdir/etc/cliproxyapi/config.yaml"
  sed -i \
    -e 's|auth-dir: "~/.cli-proxy-api"|auth-dir: "/var/lib/cliproxyapi/auths"|' \
    -e 's|  dir: "plugins"|  dir: "/var/lib/cliproxyapi/plugins"|' \
    "$pkgdir/etc/cliproxyapi/config.yaml"

  install -Dm644 "$srcdir/cliproxyapi.service" \
    "$pkgdir/usr/lib/systemd/system/cliproxyapi.service"
  install -Dm644 "$srcdir/cliproxyapi.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/cliproxyapi.conf"
  install -Dm644 "$srcdir/cliproxyapi.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/cliproxyapi.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
