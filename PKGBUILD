# Maintainer: f4iey <f4iey@f4iey.fr>	

pkgname=unipager-git
pkgver=r267.c5c579e
pkgrel=1
pkgdesc="Universal POCSAG pager transmitter"
arch=('any')
license=('GPL3')
url="https://github.com/rwth-afu/UniPager"
makedepends=(cargo-nightly)
depends=(hidapi)
source=($pkgname::"git+$url.git")
sha256sums=('SKIP')

prepare(){
    git -C "$srcdir/$pkgname" clean -dfx
    cd $srcdir/$pkgname
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

 pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    rm Cargo.lock
    cargo build --release --all-features
}

check(){
    cd $srcdir/$pkgname
    export RUSTUP_TOOLCHAIN=nightly
    cargo test --all-features
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
  install -Dm755 debian/${pkgname%-git}.service $pkgdir/usr/lib/systemd/system/${pkgname%-git}.service
}
