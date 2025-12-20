# Maintainer: Garrett <djspacewhale@4d2.org>
pkgname=rmpc-auto-theme-git
_pkgname=RMPC-Auto-Theme
pkgver=r22.e0f6399
pkgrel=1
pkgdesc='Dynamic theme generator for rmpc music player using K-means color extraction'
url='https://github.com/animegolem/RMPC-Auto-Theme'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')
install=rmpc-auto-theme.install
depends=('glibc' 'gcc-libs' 'bash')
makedepends=('cargo' 'git')
source=("git+https://github.com/animegolem/RMPC-Auto-Theme.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$_pkgname"
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$_pkgname" 
    install -Dm755 "target/release/rmpc-theme-gen" "$pkgdir/usr/bin/rmpc-theme-gen"
    install -Dm755 "on_song_change.sh" "$pkgdir/usr/share/rmpc-auto-theme/on_song_change.sh"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}