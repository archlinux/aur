# Maintainer: Jonathan Freed <jon at freed dot dev>
pkgname=niri-screensaver-git
_pkgname=niri-screensaver
pkgver=0.7.0.r0.g61a43e5
pkgrel=1
pkgdesc="TerminalTextEffects-based screensaver for the niri Wayland compositor (git)"
arch=('any')
url="https://github.com/jfreed-dev/niri-screensaver"
license=('GPL-3.0-only')
depends=(
    'alacritty'
    'niri'
    'python-terminaltexteffects'
    'jq'
)
optdepends=(
    'noctalia-shell: idle/lock integration via included plugin'
    'playerctl: now-playing overlay'
    'wlrctl: cursor parking under niri'
    'ydotool: cursor-parking fallback if wlrctl is absent'
    'figlet: large ASCII rendering for clock and overlays'
)
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
    cd "$_pkgname"
    # Latest tag with commit count + short hash. Falls back to 0.0.0.r<count>.g<hash>
    # if no tag is reachable from HEAD.
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$_pkgname"

    install -Dm 0755 bin/niri-screensaver         "$pkgdir/usr/bin/niri-screensaver"
    install -Dm 0755 bin/niri-screensaver-launch  "$pkgdir/usr/bin/niri-screensaver-launch"
    install -Dm 0755 bin/niri-screensaver-ctl     "$pkgdir/usr/bin/niri-screensaver-ctl"

    install -Dm 0644 share/alacritty-screensaver.toml \
        "$pkgdir/usr/share/niri-screensaver/alacritty-screensaver.toml"
    install -d "$pkgdir/usr/share/niri-screensaver/logos"
    install -m 0644 share/logos/*.txt \
        "$pkgdir/usr/share/niri-screensaver/logos/"
    install -m 0644 share/logos/LICENSES.md \
        "$pkgdir/usr/share/niri-screensaver/logos/LICENSES.md"

    install -Dm 0644 share/icons/hicolor/scalable/apps/niri-screensaver.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/niri-screensaver.svg"
    install -Dm 0644 share/applications/niri-screensaver.desktop \
        "$pkgdir/usr/share/applications/niri-screensaver.desktop"

    install -Dm 0644 docs/niri-window-rule.kdl \
        "$pkgdir/usr/share/doc/$_pkgname/niri-window-rule.kdl"
    install -Dm 0644 docs/noctalia-customCommand.json \
        "$pkgdir/usr/share/doc/$_pkgname/noctalia-customCommand.json"
    install -Dm 0644 README.md \
        "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm 0644 CHANGELOG.md \
        "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"

    install -d "$pkgdir/usr/share/niri-screensaver/noctalia-plugin"
    cp -r noctalia-plugin/. "$pkgdir/usr/share/niri-screensaver/noctalia-plugin/"

    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
