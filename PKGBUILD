# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
pkgver=0.0.0.r.g
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
    rm -rf "$srcdir/$_pkgname" "$srcdir/astrbot.tar.gz"

    echo ">>> Downloading AstrBot source tarball..."
    if ! curl -L --fail --silent --show-error \
        "https://github.com/AstrBotDevs/AstrBot/archive/refs/heads/dev.tar.gz" \
        -o "$srcdir/astrbot.tar.gz" 2>&1; then
        echo "!!! Failed to download AstrBot tarball."
        return 1
    fi

    echo ">>> Extracting..."
    mkdir -p "$srcdir/$_pkgname"
    if ! tar -xzf "$srcdir/astrbot.tar.gz" -C "$srcdir/$_pkgname"; then
        echo "!!! Failed to extract tarball."
        rm -f "$srcdir/astrbot.tar.gz"
        return 1
    fi
    rm -f "$srcdir/astrbot.tar.gz"

    # Flatten: move contents of AstrBot-dev/* into $srcdir/$_pkgname/
    local _src="$srcdir/$_pkgname"
    local _sub
    _sub=$(find "$_src" -mindepth 1 -maxdepth 1 -type d | head -1)
    if [ -n "$_sub" ] && [ "$_sub" != "$_src" ]; then
        mv "$_sub"/* "$_src/" 2>/dev/null || true
        rmdir "$_sub" 2>/dev/null || true
    fi

    # Init git repo so git describe works in pkgver
    git -C "$_src" init --quiet
    git -C "$_src" remote add origin "https://github.com/AstrBotDevs/AstrBot.git"
    git -C "$_src" fetch --tags origin --quiet 2>/dev/null || true
    git -C "$_src" checkout dev --quiet 2>/dev/null || true
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
