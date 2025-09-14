pkgname=v8_killer-git
pkgver=r84.gceff389
pkgrel=1
pkgdesc="A powerful and highly customizable universal V8 virtual machine injector."
arch=(x86_64 aarch64)
url=https://shellwen.github.io/v8_killer/
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(git rust clang)
provides=(v8_killer)
conflicts=(v8_killer)
options=(!lto)
source=("git+https://github.com/ShellWen/v8_killer.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/v8_killer"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
    cd "$srcdir/v8_killer"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/v8_killer"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/v8_killer"
    install -Dm755 target/release/v8_killer_launcher "$pkgdir/usr/lib/v8_killer/v8_killer_launcher"
    install -Dm644 target/release/libv8_killer_core.so "$pkgdir/usr/lib/v8_killer/libv8_killer_core.so"
    mkdir -p "$pkgdir/usr/bin"
    ln -srfv "$pkgdir/usr/lib/v8_killer/v8_killer_launcher" "$pkgdir/usr/bin/v8_killer_launcher"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
