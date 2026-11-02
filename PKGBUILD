# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry
pkgver=2.8.1
pkgrel=2
pkgdesc='Wayland application launcher with a daemon and built-in providers'
arch=('x86_64')
url='https://somegit.dev/Owlibou/owlry'
# Changelog: https://somegit.dev/Owlibou/owlry/src/tag/owlry-v2.8.1/CHANGELOG.md
# Upgrade guide: https://somegit.dev/Owlibou/owlry/src/tag/owlry-v2.8.1/docs/upgrading.md
# Release notes: https://somegit.dev/Owlibou/owlry/releases/tag/owlry-v2.8.1
license=('GPL-3.0-or-later')
depends=('bash' 'coreutils' 'glibc' 'glib2' 'gtk4' 'gtk4-layer-shell'
         'libgcc' 'openssl' 'pango' 'systemd' 'util-linux' 'which' 'xdg-utils')
makedepends=('cargo')
optdepends=(
    'cliphist: clipboard history provider'
    'wl-clipboard: clipboard write and emoji copy'
    'rofimoji: emoji, kaomoji, and Unicode character picker'
    'xdotool: X11 rofimoji typer'
    'wtype: Wayland rofimoji typer'
    'ydotool: fallback Wayland rofimoji typer'
    'wl-ime-type: Wayland IME rofimoji typer'
    'fd: filesystem search provider (primary backend)'
    'plocate: filesystem search provider (fallback backend)'
    'openssh: SSH provider'
    'uwsm: launch applications through Universal Wayland Session Manager'
)
install=owlry.install
_commit=00384721e8375c5d230bb917a5f0b6adb46689d6
source=(
    "$pkgname-$pkgver-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
    'owlry-user-migrate-run.sh'
    'owlry-user-migrate.sh'
    'owlry-user-migrate.hook'
    'owlry-user-migrate.service'
)
b2sums=(
    'e1319ec50d1e01242ddc76e7c3bb0bd05f281f8e70e919e180e23e4549e00924f2976649150a57b305ca3f8cacbf061a638d3caecffddcc8f82c72863a00a7b7'
    'c578b5e62b9e4e361b8b46ad56b75af4abf711a3cc5d29a223f99baaf97a0f730db85dc15132d4b84846155914b11dc19560d5b89937eb2831ce927a5f2674a1'
    'b3b31c5ef7f02659e4d7fb5a3f0da4210af3eed2b4f4c8a60a83634d3dec7f56d22a5967bbdef79a07e6e567820266d0ec7df8013b5de60ffd4ce64e4d2e5655'
    '020f2e3171bc51ae8547c143c1207da4f6708665ec40960d4ab8fbaea3ff237296895f63f7422e3984c17466d5ee6b048c492218f1bd40c87c81b602cf218465'
    'b43c4ad151bf2ecd6a4255813bc4046c3d69e5115748da2389d5f24ae926d28353744a064fa6ad204f61dda78df3b79662dba10e540a008ff00885b2fc893f9c'
)

prepare() {
    cd "$srcdir/$pkgname" || return
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname" || return
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Use BFD for vendored Lua linking.
    export RUSTFLAGS='-C link-arg=-fuse-ld=bfd'
    cargo build --frozen --release --features full
}

check() {
    cd "$srcdir/$pkgname" || return
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS='-C link-arg=-fuse-ld=bfd'
    cargo test --frozen --release --features full
}

package() {
    cd "$srcdir/$pkgname" || return
    local docdir="$pkgdir/usr/share/doc/$pkgname"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 systemd/owlry.{service,socket} -t "$pkgdir/usr/lib/systemd/user"
    install -Dm755 "$srcdir/owlry-user-migrate-run.sh" \
        "$pkgdir/usr/share/libalpm/hooks/owlry-user-migrate-run.sh"
    install -Dm644 "$srcdir/owlry-user-migrate.hook" \
        "$pkgdir/usr/share/libalpm/hooks/owlry-user-migrate.hook"
    install -Dm755 "$srcdir/owlry-user-migrate.sh" "$pkgdir/usr/lib/owlry/user-migrate.sh"
    install -Dm644 "$srcdir/owlry-user-migrate.service" \
        "$pkgdir/usr/lib/systemd/user/owlry-user-migrate.service"

    install -Dm644 README.md CHANGELOG.md -t "$docdir"
    install -Dm644 docs/upgrading.md "$docdir/docs/upgrading.md"
    install -Dm644 "docs/releases/$pkgver.md" "$docdir/docs/releases/$pkgver.md"
    install -Dm644 data/{owlry.example.lua,config.example.toml,style.example.css} -t "$docdir"
    install -Dm644 data/owlry.1 "$pkgdir/usr/share/man/man1/owlry.1"
    install -Dm644 data/themes/*.css -t "$pkgdir/usr/share/$pkgname/themes"
}
