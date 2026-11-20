# Maintainer: LIghtJUNction <lightjunction@users.noreply.github.com>
pkgname=zcalld-compat
pkgver=0.1.3
pkgrel=1
pkgdesc='Optional privacy worker and community plugin compatibility for zcalld'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld-compat'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.26.8')
optdepends=('bun: JavaScript community plugin runtime' 'git: install pinned Git community sources' 'zcalld: native gateway and adapters')
options=('!lto')
source=("$pkgname-$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('a5a2566a96c6ddae13b288af0f3068728f3ee54b73faf8d493ef6cbecad37368')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_ENABLED=0
  local flags="-s -w -buildid= -X github.com/LIghtJUNction/zcalld-compat/internal/buildinfo.Version=$pkgver"
  go build -mod=readonly -trimpath -buildvcs=false -ldflags "$flags" -o zcalld-privacy ./cmd/zcalld-privacy
  go build -mod=readonly -trimpath -buildvcs=false -ldflags "$flags" -o zcalld-pluginctl ./cmd/zcalld-pluginctl
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./zcalld-privacy --version
  ./zcalld-pluginctl --version
  go test -mod=readonly ./cmd/zcalld-privacy ./privacy ./internal/redact ./internal/lazyre ./internal/pii/guard
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 zcalld-privacy "$pkgdir/usr/libexec/zcalld/zcalld-privacy"
  install -Dm755 zcalld-pluginctl "$pkgdir/usr/libexec/zcalld/zcalld-pluginctl"
  install -Dm644 community/vendor/host.js "$pkgdir/usr/libexec/zcalld/host.js"
  install -Dm644 community/vendor/pi.js "$pkgdir/usr/libexec/zcalld/pi.js"
  install -Dm644 community/vendor/mcp-tools.mjs "$pkgdir/usr/libexec/zcalld/mcp-tools.mjs"
  if [[ -d community/builtin ]]; then
    local script
    for script in community/builtin/*.mjs community/builtin/catalog.json; do
      install -Dm644 "$script" "$pkgdir/usr/libexec/zcalld/builtin/${script##*/}"
    done
  fi
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/licenses/$pkgname/third-party"
  install -m644 LICENSES/*.txt "$pkgdir/usr/share/licenses/$pkgname/third-party/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 NOTICE "$pkgdir/usr/share/doc/$pkgname/NOTICE"
  install -Dm644 NOTICE_ROUTING.md "$pkgdir/usr/share/doc/$pkgname/NOTICE_ROUTING.md"
  install -Dm644 NOTICE_MCP.md "$pkgdir/usr/share/doc/$pkgname/NOTICE_MCP.md"
  install -Dm644 UPSTREAM.json "$pkgdir/usr/share/doc/$pkgname/UPSTREAM.json"
}
