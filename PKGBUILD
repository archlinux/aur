# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=magpie-git
pkgver=0.1.1463.r0.g2a3d9f5a
pkgrel=1
pkgdesc="One place to pick every AI coding agent's model: Codex, Claude Code, Gemini CLI and more"
arch=('x86_64' 'aarch64')
url="https://github.com/yetone/magpie"
license=('MIT')
depends=('glib2' 'gtk3' 'gdk-pixbuf2' 'hicolor-icon-theme' 'libsoup3' 'libx11' 'webkit2gtk-4.1')
makedepends=('git' 'go')
provides=('magpie')
conflicts=('magpie' 'magpie-bin')
source=('git+https://github.com/yetone/magpie.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/magpie"
    local _ver
    _ver=$(git describe --long --tags --match 'v[0-9]*' --always)
    printf '%s\n' "$_ver" | sed -E 's/^v//; s/([^-]+)-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/; s/[^[:alnum:].+_]/./g'
}

build() {
    cd "$srcdir/magpie"
    local _version
    _version=$(git describe --tags --always --match 'v[0-9]*')
    go build \
        -tags 'production gtk3' \
        -trimpath \
        -ldflags="-s -w -X main.version=${_version}" \
        -o magpie .
}

check() {
    cd "$srcdir/magpie"
    ./magpie version >/dev/null
}

package() {
    cd "$srcdir/magpie"

    install -Dm755 magpie "$pkgdir/usr/bin/magpie"
    install -Dm644 internal/gui/icon-256.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/magpie.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/magpie.desktop" <<'EOF_DESKTOP'
[Desktop Entry]
Type=Application
Name=magpie
Comment=Every agent's model. One place.
Exec=/usr/bin/magpie app
Icon=magpie
Categories=Development;Utility;
Terminal=false
EOF_DESKTOP
}
