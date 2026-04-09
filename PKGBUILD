# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-core
pkgver=1.3.5
pkgrel=1
pkgdesc='Core daemon for the Owlry application launcher — manages plugins, providers, and search'
arch=('x86_64')
url='https://somegit.dev/Owlibou/owlry'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-core-v$pkgver.tar.gz")
b2sums=('6bd1b55d55e209e9dbbbf31101521a43e2a3bce465c16098d0aca5d781dffa955251583c6748bcb5f79b135f3d0774cb1d48ac6113ffc9ed06f8f95ef87446fc')

prepare() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p owlry-core --frozen --release
}

check() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test -p owlry-core --frozen --lib
}

package() {
    cd "owlry"
    install -Dm755 "target/release/owlryd" "$pkgdir/usr/bin/owlryd"
    install -Dm644 "systemd/owlryd.service" "$pkgdir/usr/lib/systemd/user/owlryd.service"
    install -Dm644 "systemd/owlryd.socket" "$pkgdir/usr/lib/systemd/user/owlryd.socket"
    install -dm755 "$pkgdir/usr/lib/owlry/plugins"
    install -dm755 "$pkgdir/usr/lib/owlry/runtimes"
}
