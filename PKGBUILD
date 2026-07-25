# Maintainer: Kcocoa <kamforzn2@proton.me>

pkgname=cli-proxy-api
pkgver=7.2.99
pkgrel=1
pkgdesc="Proxy server providing OpenAI, Gemini, Claude, and Codex compatible APIs"
arch=('x86_64')
url="https://github.com/router-for-me/CLIProxyAPI"
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('cli-proxy-api-bin')
backup=('etc/cli-proxy-api/config.yaml')
install='cli-proxy-api.install'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'cli-proxy-api.service'
  'cli-proxy-api.sysusers'
  'cli-proxy-api.tmpfiles'
)
sha256sums=('67238d5b921aa69188424d5da1157e8dd3ef92550d031aecff4ad3e943aaa242'
            '789be86c8b7ce964a0b7c78b07bd561a2263f9ada2c927b2dd789c88fb07494e'
            '216ce81546d176c915838a42d555cd144b2b15fb8cd50dc17f14572a9e6e469a'
            '86cec862115e7d26bcc68668b7dfa181539aeb6ff32fb061cead8ed50627502e')

prepare() {
  cd "CLIProxyAPI-$pkgver"

  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "CLIProxyAPI-$pkgver"

  local commit="v$pkgver"
  local build_date
  build_date="$(date -u -d "@$SOURCE_DATE_EPOCH" +%Y-%m-%dT%H:%M:%SZ)"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir/gopath"

  CGO_ENABLED=1 go build \
    -buildvcs=false \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags="-s -w -linkmode=external \
      -X main.Version=$pkgver \
      -X main.Commit=$commit \
      -X main.BuildDate=$build_date" \
    -o cli-proxy-api \
    ./cmd/server
}

package() {
  cd "CLIProxyAPI-$pkgver"

  install -Dm755 cli-proxy-api "$pkgdir/usr/bin/cliproxyapi"
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
