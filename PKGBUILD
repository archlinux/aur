# Maintainer: Ivy Huang <imyxh@imyxh.net>
# vim: set tw=0 sw=4 et :

pkgname=taskchampion-sync-server
pkgver=3.0.0
pkgrel=1
pkgdesc="The server Taskwarrior syncs to"
arch=('x86_64')
url="https://taskwarrior.org/"
license=('MIT')
depends=('util-linux' 'gnutls')
makedepends=('cmake' 'git' 'cargo')
optdepends=()
_commit=3e41fb604c209e355444a1f0e2f4e15c70d76226
source=(
    "$pkgname::git+https://github.com/GothenburgBitFactory/taskwarrior.git#commit=$_commit"
    "$pkgname.service"
    "$pkgname.sysusers"
)
sha256sums=(
    '4f8304c149f28152fa1f291d6be1b263ed23619f53637715ae21e023f9c0f184'
    '3ea87bb86ec6aa395eba25f859350545c9c67fa9779e485fd9083b7317339458'
    '6ff937968e0c319bd436bdfe765eba132ceac78cb80640a8fd7b909cd44db89a'
)
options=('!lto')
install="$pkgname.install"

prepare() {
    cd "$srcdir/$pkgname/taskchampion/sync-server"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname/taskchampion/sync-server"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname/taskchampion/sync-server"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dt "$pkgdir/usr/bin" "$srcdir/$pkgname/taskchampion/sync-server/target/release/$pkgname"
}

