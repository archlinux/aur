pkgname=cmdcreate
pkgver=1.3.3
pkgrel=2
pkgdesc="Allows you to create custom commands for your custom scripts"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL-3.0-or-later')

depends=('curl' 'git' 'less')
makedepends=('cargo' 'git' 'zig' 'cargo-zigbuild')

conflicts=('cmdcreate-git')
provides=('cmdcreate')
source=("$pkgname-v$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-v$pkgver"
    rm -f .cargo/config.toml

    local _target="${CARCH}-unknown-linux-musl"
    rustup target add "$_target" || true
    cargo fetch --locked --target "$_target"
}

build() {
    cd "$pkgname-v$pkgver"

    local _target="${CARCH}-unknown-linux-musl"

    export CFLAGS="-O3 -pipe"
    export CXXFLAGS="-O3 -pipe"
    export LDFLAGS=""

    export RUSTFLAGS="-C target-feature=+crt-static -C link-arg=-fno-sanitize=all"
    export CRATE_CC_NO_DEFAULTS=true

    cargo zigbuild --release --frozen --target "$_target"
}

package() {
    cd "$pkgname-v$pkgver"

    local _target_dir="target/${CARCH}-unknown-linux-musl/release"
    
    install -Dm755 "$_target_dir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
