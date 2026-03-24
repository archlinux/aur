# Maintainer: Douglas Soares de Andrade <contato@douglasandrade.com>
pkgname=cmux-gtk
pkgver=0.62.0.alpha.4
pkgrel=1
pkgdesc='Terminal multiplexer for AI coding agents (GTK4/libadwaita)'
arch=('x86_64')
url='https://github.com/douglas/cmux-gtk'
license=('AGPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'glib2' 'opengl-driver')
makedepends=('rust' 'cargo' 'zig' 'ncurses' 'gcc' 'patchelf' 'git')
provides=('cmux')
conflicts=('cmux' 'cmux-git')
# AUR pkgver uses dots; _tagver holds the original tag version with hyphens
_tagver="${pkgver//.alpha/-alpha}"
_ghostty_commit=332b2aefc6e72d363aa93ab6ecfc86eeeeb5ed28
source=("$pkgname-$_tagver.tar.gz::$url/archive/v$_tagver.tar.gz")
sha256sums=('139306d106e818a58088760cdcca12bc4d1209da814cef9542e8568983a26178')

prepare() {
    cd "$pkgname-$_tagver"
    # GitHub tarballs don't include submodules. Clone ghostty at the pinned
    # commit, then strip .git so zig build uses dev version detection instead
    # of panicking on mismatched git tags.
    if [[ ! -d "$srcdir/ghostty-src" ]]; then
        git clone --filter=blob:none https://github.com/douglas/ghostty.git "$srcdir/ghostty-src"
        git -C "$srcdir/ghostty-src" checkout "$_ghostty_commit"
    fi
    rm -rf ghostty
    cp -a "$srcdir/ghostty-src" ghostty
    rm -rf ghostty/.git
}

build() {
    cd "$pkgname-$_tagver"
    cargo build --release --features cmux/link-ghostty
}

check() {
    cd "$pkgname-$_tagver"
    cargo test --workspace
}

package() {
    cd "$pkgname-$_tagver"

    # Binaries (strip $ORIGIN rpath so linker uses /usr/lib)
    install -Dm755 target/release/cmux-app "$pkgdir/usr/bin/cmux-app"
    patchelf --remove-rpath "$pkgdir/usr/bin/cmux-app"
    install -Dm755 target/release/cmux "$pkgdir/usr/bin/cmux"

    # Shared library
    install -Dm755 target/release/libghostty.so "$pkgdir/usr/lib/libghostty.so"

    # GLAD shared library — ghostty excludes GLAD from libghostty,
    # expecting the host app to provide it.
    local _glad_a
    _glad_a=$(echo target/release/build/ghostty-sys-*/out/libglad.a)
    gcc -shared -o "$pkgdir/usr/lib/libglad.so" \
        -Wl,--whole-archive "$_glad_a" -Wl,--no-whole-archive
    patchelf --add-needed libglad.so "$pkgdir/usr/lib/libghostty.so"

    # Desktop entry
    install -Dm644 data/io.github.douglas.cmux_gtk.desktop \
        "$pkgdir/usr/share/applications/io.github.douglas.cmux_gtk.desktop"

    # AppStream metadata
    install -Dm644 data/io.github.douglas.cmux_gtk.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.douglas.cmux_gtk.metainfo.xml"

    # Shell integration
    install -Dm644 cmux/shell-integration/cmux-zsh-integration.zsh \
        "$pkgdir/usr/share/cmux/shell-integration/cmux-zsh-integration.zsh"
}
