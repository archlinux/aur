# Maintainer: Anas Khalifa <anasgets111@gmail.com>

# `.SRCINFO` beside this file is generated, and the AUR rejects a push whose .SRCINFO disagrees
# with the PKGBUILD: run `makepkg --printsrcinfo > .SRCINFO` in the same commit as any edit here.
pkgname=mantle-git
pkgver=r679.ge338801
pkgrel=1
pkgdesc='A Wayland shell engine that runs shells written in Lua'
arch=('x86_64')
url='https://github.com/anasgets111/mantle'
license=('MIT')
# One entry per NEEDED line in the two binaries, plus the three programs they spawn: fc-match and
# fc-list (`renderer/src/text/fonts.rs`), pkexec (the updates install command).
#
# `pacman` covers libalpm.so.16 and the upgrade command both. It is a soname dependency with no
# soname in it, so a pacman that bumps libalpm needs this rebuilt and nothing here says so. Add
# `libalpm.so=16-64` when that ABI is worth pinning.
depends=('fontconfig' 'gcc-libs' 'glibc' 'libglvnd' 'libpipewire' 'libxkbcommon' 'pacman'
         'pam' 'polkit' 'systemd-libs' 'wayland')
# clang: pipewire-sys and libspa-sys run bindgen.
makedepends=('cargo' 'clang' 'git')
# A clean chroot has fontconfig but no font *files*, and 98 renderer tests shape real text through
# it. `DEFAULT_CHAIN` opens with the generic "sans-serif", so any installed family satisfies them;
# dejavu is the smallest that also carries bold, italic and an RTL script.
checkdepends=('ttf-dejavu')
# Not a hard dependency: `run_sound_player` logs the decode failure and carries on, so a missing
# theme costs notification sounds and nothing else.
optdepends=('niri: workspaces and keyboard layout'
            'hyprland: workspaces and keyboard layout'
            'sound-theme-freedesktop: notification sounds'
            'lua-language-server: type-checking the config in an editor')
provides=("mantle=$pkgver")
conflicts=('mantle')
backup=('etc/pam.d/mantle')
# `[profile.release]` sets `strip = true`, so the default `debug` option would split a debug package
# out of binaries that carry nothing.
#
# `!lto` is not a preference: makepkg's `lto` puts `-flto=auto` in CFLAGS, mlua's `vendored` feature
# compiles Lua through the `cc` crate with it, and the archive then holds GCC LTO bitcode with empty
# `.text`. rustc links it without GCC's plugin, so every `lua_*` comes back undefined. Nothing is
# given up: `[profile.release]` already sets `lto = true`, which is the LTO that matters here.
options=('!debug' '!lto')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# No tags yet, and Cargo.toml's 0.1.0 is a placeholder its own comment says not to bump, so the
# commit count is the only number that moves. `git describe` takes over from the first tag. if/else
# rather than `describe | sed || printf`: a pipeline exits with sed's status, so that `||` is dead
# and pkgver comes back empty.
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

# RUSTUP_TOOLCHAIN because a maintainer running makepkg outside a chroot has rustup, whose default
# toolchain is whatever they last set. A clean chroot has the `rust` package and ignores this.
build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release --workspace
}

# The only place `overflow-checks` is tested: `just check` runs dev, where it is off, and Cargo.toml
# turns it on for release precisely because a wrapped i32 reaching an allocator is the failure worth
# catching. Costs a second full compile; `makepkg --nocheck` skips it.
check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo test --frozen --release --workspace
}

# The Renderer sits in lib/mantle, off $PATH, and bin/mantle is a symlink into it: `current_exe`
# reads symlink-resolved /proc/self/exe, so the Supervisor still finds its sibling. One command on
# $PATH, and the pair cannot drift apart.
#
# That layout is load-bearing, not taste: `supervisor/src/setup.rs` derives the stub directory from
# the binary's own path, and `lib/mantle/mantle` is what makes it resolve `share/mantle/lua-meta`.
# `mantle init` writes a .luarc.json pointing lua-language-server at those files, so they must be on
# disk. The starter shell.lua is not -- it is `include_str!`'d into the Supervisor and written into
# the user's config dir, so a copy under share/ would be read by nothing.
package() {
    cd "$pkgname"
    install -Dm755 target/release/mantle          "$pkgdir/usr/lib/mantle/mantle"
    install -Dm755 target/release/mantle-renderer "$pkgdir/usr/lib/mantle/mantle-renderer"
    install -dm755                                "$pkgdir/usr/bin"
    ln -sfn ../lib/mantle/mantle                  "$pkgdir/usr/bin/mantle"
    install -Dm644 -t "$pkgdir/usr/share/mantle/lua-meta" lua-meta/*.lua
    install -Dm644 packaging/pam.d/mantle "$pkgdir/etc/pam.d/mantle"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
