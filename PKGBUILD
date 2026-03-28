# Maintainer: Douglas Soares de Andrade <contato@douglasandrade.com>
pkgname=cmux-gtk
pkgver=0.62.0.alpha.11
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
_ghostty_commit=c5028f99876a35188329f65742fddb45de3c5360
source=("$pkgname-$_tagver.tar.gz::$url/archive/v$_tagver.tar.gz")
sha256sums=('d562c0397ab647c3b8960a6127f461f1259c70d85ef785a9be780684d2d68c62')

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

    # GLAD shared library — built directly by ghostty-sys build script
    install -Dm755 target/release/libglad.so "$pkgdir/usr/lib/libglad.so"
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
