# Maintainer: Matthieu LAURENT <matthieu.laurent69 [at] proton.me>
# Contributor: nerdypepper <nerdy [at] peppe.rs>

_pkgname=statix
pkgname=$_pkgname-git
pkgver=0.5.4.r22.gd324490
pkgrel=1
pkgdesc='Lints and suggestions for the nix programming language '
arch=(x86_64)
url=https://github.com/nerdypepper/statix
license=(MIT)
provides=($_pkgname)
conflicts=($_pkgname)
depends=()
makedepends=(cargo git)
source=($pkgname::git+https://github.com/nerdypepper/statix.git)
sha256sums=('SKIP')
options=()

prepare() {
    cd "$srcdir"/$pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$pkgname
    cargo build --frozen --release
}

check() {
    cd "$srcdir"/$pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir"/$pkgname
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
