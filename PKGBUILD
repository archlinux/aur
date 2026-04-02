# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
pkgver=4.22.2.r521.g22606f35
pkgrel=4
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
    # Read version from the installed /opt/astrbot (managed by this package's install script)
    if [ -d "/opt/astrbot" ] && [ -d "/opt/astrbot/.git" ]; then
        cd /opt/astrbot
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g' && return
    fi
    # Fallback: echo current pkgver
    echo "$pkgver"
}

package() {
    # /opt/astrbot is managed by the install script — do NOT install it here.
    # Only copy the LICENSE from /opt/astrbot if it exists.
    if [ -f /opt/astrbot/LICENSE ]; then
        install -Dm644 /opt/astrbot/LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    else
        # Touch a placeholder license so pacman doesn't warn
        install -Dm644 /dev/null \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
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
