# Maintainer: Artyom Kalin <kalin.a.v20031@gmail.com>

pkgname=pacrs
pkgver=1.0.1
pkgrel=1
pkgdesc='pacman wrapper with CLI inspired by zypper and apt'
url='https://codeberg.org/zeroten/pacrs'
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/zeroten/pacrs/archive/v$pkgver.tar.gz")
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('cargo')
depends=('git' 'pacman' 'libalpm.so>=16')
optdepends=('paru: AUR support')
sha256sums=('ec09c170177828bbd05c96ff848d8815e4f5313f9389eab5f8838c7bd1c8afac')

prepare() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm0755 -t $pkgdir/usr/bin/ target/release/$pkgname
    install -Dm0644 completions/fish $pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish
    install -Dm0644 completions/bash $pkgdir/usr/share/bash-completion/completions/$pkgname
    install -Dm0644 completions/zsh $pkgdir/usr/share/zsh/site-functions/_$pkgname
}
