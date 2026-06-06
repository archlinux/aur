# Maintainer: antlis
pkgname=tg-mpv-bot-git
pkgver=1.1.0.r0.g0000000
pkgrel=1
pkgdesc="Telegram remote control for mpv — browse your library, stream links, control playback from your phone"
arch=(any)
url="https://github.com/antlis/tg-mpv-bot"
license=(MIT)
# python-aiogram lives in the AUR; the rest are official repos.
# yt-dlp updates come from pacman here — /mpv_update_ytdlp only manages
# venv installs and politely refuses on a system install.
depends=(mpv python python-aiogram python-aiohttp yt-dlp)
makedepends=(git)
provides=(tg-mpv-bot)
conflicts=(tg-mpv-bot)
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd tg-mpv-bot
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd tg-mpv-bot
  install -d "$pkgdir/usr/share/tg-mpv-bot"
  cp -r bot.py src assets "$pkgdir/usr/share/tg-mpv-bot/"
  install -Dm644 .env.example "$pkgdir/usr/share/doc/tg-mpv-bot/env.example"
  install -Dm644 README.md "$pkgdir/usr/share/doc/tg-mpv-bot/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/aur/tg-mpv-bot.service \
    "$pkgdir/usr/lib/systemd/user/tg-mpv-bot.service"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tg-mpv-bot" <<'EOF'
#!/bin/sh
# Same config file the systemd unit reads — quote values containing spaces.
[ -f "$HOME/.config/tg-mpv-bot.env" ] && {
  set -a; . "$HOME/.config/tg-mpv-bot.env"; set +a
}
exec python /usr/share/tg-mpv-bot/bot.py "$@"
EOF
}
