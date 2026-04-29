# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>

pkgname=openclaw
pkgver=2026.4.26
pkgrel=1
pkgdesc='Personal AI assistant / multi-channel gateway'
arch=('x86_64' 'aarch64')
url='https://github.com/openclaw/openclaw'
license=('MIT')
depends=('nodejs>=22' 'npm')
makedepends=('pnpm')
source=("https://github.com/openclaw/openclaw/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa7fd95c3e4075102b020636c63c3b1383fc20ee622413a0cb6ee1f1e7251d2d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CI=1
  export NODE_ENV=production

  pnpm install --frozen-lockfile
  pnpm build
  pnpm ui:build || true
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  test -f openclaw.mjs
  test -f docs/reference/templates/AGENTS.md
  test -f dist/entry.js || test -f dist/entry.mjs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/lib/$pkgname/docs/reference"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"

  cp -a \
    openclaw.mjs \
    package.json \
    dist \
    dist-runtime \
    assets \
    skills \
    scripts \
    packages \
    extensions \
    vendor \
    node_modules \
    "$pkgdir/usr/lib/$pkgname/"

  cp -a \
    docs/reference/templates \
    "$pkgdir/usr/lib/$pkgname/docs/reference/"

  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cat > "$pkgdir/usr/bin/openclaw" <<'EOF'
#!/bin/sh
exec node /usr/lib/openclaw/openclaw.mjs "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/openclaw"
}
