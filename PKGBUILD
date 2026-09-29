# Maintainer: antlis <antlis@protonmail.com>
pkgname=tg-media-bot
pkgver=0.4.1
pkgrel=1
pkgdesc="Self-hosted Telegram media downloader bot (yt-dlp + aiogram)"
arch=('any')
url="https://github.com/antlis/tg-media-bot"
license=('MIT')
depends=(
  'python'
  'python-aiogram'
  'python-aiohttp'
  'python-dotenv'
  'python-structlog'
  'yt-dlp'
  'ffmpeg'
)
optdepends=(
  'telegram-bot-api: local Bot API server for uploads up to 2GB'
  'python-playwright: headless-browser fallback for JS-only players'
  'chromium: browser binary for the headless-browser fallback'
)
backup=('etc/tg-media-bot/.env')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f66ed510b9e17027c85d4770acb4f6efbd293745ba0a32835d292bf594d3dcf3')

package() {
  cd "$pkgname-$pkgver"

  # Application code
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r src main.py "$pkgdir/usr/lib/$pkgname/"

  # Launcher on PATH
  install -Dm755 packaging/aur/tg-media-bot.sh "$pkgdir/usr/bin/$pkgname"

  # systemd service
  install -Dm644 packaging/aur/tg-media-bot.service \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # Sample config (edit /etc/tg-media-bot/.env before starting)
  install -Dm640 .env.example "$pkgdir/etc/$pkgname/.env"

  # License + docs
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
