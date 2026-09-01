pkgname=waymeet-git
pkgver=r8.f9c89e9
pkgrel=1
pkgdesc="Linux calendar CLI/daemon for Google Calendar and CalDAV with terminal/Waybar output"
arch=('x86_64')
url="https://github.com/chmouel/waymeet"
license=('Apache-2.0')
# ring doesn't work with LTO
options=(!lto)
depends=(
    'glibc'
    'libgcc'
)
makedepends=(
    'cargo'
    'git'
)
source=("git+https://github.com/chmouel/waymeet.git")
sha256sums=('SKIP')

pkgver(){
    cd waymeet
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd waymeet
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd waymeet
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd waymeet
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features --workspace
}

package() {
    cd waymeet
    install -Dm755 "target/release/waymeet" -t "$pkgdir/usr/bin"

    install -Dm644 README.md DESIGN.md -t "$pkgdir/usr/share/doc/waymeet"
    install -Dm644 config.example.toml -t "$pkgdir/usr/share/doc/waymeet"

    install -Dm644 systemd/waymeet.service -t "$pkgdir/usr/lib/systemd/user"
}
