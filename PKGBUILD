# Maintainer: Xuruh <admin@jorvik.app>

pkgname=jorvik-git
_pkgname=jorvik
pkgver=1.0.8.r2.gd6a31a4
pkgrel=1
pkgdesc="Self-hosted Matrix client built to feel like Discord (git)"
arch=('x86_64')
url="https://github.com/jorvikapp/jorvik"
license=('AGPL-3.0-only')
# Runs on the system Electron rather than bundling its own: the app declares no
# runtime dependencies and its main process imports only electron and node
# builtins, so nothing else needs to ship.
depends=('electron44')
# ttf-dejavu is not optional: the tray badge assets are rendered from SVG text,
# and gen-tray-badges.js exits non-zero when no font resolves, so a clean chroot
# without one fails the build rather than producing blank badges.
makedepends=('git' 'nodejs' 'pnpm' 'ttf-dejavu')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    # electron-builder is never invoked here, so its Electron download would be
    # dead weight. sharp is still fetched: it renders the icon set and the tray
    # badge assets during the build.
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1

    pnpm install --frozen-lockfile
    pnpm --filter @heorot/desktop run build
}

package() {
    cd "$srcdir/$_pkgname/apps/desktop"

    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    cp -r dist web package.json "$pkgdir/usr/lib/$_pkgname/"

    # With a system Electron, process.resourcesPath points at Electron's own
    # resources, so main.ts falls back to app.getAppPath()/build for the window
    # icon and the tray badge set. That fallback is this layout.
    install -Dm644 build/icon.png "$pkgdir/usr/lib/$_pkgname/build/icon.png"
    cp -r build/tray-badges "$pkgdir/usr/lib/$_pkgname/build/"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$_pkgname" <<'LAUNCH'
#!/bin/sh
exec electron44 /usr/lib/jorvik "$@"
LAUNCH
    chmod 755 "$pkgdir/usr/bin/$_pkgname"

    # Generated during the build from the one tracked source image, so these
    # stay correct without assets being copied into this repository.
    local size
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "build/icons/${size}x${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
    done

    # Mirrors linux.desktop.entry in apps/desktop/electron-builder.json; the
    # binary packages get theirs from Electron Builder, which is not used here.
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Jorvik
Comment=Jorvik Desktop Client
Exec=jorvik %U
Icon=jorvik
Terminal=false
Type=Application
Categories=Network;Chat;
StartupWMClass=jorvik
DESKTOP

    install -Dm644 "$srcdir/$_pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
