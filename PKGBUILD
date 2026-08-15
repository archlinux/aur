# Maintainer: XiHanQWQ

pkgname=motrix-next-git
pkgver=3.9.7_0_gdc12e7d9
pkgrel=1
pkgdesc="A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/AnInsomniacy/motrix-next"
license=('MIT')
provides=('motrix-next')
conflicts=('motrix-next' 'motrix-next-bin')
depends=(
    cairo
    gdk-pixbuf2
    gtk3
    hicolor-icon-theme
    libappindicator
    libsoup3
    webkit2gtk-4.1
)
makedepends=(
    cargo
    nodejs
    pnpm
    openssl
    appmenu-gtk-module
    git
)
options=(!lto)
source=("$pkgname::git+https://github.com/AnInsomniacy/motrix-next.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/_/g'
}

prepare() {
    cd "$srcdir/$pkgname"
    sed -i '/"createUpdaterArtifacts":/s/true/false/' src-tauri/tauri.conf.json
    pnpm install --frozen-lockfile
}

build() {
    cd "$srcdir/$pkgname"
    export CARGO_HOME="${srcdir}/cargo-home"
    export CC=gcc
    export AR=ar
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
    rm -rf src-tauri/target/release/build/ring-*
    pnpm tauri build --bundles deb
}

package() {
    cd "$srcdir/$pkgname"
    local tmpdir="${srcdir}/deb-extract"
    mkdir -p "$tmpdir"
    ar x src-tauri/target/release/bundle/deb/*.deb --output="$tmpdir"
    tar -xf "$tmpdir/data.tar.gz" -C "$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    sed -i '/^Categories=/c\Categories=Network;FileTransfer;' \
        "$pkgdir/usr/share/applications/MotrixNext.desktop"
}
