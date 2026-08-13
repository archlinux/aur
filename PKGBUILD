# Maintainer: Kcocoa <kamforzn2@proton.me>

pkgname=cli-proxy-api
pkgver=7.2.130
pkgrel=1
pkgdesc="Proxy server providing OpenAI, Gemini, Claude, and Codex compatible APIs"
arch=('x86_64')
url="https://github.com/router-for-me/CLIProxyAPI"
license=('MIT')
depends=('glibc' 'ca-certificates')
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
sha256sums=('a10e3aec2e8219f41c65d035c4d8b0811b05ee2a5249d7293128b92d3d261784'
            '76a8e4e87e78c696c5e59f786f35cf4e015dd0103802e4236b60ac9454bbbf05'
            '216ce81546d176c915838a42d555cd144b2b15fb8cd50dc17f14572a9e6e469a'
            '9903cf5950cdc24f23eee53890393ad2ab9ac6daaf8aedf59df30721ca6357be')

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

  install -Dm755 cli-proxy-api "$pkgdir/usr/bin/cli-proxy-api"

  install -dm2775 "$pkgdir/etc/cli-proxy-api"
  install -m660 config.example.yaml "$pkgdir/etc/cli-proxy-api/config.yaml"
  sed -i \
    -e 's|auth-dir: "~/.cli-proxy-api"|auth-dir: "/var/lib/cli-proxy-api/auths"|' \
    "$pkgdir/etc/cli-proxy-api/config.yaml"

  install -Dm644 "$srcdir/cli-proxy-api.service" \
    "$pkgdir/usr/lib/systemd/system/cli-proxy-api.service"
  install -Dm644 "$srcdir/cli-proxy-api.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/cli-proxy-api.conf"
  install -Dm644 "$srcdir/cli-proxy-api.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/cli-proxy-api.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
