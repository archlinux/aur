# Maintainer: Simen Fritsvold <sifra002@gmail.com>

pkgname=mwu-bot-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Multiplicative Weights Update trading bot (Polygon + Alpaca)"
arch=('any')
url="https://github.com/Simenf05/mwu-bot"
license=('0BSD')

depends=(
  'python'
  'python-alpaca-py'
  'python-apscheduler'
  'python-exchange-calendars'
  'python-matplotlib'
  'python-numpy'
  'python-pandas'
  'python-dotenv'
  'python-requests'
  'python-sqlalchemy'
  'python-tenacity'
  'python-yfinance'
)

makedepends=('git')

provides=('mwu-bot')
conflicts=('mwu-bot')

options=('!strip')
install=mwu-bot.install

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --always | sed 's/^v//; s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"

  # Install application files
  install -dm755 "$pkgdir/opt/mwu-bot"
  cp -r bot scripts implementation_plan.md requirements.txt README.md LICENSE "$pkgdir/opt/mwu-bot"

  # Install license (Arch standard location)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # CLI wrapper
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/mwu-bot-scheduler" << 'EOF'
#!/usr/bin/env bash
exec /usr/bin/python3 /opt/mwu-bot/bot/scheduler.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/mwu-bot-scheduler"

  # Systemd service
  install -Dm644 packaging/mwu-bot-aur.service "$pkgdir/usr/lib/systemd/system/mwu-bot.service"
}
