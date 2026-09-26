# Maintainer: Anas Khalifa <anasgets111@gmail.com>

# Regenerate .SRCINFO on any edit: makepkg --printsrcinfo > .SRCINFO
pkgname=mantle-git
pkgver=r1006.g5fc07590
pkgrel=1
pkgdesc='A Wayland shell engine that runs shells written in Lua'
arch=('x86_64')
url='https://github.com/anasgets111/mantle'
license=('MIT')
depends=('fontconfig' 'gcc-libs' 'glibc' 'libglvnd' 'libpipewire' 'libxkbcommon' 'mesa'
         'pacman' 'pam' 'polkit' 'systemd-libs' 'wayland')
# clang: pipewire bindgen
makedepends=('cargo' 'clang' 'git')
# ttf-dejavu: font files for text-shaping tests in clean chroots
checkdepends=('ttf-dejavu')
optdepends=('niri: workspaces, windows and keyboard layout'
            'hyprland: workspaces, windows and keyboard layout'
            'paru: AUR package updates'
            'yay: AUR package updates'
            'sound-theme-freedesktop: notification sounds'
            'lua-language-server: type-checking the config in an editor')
provides=("mantle=$pkgver")
conflicts=('mantle')
backup=('etc/pam.d/mantle')
# !debug: release profile strips binaries. !lto: makepkg GCC LTO breaks mlua vendored Lua build.
options=('!debug' '!lto')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local described
    if described=$(git describe --long --tags 2>/dev/null); then
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<<"$described"
    else
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release --workspace
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo test --frozen --release --workspace
}

# Renderer sits in /usr/lib/mantle off PATH; /usr/bin/mantle symlinks to it so the supervisor locates
# its sibling and /usr/share/mantle/lua-meta stubs.
package() {
    cd "$pkgname"
    install -Dm755 target/release/mantle          "$pkgdir/usr/lib/mantle/mantle"
    install -Dm755 target/release/mantle-renderer "$pkgdir/usr/lib/mantle/mantle-renderer"
    install -dm755                                "$pkgdir/usr/bin"
    ln -sfn ../lib/mantle/mantle                  "$pkgdir/usr/bin/mantle"
    install -Dm644 -t "$pkgdir/usr/share/mantle/lua-meta" lua-meta/*.lua
    install -Dm644 packaging/polkit-1/rules.d/50-mantle-pacman.rules "$pkgdir/usr/share/polkit-1/rules.d/50-mantle-pacman.rules"
    install -Dm644 packaging/pam.d/mantle "$pkgdir/etc/pam.d/mantle"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
