# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=thinkrail
pkgver=0.3.1
pkgrel=1
pkgdesc="Lightweight IDE for vibe coding with the pi agent (desktop app and browser-based CLI)"
arch=('x86_64')
url="https://github.com/JetBrains/thinkrail"
license=('Apache-2.0')
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'git' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'icu'
         'libayatana-appindicator' 'librsvg' 'libsoup3' 'libx11' 'webkit2gtk-4.1')
optdepends=('xdg-utils: open the browser when launching the CLI'
            'xorg-xwayland: run the desktop app on Wayland, it only speaks X11'
            'ripgrep: otherwise pi downloads its own copy on first use'
            'fd: otherwise pi downloads its own copy on first use')
makedepends=('bun' 'patch')
conflicts=('thinkrail-bin')
# bun --compile appends the app to the runtime executable; strip would drop it.
# The desktop shell is upstream's prebuilt Electrobun and Bun runtime.
options=('!strip' '!debug')
_commit=344aafcb0b56902e5fc87834059a353d54ca8892
# Keep in sync with apps/desktop/package.json and electrobun.config.ts. Hutch
# fetches these itself; build() fails unless what it used matches these files.
_electrobun=2.0.5
_bun=1.4.4
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'pacman-managed.patch'
        'thinkrail-desktop.sh'
        'thinkrail.desktop')
source_x86_64=("electrobun-core-$_electrobun-x64.tar.gz::https://github.com/blackboardsh/electrobun/releases/download/v$_electrobun/electrobun-core-linux-x64.tar.gz"
               "bun-$_bun-x64.zip::https://github.com/oven-sh/bun/releases/download/bun-v$_bun/bun-linux-x64.zip")
noextract=("electrobun-core-$_electrobun-x64.tar.gz")
sha256sums=('0bd685864897c890f04d187884c5425125af70d86b70d9c2bcf99a7d8d43a8a2'
            '2836733fdb5683f8f1392e6871806aee1696d97444ac8bfe9249f433e6db6527'
            '2ce0adca5eb6d555e04f373cae485b106aefffbe4afa879e2a02021039d24cca'
            '76914be37000accd42d9702442cedd5a3b2a75ecca0dc1e1cc65c2e373577d2a')
sha256sums_x86_64=('29deec8eb7f8a017f786f95816bccccd91f514e57ea14868e4b97bd409268e88'
                   'bf8ccbfb2b0b80159e0f9a6d15c55317add8077534dbc6130a3edb52fccb395c')

prepare() {
    mkdir -p electrobun-core
    bsdtar -xf "electrobun-core-$_electrobun-x64.tar.gz" -C electrobun-core

    cd "$pkgname-$pkgver"
    local _upstream
    _upstream="$(bun -p "require('./apps/desktop/package.json').devDependencies.electrobun")"
    if [[ "$_upstream" != "$_electrobun" ]]; then
        error "upstream pins electrobun $_upstream, PKGBUILD has $_electrobun"
        return 1
    fi
    if ! grep -q "version: \"$_bun\"" apps/desktop/electrobun.config.ts; then
        error "upstream's desktop Bun runtime is no longer $_bun"
        return 1
    fi
    # Pacman owns the installed files: drop the CLI's `update` and `uninstall`,
    # and the desktop updater's base URL, which turns the updater off.
    patch -Np1 -i "$srcdir/pacman-managed.patch"
    # Upstream's release CI overwrites this module. The "dev" channel keeps the
    # CLI's update notice off, and the empty analytics key never reports usage.
    cat > packages/shared/src/version.ts <<STAMP
export const version = "$pkgver";
export const channel = "dev";
export const commit = "${_commit:0:9}";
export const posthogProjectKey = "";
STAMP
    export BUN_INSTALL_CACHE_DIR="$srcdir/.bun-cache"
    HUSKY=0 bun install --frozen-lockfile
}

build() {
    cd "$pkgname-$pkgver"
    export BUN_INSTALL_CACHE_DIR="$srcdir/.bun-cache"
    export TURBO_TELEMETRY_DISABLED=1 DO_NOT_TRACK=1
    bun run build:web
    bun apps/cli/scripts/build-binary.ts

    # Keep Hutch's toolchain cache out of $HOME.
    HOME="$srcdir/.home" XDG_CACHE_HOME="$srcdir/.home/.cache" HUTCH_HOME="$srcdir/.hutch" \
        bun run --cwd apps/desktop package:stable

    # The stable build is a self-extractor that unpacks into $HOME on first
    # run; only its inner tree belongs in /usr/lib.
    rm -rf "$srcdir/desktop"
    mkdir "$srcdir/desktop"
    bsdtar -xf apps/desktop/build/stable-linux-x64/ThinkRail/Resources/*.tar.zst -C "$srcdir/desktop"

    local _bin="$srcdir/desktop/ThinkRail/bin" _f
    for _f in launcher libElectrobunCore.so libNativeWrapper.so libasar.so; do
        cmp "$_bin/$_f" "$srcdir/electrobun-core/$_f"
    done
    cmp "$_bin/bun" "$srcdir/bun-linux-x64/bun"
}

check() {
    cd "$pkgname-$pkgver/apps/cli"
    HOME="$srcdir/check-home" bun test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 apps/cli/dist/thinkrail "$pkgdir/usr/bin/thinkrail"
    install -Dm755 "$srcdir/thinkrail-desktop.sh" "$pkgdir/usr/bin/thinkrail-desktop"

    local _app="$srcdir/desktop/ThinkRail"
    # Only the self-updater and uninstaller use these.
    rm -f "$_app/Resources/uninstall" "$_app/bin/bspatch" "$_app/bin/zig-zstd"
    install -d "$pkgdir/usr/lib/thinkrail"
    cp -r --no-preserve=ownership "$_app/bin" "$_app/Resources" "$pkgdir/usr/lib/thinkrail/"

    install -Dm644 "$srcdir/thinkrail.desktop" "$pkgdir/usr/share/applications/thinkrail.desktop"
    install -Dm644 packages/shared/assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/thinkrail.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
