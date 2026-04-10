# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
pkgver=4.22.2.r631.gec363aaa
pkgrel=10

pkgver() {
  cd "$_pkgname"
  # Shallow clones lack tag history; unshallow to get full history for describe
  git fetch --depth=999999 origin dev 2>/dev/null || true
  # Try annotated tags first; fall back to commit-based versioning
  local _ver
  if _ver=$(git describe --long --tags 2>/dev/null); then
    printf '%s' "${_ver#v}"
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
    "git+https://github.com/AstrBotDevs/AstrBot.git#branch=dev&depth=1"
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

    # Git shallow clone extracts to AstrBot (no -dev suffix)
    # We use a glob and cp -a to ensure hidden files like .env aren't missed
    # if they exist, though standard shopt might be needed. Shopt is available in bash.
    shopt -s dotglob
    cp -a "$srcdir"/AstrBot/* "$pkgdir/opt/astrbot/"
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
