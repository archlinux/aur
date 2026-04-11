# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
_srcname=AstrBot
pkgver=4.22.2.r633.g7543dd2e
pkgrel=16

pkgver() {
    cd "$srcdir/$_srcname"
    # Fetch all tags from origin/dev to support describe on all release tags
    git fetch --tags origin dev 2>/dev/null || true
    # Try annotated tags first; fall back to commit-based versioning
    local _ver
    if _ver=$(git describe --long --tags 2>/dev/null); then
        # Normalize git describe output like v4.22.2-66-gaa279f0c4 -> 4.22.2.r66.gaa279f0c4
        printf '%s' "$_ver" | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
    else
        # No tags reachable — use commit count + short hash
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

pkgdesc="Agentic IM Chatbot infrastructure (multi-instance, astrbotctl only)"
arch=('any')
url="https://github.com/AstrBotDevs/AstrBot"
license=('AGPL-3.0-only')

depends=('python>=3.12' 'uv' 'certbot')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "git+https://github.com/AstrBotDevs/AstrBot.git#branch=dev"
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

    # The VCS source extracts to AstrBot/, while the package name stays lowercase.
    # Use dotglob so hidden files are included in the application payload.
    shopt -s dotglob
    cp -a "$srcdir"/"$_srcname"/* "$pkgdir/opt/astrbot/"
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
