# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
pkgver=4.22.2.r521.g22606f35
pkgrel=7
pkgdesc="Agentic IM Chatbot infrastructure (multi-instance, astrbotctl only)"
arch=('any')
url="https://github.com/AstrBotDevs/AstrBot"
license=('AGPL-3.0-only')

depends=('python>=3.12' 'uv' 'git' 'certbot')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "astrbotctl"
    "astrbotctl.functions"
    "astrbot@.service"
    "astrbot-update.timer"
    "astrbot-update.service"
    "update.conf.example"
    "tmpl.conf"
    "setup.sh"
)

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

install=astrbot-git.install

pkgver() {
    # Use git ls-remote to get latest dev commit hash (git protocol, no API rate limit)
    local _hash
    _hash=$(git ls-remote --heads https://github.com/AstrBotDevs/AstrBot.git dev 2>/dev/null | cut -f1)
    if [ -n "$_hash" ]; then
        echo "4.22.2.r0.g${_hash:0:8}"
        return
    fi
    echo "4.22.2"
}

package() {
    # /opt/astrbot is managed by install script — only install LICENSE here
    if [ -f /opt/astrbot/LICENSE ]; then
        install -Dm644 /opt/astrbot/LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    else
        install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    install -Dm644 "$srcdir/tmpl.conf"       "$pkgdir/etc/astrbot/tmpl.conf"
    install -Dm644 "$srcdir/update.conf.example" \
                                              "$pkgdir/usr/share/doc/$pkgname/update.conf.example"
    install -Dm755 "$srcdir/astrbotctl"       "$pkgdir/usr/bin/astrbotctl"
    install -Dm644 "$srcdir/astrbotctl.functions" \
                                              "$pkgdir/usr/bin/astrbotctl.functions"
    install -Dm644 "$srcdir/astrbot@.service" \
                                              "$pkgdir/usr/lib/systemd/system/astrbot@.service"
    install -Dm644 "$srcdir/astrbot-update.timer" \
                                              "$pkgdir/usr/lib/systemd/system/astrbot-update.timer"
    install -Dm644 "$srcdir/astrbot-update.service" \
                                              "$pkgdir/usr/lib/systemd/system/astrbot-update.service"
    install -Dm755 "$srcdir/setup.sh"         "$pkgdir/usr/bin/astrbot-setup"
}
