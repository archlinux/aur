# Maintainer: Simen Fritsvold <sifra002@gmail.com>

pkgname=mwu-bot-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Multiplicative Weights Update trading bot (Polygon + Alpaca)"
arch=('any')
url="https://github.com/Simenf05/mwu-bot"
license=('0BSD')
depends=('python')
makedepends=('git')
options=('!strip')
backup=('opt/mwu-bot/.env')
install=mwu-bot.install

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/mwu-bot
  git describe --tags --always | sed 's/^v//; s/-/./g'
}

package() {
  cd "$srcdir"/mwu-bot

  install -dm755 "$pkgdir/opt/mwu-bot"
  cp -r bot scripts implementation_plan.md requirements.txt README.md LICENSE "$pkgdir/opt/mwu-bot"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/mwu-bot-scheduler" << 'EOF'
#!/usr/bin/env bash
exec /opt/mwu-bot/.venv/bin/python /opt/mwu-bot/bot/scheduler.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/mwu-bot-scheduler"

  install -Dm644 packaging/mwu-bot.service "$pkgdir/usr/lib/systemd/system/mwu-bot.service"
}
