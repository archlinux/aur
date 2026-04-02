# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
pkgver=4.22.2.r521.g22606f35
pkgrel=2
pkgdesc="Agentic IM Chatbot infrastructure (multi-instance, astrbotctl only)"
arch=('any')
url="https://github.com/AstrBotDevs/AstrBot"
license=('AGPL-3.0-only')

depends=('python>=3.12' 'uv' 'git' 'certbot')
makedepends=('git')

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

prepare() {
    rm -rf "$srcdir/$_pkgname"

    local _retries=3 _count=0
    while ((_count < _retries)); do
        if git clone -b dev --depth=500 \
            "https://github.com/AstrBotDevs/AstrBot.git" "$srcdir/$_pkgname"; then
            break
        fi
        ((_count++))
        if ((_count < _retries)); then
            echo ">>> Clone failed, retrying ($_count/$_retries)..."
            rm -rf "$srcdir/$_pkgname"
        fi
    done

    if [ ! -d "$srcdir/$_pkgname" ]; then
        error "Failed to clone AstrBot after $_retries attempts."
        return 1
    fi
}

pkgver() {
    cd "$srcdir/$_pkgname"
    local _ver
    _ver=$(git describe --long --tags 2>/dev/null) && {
        echo "$_ver" | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
    } || echo "0.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
    # Clone the app source.  We do NOT put it under /opt via pacman — the
    # install script handles /opt/astrbot directly to avoid "conflicting files"
    # errors on upgrade.  Only copy the LICENSE (from the clone) here.
    cd "$srcdir/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/tmpl.conf"       "$pkgdir/etc/astrbot/tmpl.conf"
    install -Dm644 "$srcdir/update.conf.example" \
                                                  "$pkgdir/usr/share/doc/astrbot-git/update.conf.example"
    install -Dm755 "$srcdir/astrbotctl"      "$pkgdir/usr/bin/astrbotctl"
    install -Dm644 "$srcdir/astrbotctl.functions" \
                                                  "$pkgdir/usr/bin/astrbotctl.functions"
    install -Dm644 "$srcdir/astrbot@.service" \
                                                  "$pkgdir/usr/lib/systemd/system/astrbot@.service"
    install -Dm644 "$srcdir/astrbot-update.timer" \
                                                  "$pkgdir/usr/lib/systemd/system/astrbot-update.timer"
    install -Dm644 "$srcdir/astrbot-update.service" \
                                                  "$pkgdir/usr/lib/systemd/system/astrbot-update.service"
    install -Dm755 "$srcdir/setup.sh"  "$pkgdir/usr/bin/astrbot-setup"
}
