# Maintainer: bencejuhaasz <anon707707@proton.me>
pkgname=bcont-git
pkgver=2.0.0.r0.gbf1eae1
pkgrel=1
pkgdesc="Bubblewrap sandbox with Wayland security-context for Sway"
arch=(x86_64 aarch64)
url="https://github.com/bencejuhaasz/bcont"
license=(0BSD)
depends=(bubblewrap gcc-libs glibc)
makedepends=(git cargo)
optdepends=(
    'sway: Wayland sandbox mode with wp_security_context_manager_v1'
    'xdg-dbus-proxy: D-Bus portal filtering (--dbus/--system-dbus flags)'
)
provides=(bcont)
conflicts=(bcont)
source=("$pkgname::git+https://github.com/bencejuhaasz/bcont.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # Uses tag if available (v1.2.0 → 1.2.0.rN.gHASH), falls back to commit count
    if git describe --long --tags 2>/dev/null | grep -q '^v'; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/bcont "$pkgdir/usr/bin/bcont"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
