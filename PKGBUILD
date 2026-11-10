pkgname=stickies
pkgver=0.10.3
pkgrel=1
pkgdesc='Local sticky notes for Linux Wayland with Layer Shell v4+'
arch=('x86_64')
url='https://github.com/0atxl/stickies'
# Application, embedded fonts and the included Rust dependency notices.
license=('MPL-2.0' 'OFL-1.1' 'MIT' 'Apache-2.0' 'Unicode-3.0'
         'Apache-2.0 WITH LLVM-exception')
depends=('cairo' 'dbus' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'graphene'
         'gtk4>=1:4.10' 'gtk4-layer-shell>=1.0' 'libadwaita>=1:1.7'
         'libgcc' 'pango>=1.56' 'sqlite' 'librsvg')
makedepends=('rust>=1:1.92' 'pkgconf' 'desktop-file-utils')
options=('!debug')
source=("https://github.com/0atxl/stickies/releases/download/v0.10.3/stickies-${pkgver}-src.tar.gz")
sha256sums=('7590abe5071cd04b2339d11e2f70e1b512b6b04c758d055b066d3f5dfa054dab')
_target=x86_64-unknown-linux-gnu

prepare() {
    cd "$srcdir/stickies-$pkgver"
    if [[ ! -s data/dev.stickies.Stickies.png ]]; then
        error 'Approved application icon is missing: data/dev.stickies.Stickies.png'
        return 1
    fi
    desktop-file-validate data/dev.stickies.Stickies.desktop
    # Fetch only the versions/checksums already recorded in Cargo.lock.
    cargo fetch --locked --target "$_target"
}

build() {
    cd "$srcdir/stickies-$pkgver"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --frozen --target "$_target"
}

package() {
    cd "$srcdir/stickies-$pkgver"
    install -Dm755 "$srcdir/target/$_target/release/stickies" "$pkgdir/usr/bin/stickies"
    install -Dm644 data/dev.stickies.Stickies.desktop \
        "$pkgdir/usr/share/applications/dev.stickies.Stickies.desktop"
    install -Dm644 data/dev.stickies.Stickies.png \
        "$pkgdir/usr/share/pixmaps/dev.stickies.Stickies.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/stickies/LICENSE"
    install -Dm644 packaging/THIRD-PARTY-NOTICES.txt \
        "$pkgdir/usr/share/licenses/stickies/THIRD-PARTY-NOTICES.txt"
    install -Dm644 SOURCE-INFO.txt "$pkgdir/usr/share/doc/stickies/SOURCE-INFO.txt"
    install -Dm644 packaging/README.md "$pkgdir/usr/share/doc/stickies/packaging.md"
}
