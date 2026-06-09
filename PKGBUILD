# Maintainer: Ahmad Zarir <self@zarir.org>
pkgname=tai
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI chatbot for Groq with web search"
arch=('x86_64' 'aarch64')
url="https://github.com/zarirdev/tai"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5507920dd3b2440be5d78fc9fce8da1a1e18f9a1435b79b23ff80cd715d3a55a')

build() {
  cd "$pkgname-$pkgver"
  go build -ldflags "-s -w" -o tai .
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 tai "$pkgdir/usr/bin/tai"

  # Install system-wide default config (read-only fallback)
  install -Dm644 /dev/null "$pkgdir/etc/tai/config.yaml"
  cat > "$pkgdir/etc/tai/config.yaml" <<EOF
# System-wide tai configuration (overriden by ~/.config/tai/config.yaml)
model: "groq/compound-mini"
max_tokens: 2048
debug: false
include_domains: []
exclude_domains: []
# api_key_encrypted is set per-user via 'tai --api'
EOF

  # Install docs (optional)
  install -Dm644 README.md "$pkgdir/usr/share/doc/tai/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/tai/LICENSE"
}
