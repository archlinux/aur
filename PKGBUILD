# Maintainer: Artyom Kalin <kalin.a.v20031@gmail.com>

pkgname=pacrs
pkgver=0.3.0
pkgrel=1
pkgdesc='pacman wrapper with CLI inspired by zypper and apt'
url='https://github.com/5121f/pacrs'
source=("$pkgname-$pkgver.tar.gz::https://github.com/5121f/pacrs/archive/refs/tags/v$pkgver.tar.gz")
arch=('x86_64')
makedepends=('cargo')
depends=('git' 'pacman' 'libalpm.so>=14')
optdepends=('paru: AUR support')
sha256sums=('7f1cf96da93a28a9d898ac137a35265347bd19ecc52736a00fd0bade65019bea')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm0755 -t $pkgdir/usr/bin/ target/release/$pkgname
    install -Dm0644 completions/fish $pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish
}
