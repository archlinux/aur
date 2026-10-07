# Maintainer: Alessandro Griseta <alegriseta@greennet.email>
pkgname=vonsimulator-git
pkgver=r16.23f1d49
pkgrel=1
pkgdesc='Von Neumann machine interpreter and simulator (PHP web app)'
arch=('any')
url='https://github.com/aguglie/vonsimulator'
license=('MIT')
depends=('php')
makedepends=('git')
provides=('vonsimulator')
conflicts=('vonsimulator')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  sed -i 's/if (! STRICT_SYNTAX)/if (! self::STRICT_SYNTAX)/' \
    application/classes/Interprete.php
  grep -q 'self::STRICT_SYNTAX' application/classes/Interprete.php
}
package() {
  cd "$pkgname"

  # App files (read-only is fine: state lives in a client-side cookie)
  install -d "$pkgdir/usr/share/webapps/vonsimulator"
  cp -r application static index.html server.php \
    "$pkgdir/usr/share/webapps/vonsimulator/"

  # Launcher: PHP built-in server, localhost only, unprivileged port
  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/vonsimulator" <<'EOF'
#!/bin/sh
PORT="${PORT:-8080}"
echo "Von Neumann simulator: http://127.0.0.1:${PORT}/  (Ctrl+C to stop)"
exec php -S "127.0.0.1:${PORT}" -t /usr/share/webapps/vonsimulator
EOF
  chmod 755 "$pkgdir/usr/bin/vonsimulator"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
