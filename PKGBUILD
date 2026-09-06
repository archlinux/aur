# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-desktop
_pkgname=reasonix-desktop
pkgver=1.38.0
pkgrel=1
pkgdesc="Reasonix desktop — a Wails shell around the DeepSeek-native AI coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
# Direct DT_NEEDED set of the built binary; the rest arrives transitively.
# 'reasonix' is the CLI kernel this app shells around — required at runtime.
# Upstream installs it beside the desktop binary, but /usr/bin/reasonix is
# owned by deepseek-reasonix-tui{,-bin}, so depend on the virtual name they
# both provide rather than shipping a conflicting copy.
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libsoup3'
         'reasonix' 'webkit2gtk-4.1')
makedepends=('go' 'pnpm' 'wails')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Both Go binaries are deliberately stripped with -s -w, so makepkg cannot
# produce a useful split debug package.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('f594994b2263bf5fcdb76e53178b3fe9802aeb378905bdbb8205778b1f96b368')

prepare() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver"

    # Upstream pins engines.pnpm ">=10 <11" in the frontend manifest, and pnpm
    # enforces its own engines range unconditionally (engine-strict=false does
    # not disable it), so the `pnpm install` wails runs aborts against Arch's
    # pnpm 11. Drop the pin — the lockfile is lockfileVersion 9, which pnpm 11
    # reads natively. engines.node (">=24") is left in place and satisfied.
    node -e '
      const fs = require("fs");
      const f = "desktop/frontend/package.json";
      const p = JSON.parse(fs.readFileSync(f, "utf8"));
      delete p.engines.pnpm;
      fs.writeFileSync(f, JSON.stringify(p, null, 2) + "\n");
    '
}

build() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver/desktop"
    wails build -clean -trimpath -tags webkit2_41 \
        -ldflags "-s -w -X main.version=v$pkgver"

    # build/linux/reasonix.desktop runs Exec=reasonix-launcher, so the launcher
    # has to be built too — packaging only reasonix-desktop left the installed
    # desktop entry pointing at a command that did not exist. It resolves the
    # app through a versioned current.json layout and is what upstream's own
    # .deb ships next to the app binary.
    cd ..
    go build -trimpath -ldflags "-s -w" -o reasonix-launcher ./cmd/reasonix-launcher
}

package() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver"
    install -Dm755 "desktop/build/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm755 reasonix-launcher "$pkgdir/usr/bin/reasonix-launcher"

    # reasonix-guard is deliberately never installed: as a sibling of the
    # launcher it triggers a legacy migration path that always fails
    # ("migrate: flat CLI binary reasonix-cli is required" — nothing builds or
    # ships a reasonix-cli). Upstream's .deb omits it for the same reason.

    # Installed as Reasonix.desktop, not upstream's reasonix.desktop: the
    # window's Wayland app_id is "Reasonix", and a compositor resolves a
    # window's icon by loading <app_id>.desktop and reading its Icon= key.
    # Under the lowercase name that lookup misses, so KWin falls back to
    # QIcon::fromTheme("wayland") and the task switcher shows the generic
    # Wayland icon (the panel's task manager still looked right, because it
    # additionally matches on StartupWMClass). Verified on Plasma 6/Wayland.
    install -Dm644 desktop/build/linux/reasonix.desktop \
        "$pkgdir/usr/share/applications/Reasonix.desktop"

    # Upstream sets StartupWMClass=reasonix-desktop, which matches neither the
    # app_id nor anything else the window reports; correct it to Reasonix so
    # the StartupWMClass-based matchers agree with the filename above.
    sed -i 's/^StartupWMClass=.*/StartupWMClass=Reasonix/' \
        "$pkgdir/usr/share/applications/Reasonix.desktop"
    grep -q '^StartupWMClass=Reasonix$' \
        "$pkgdir/usr/share/applications/Reasonix.desktop" || {
        printf 'ERROR: failed to rewrite StartupWMClass in Reasonix.desktop\n' >&2
        return 1
    }

    # The tree carries pre-rendered hicolor icons (16x16 .. 512x512, plus a
    # scalable SVG); the lone appicon.png pixmap it used to install left icon
    # themes with nothing to pick up.
    local _icon _dir
    for _icon in desktop/build/linux/icons/hicolor/*/apps/reasonix-desktop.*; do
        _dir="$(basename "$(dirname "$(dirname "$_icon")")")"
        install -Dm644 "$_icon" \
            "$pkgdir/usr/share/icons/hicolor/$_dir/apps/$(basename "$_icon")"
    done

    install -Dm644 desktop/build/appicon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
