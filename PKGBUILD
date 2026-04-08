# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
pkgver=4.22.2.r607.gba7ace4b
pkgrel=1
pkgdesc="Agentic IM Chatbot infrastructure (multi-instance, astrbotctl only)"
arch=('any')
url="https://github.com/AstrBotDevs/AstrBot"
license=('AGPL-3.0-only')

depends=('python>=3.12' 'uv' 'certbot')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/AstrBotDevs/AstrBot/archive/refs/heads/dev.tar.gz"
    "astrbotctl"
    "astrbotctl.functions"
    "astrbot@.service"
    "astrbot-update.timer"
    "astrbot-update.service"
    "update.conf.example"
    "tmpl.conf"
    "setup.sh"
)

sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP')

install=astrbot-git.install

package() {
    install -dm755 "$pkgdir/opt/astrbot"

    # GitHub tarball extracts to AstrBot-dev
    # We use a glob and cp -a to ensure hidden files like .env aren't missed
    # if they exist, though standard shopt might be needed. Shopt is available in bash.
    shopt -s dotglob
    cp -a "$srcdir"/AstrBot-*/* "$pkgdir/opt/astrbot/"
    shopt -u dotglob

    # Store version inside the application directory
    echo "$pkgver" >"$pkgdir/opt/astrbot/.version"

    if [ -f "$pkgdir/opt/astrbot/LICENSE" ]; then
        install -Dm644 "$pkgdir/opt/astrbot/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    else
        install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    install -Dm644 "$srcdir/tmpl.conf" "$pkgdir/etc/astrbot/tmpl.conf"
    install -Dm644 "$srcdir/update.conf.example" \
        "$pkgdir/usr/share/doc/$pkgname/update.conf.example"
    install -Dm755 "$srcdir/astrbotctl" "$pkgdir/usr/bin/astrbotctl"
    install -Dm644 "$srcdir/astrbotctl.functions" \
        "$pkgdir/usr/bin/astrbotctl.functions"
    install -Dm644 "$srcdir/astrbot@.service" \
        "$pkgdir/usr/lib/systemd/system/astrbot@.service"
    install -Dm644 "$srcdir/astrbot-update.timer" \
        "$pkgdir/usr/lib/systemd/system/astrbot-update.timer"
    install -Dm644 "$srcdir/astrbot-update.service" \
        "$pkgdir/usr/lib/systemd/system/astrbot-update.service"
    install -Dm755 "$srcdir/setup.sh" "$pkgdir/usr/bin/astrbot-setup"
}
