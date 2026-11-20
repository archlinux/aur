# Maintainer: LIghtJUNction <lightjunction@users.noreply.github.com>
pkgname=zcalld-compat
pkgver=0.3.1
pkgrel=1
pkgdesc='Optional privacy worker and community plugin compatibility for zcalld'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld-compat'
license=('MIT')
depends=('glibc' 'zcalld>=0.4.0')
makedepends=('go>=1.26.8')
checkdepends=('python')
optdepends=('bun: JavaScript community plugin runtime' 'git: install pinned Git community sources')
options=('!lto')
source=("$pkgname-$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('ddb48aafa3d2605cc77caf9c5d82d7e8328559b6865f45d9b3ef917f50932cd6')

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
  go build -buildmode=pie -mod=readonly -trimpath -buildvcs=false -ldflags "$_flags -extldflags \"$LDFLAGS\"" -o zcalld-claude-tui ./cmd/zcalld-claude-tui
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./zcalld-privacy --version
  ./zcalld-pluginctl --version
  ./zcalld-claude-tui --version
  go test -mod=readonly ./cmd/zcalld-privacy ./cmd/zcalld-claude-tui ./privacy ./desktop ./maintenance ./claudemaintenance ./claudeprovider ./internal/claudebridge ./internal/claudetui/... ./internal/redact ./internal/lazyre ./internal/pii/guard
  python3 scripts/test-maintenance.py ./zcalld-pluginctl
  go test -mod=readonly -c -o fake-claude-tui ./internal/claudetui
  python3 scripts/test-claude-tui.py --helper ./zcalld-claude-tui --fake-claude ./fake-claude-tui
  go test -mod=readonly -c -o fake-claude-maintenance ./claudemaintenance
  python3 scripts/test-claude-maintenance.py --helper ./zcalld-pluginctl --fake-claude ./fake-claude-maintenance
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 zcalld-privacy "$pkgdir/usr/lib/$pkgname/zcalld-privacy"
  install -Dm755 zcalld-pluginctl "$pkgdir/usr/lib/$pkgname/zcalld-pluginctl"
  install -Dm755 zcalld-claude-tui "$pkgdir/usr/lib/$pkgname/zcalld-claude-tui"
  install -d "$pkgdir/usr/bin"
  ln -s "../lib/$pkgname/zcalld-privacy" "$pkgdir/usr/bin/zcalld-privacy"
  ln -s "../lib/$pkgname/zcalld-pluginctl" "$pkgdir/usr/bin/zcalld-pluginctl"
  ln -s "../lib/$pkgname/zcalld-claude-tui" "$pkgdir/usr/bin/zcalld-claude-tui"
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
  install -Dm644 LICENSE.magpie "$pkgdir/usr/share/licenses/$pkgname/LICENSE.magpie"
  install -d "$pkgdir/usr/share/licenses/$pkgname/third-party"
  install -m644 LICENSES/*.txt "$pkgdir/usr/share/licenses/$pkgname/third-party/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  sed -i 's|/usr/libexec/zcalld|/usr/lib/zcalld-compat|g' "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 NOTICE "$pkgdir/usr/share/doc/$pkgname/NOTICE"
  install -Dm644 NOTICE_ROUTING.md "$pkgdir/usr/share/doc/$pkgname/NOTICE_ROUTING.md"
  install -Dm644 NOTICE_MCP.md "$pkgdir/usr/share/doc/$pkgname/NOTICE_MCP.md"
  install -Dm644 NOTICE.magpie "$pkgdir/usr/share/doc/$pkgname/NOTICE.magpie"
  install -Dm644 UPSTREAM.json "$pkgdir/usr/share/doc/$pkgname/UPSTREAM.json"
  install -Dm644 docs/CODEX-MAINTENANCE.md "$pkgdir/usr/share/doc/$pkgname/docs/CODEX-MAINTENANCE.md"
  install -Dm644 docs/CLAUDE-MAINTENANCE.md "$pkgdir/usr/share/doc/$pkgname/docs/CLAUDE-MAINTENANCE.md"
  install -Dm644 docs/CLAUDE-TUI-SOURCE.json "$pkgdir/usr/share/doc/$pkgname/docs/CLAUDE-TUI-SOURCE.json"
  install -Dm644 packaging/launchd/org.zcalld.maintenance.plist.in "$pkgdir/usr/share/doc/$pkgname/packaging/launchd/org.zcalld.maintenance.plist.in"
  install -Dm644 packaging/windows/zcalld-maintenance.xml.in "$pkgdir/usr/share/doc/$pkgname/packaging/windows/zcalld-maintenance.xml.in"
  install -Dm644 packaging/systemd/user/zcalld-maintenance.service "$pkgdir/usr/lib/systemd/user/zcalld-maintenance.service"
  install -Dm644 packaging/systemd/user/zcalld-maintenance.timer "$pkgdir/usr/lib/systemd/user/zcalld-maintenance.timer"
}
