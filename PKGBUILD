# Maintainer: sommerfeld <sommerfeld@sommerfeld.dev>

_pkgname=sentrum
pkgname=$_pkgname-git
pkgver=0.1.7
pkgrel=1
pkgdesc="Daemon that monitors watch-only bitcoin wallets"
arch=('any')
url="https://github.com/sommerfelddev/$_pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'git')
source=("git+$url")
sha256sums=('SKIP')
backup=("etc/$_pkgname/$_pkgname.toml")
options=('!lto')
provides=('sentrum')
confllicts=('sentrum')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_pkgname"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"

    install -Dm644 "contrib/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "contrib/systemd/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "contrib/systemd/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 "$_pkgname.sample.toml" "$pkgdir/etc/$_pkgname/$_pkgname.toml"

    install -Dm644 "man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
