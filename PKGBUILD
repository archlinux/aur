# Maintainer: LIghtJUNction <lightjunction@users.noreply.github.com>
pkgname=zcalld-compat
pkgver=0.1.6
pkgrel=1
pkgdesc='Optional privacy worker and community plugin compatibility for zcalld'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld-compat'
license=('MIT')
depends=('glibc' 'zcalld>=0.2.3')
makedepends=('go>=1.26.8')
optdepends=('bun: JavaScript community plugin runtime' 'git: install pinned Git community sources')
options=('!lto')
source=("$pkgname-$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('0860722b334c7b3e6cdbcb1ea1114ecea49201846c3bd6c6bdc74351fb97dd80')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  local _flags="-s -w -buildid= -linkmode=external -X github.com/LIghtJUNction/zcalld-compat/internal/buildinfo.Version=$pkgver"
  go build -buildmode=pie -mod=readonly -trimpath -buildvcs=false -ldflags "$_flags -extldflags \"$LDFLAGS\"" -o zcalld-privacy ./cmd/zcalld-privacy
  go build -buildmode=pie -mod=readonly -trimpath -buildvcs=false -ldflags "$_flags -extldflags \"$LDFLAGS\"" -o zcalld-pluginctl ./cmd/zcalld-pluginctl
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./zcalld-privacy --version
  ./zcalld-pluginctl --version
  go test -mod=readonly ./cmd/zcalld-privacy ./privacy ./internal/redact ./internal/lazyre ./internal/pii/guard
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 zcalld-privacy "$pkgdir/usr/lib/$pkgname/zcalld-privacy"
  install -Dm755 zcalld-pluginctl "$pkgdir/usr/lib/$pkgname/zcalld-pluginctl"
  install -d "$pkgdir/usr/bin"
  ln -s "../lib/$pkgname/zcalld-privacy" "$pkgdir/usr/bin/zcalld-privacy"
  ln -s "../lib/$pkgname/zcalld-pluginctl" "$pkgdir/usr/bin/zcalld-pluginctl"
  install -Dm644 community/vendor/host.js "$pkgdir/usr/lib/$pkgname/host.js"
  install -Dm644 community/vendor/pi.js "$pkgdir/usr/lib/$pkgname/pi.js"
  install -Dm644 community/vendor/mcp-tools.mjs "$pkgdir/usr/lib/$pkgname/mcp-tools.mjs"
  if [[ -d community/builtin ]]; then
    local _script
    for _script in community/builtin/*.mjs community/builtin/catalog.json; do
      install -Dm644 "$_script" "$pkgdir/usr/lib/$pkgname/builtin/${_script##*/}"
    done
  fi
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/licenses/$pkgname/third-party"
  install -m644 LICENSES/*.txt "$pkgdir/usr/share/licenses/$pkgname/third-party/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  sed -i 's|/usr/libexec/zcalld|/usr/lib/zcalld-compat|g' "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 NOTICE "$pkgdir/usr/share/doc/$pkgname/NOTICE"
  install -Dm644 NOTICE_ROUTING.md "$pkgdir/usr/share/doc/$pkgname/NOTICE_ROUTING.md"
  install -Dm644 NOTICE_MCP.md "$pkgdir/usr/share/doc/$pkgname/NOTICE_MCP.md"
  install -Dm644 UPSTREAM.json "$pkgdir/usr/share/doc/$pkgname/UPSTREAM.json"
}
