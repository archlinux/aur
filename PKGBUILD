# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>

pkgname=openclaw
pkgver=2026.4.20
pkgrel=1
pkgdesc='Personal AI assistant / multi-channel gateway'
arch=('x86_64' 'aarch64')
url='https://github.com/openclaw/openclaw'
license=('MIT')
depends=('nodejs>=22')
makedepends=('pnpm')
source=("https://github.com/openclaw/openclaw/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29a843f7fdbca5e9496ba932036883a654e2f264692e21d6595cb6c18cfcb8d3')

# If upstream version tags ever include extra suffixes, this can help:
# pkgver() {
#   cd "$srcdir/$pkgname-$pkgver"
#   node -p "require('./package.json').version"
# }

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Upstream keeps pnpm on a hoisted layout via .npmrc.
  # Leave that in place unless you have a reason to patch it.
  #
  # If you ever need to stop a troublesome postinstall during packaging,
  # this is where you'd patch package.json or environment.
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CI=1
  export NODE_ENV=production

  pnpm install --frozen-lockfile

  # Build the actual runtime, not just the UI
  pnpm build

  # If upstream still expects a separate UI build, keep this too
  pnpm ui:build || true
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  test -f openclaw.mjs
  test -f dist/entry.js -o -f dist/entry.mjs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"

  # Copy the runtime tree. Start broad, then trim once confirmed.
  cp -a \
    openclaw.mjs \
    package.json \
    pnpm-workspace.yaml \
    dist \
    dist-runtime \
    assets \
    skills \
    scripts \
    packages \
    extensions \
    vendor \
    node_modules \
    "$pkgdir/usr/lib/$pkgname/" 2>/dev/null || true

  # Docs / license
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Launcher
  cat > "$pkgdir/usr/bin/openclaw" <<'EOF'
#!/bin/sh
exec node /usr/lib/openclaw/openclaw.mjs "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/openclaw"

  # Clean obvious packaging cruft once things are working.
  rm -rf "$pkgdir/usr/lib/$pkgname/.git" 2>/dev/null || true
}
