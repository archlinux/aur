# Maintainer: Yubo Cao <cao2006721@gmail.com>
# Contributor: lampese

pkgname=codex-switcher-git
_pkgname=codex-switcher
pkgver=0.2.24.r0.g1faa3ea
pkgrel=1
pkgdesc='A multi-account manager for OpenAI Codex CLI'
arch=('x86_64')
url='https://github.com/Lampese/codex-switcher'
license=('MIT')
makedepends=('git' 'rust' 'cargo' 'nodejs' 'pnpm' 'webkit2gtk-4.1' 'gtk3'
             'libsoup3' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
# makepkg's `lto` option builds ring's C code with GCC -flto, which rust-lld
# cannot read: every ring_core_* symbol then comes out undefined at link time.
options=('!lto')
source=("git+https://github.com/Lampese/codex-switcher.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    export PNPM_HOME="$srcdir/.pnpm-store"
    pnpm install --frozen-lockfile

    # Arch moved to OpenSSL 4.x; upstream's lockfile pins openssl-sys 0.9.112,
    # whose build script rejects anything past 3.x. 0.9.118 / 0.10.82 are the
    # first releases that build against OpenSSL 4.1. Only raise them if the
    # lockfile is older, so a fixed upstream lock is left alone.
    cd src-tauri
    local crate min locked
    for crate in openssl-sys=0.9.118 openssl=0.10.82; do
        min=${crate#*=} crate=${crate%%=*}
        locked=$(sed -n "/^name = \"$crate\"\$/{n;s/^version = \"\(.*\)\"/\1/p;q}" Cargo.lock)
        if [[ -n $locked ]] && (( $(vercmp "$locked" "$min") < 0 )); then
            cargo update -p "$crate" --precise "$min"
        fi
    done
}

build() {
    cd "$_pkgname"
    export PNPM_HOME="$srcdir/.pnpm-store"

    # Build frontend
    pnpm build

    # Build Tauri app (release mode, skip bundling — we install manually)
    cd src-tauri
    cargo build --release
}

package() {
    cd "$_pkgname"

    # Install binaries
    install -Dm755 src-tauri/target/release/codex-switcher "$pkgdir/usr/bin/codex-switcher"
    install -Dm755 src-tauri/target/release/codex-web "$pkgdir/usr/bin/codex-web"

    # Install icons
    install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/codex-switcher.png"
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/codex-switcher.png"
    install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/codex-switcher.png"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/codex-switcher.desktop" <<EOF
[Desktop Entry]
Categories=Utility;
Comment=A multi-account manager for Codex CLI
Exec=codex-switcher
StartupWMClass=codex-switcher
Icon=codex-switcher
Name=Codex Switcher
Terminal=false
Type=Application
EOF

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
