# Maintainer: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>

pkgname="enarx-git"
_pkgname="enarx"
pkgver=0.1.3.git
pkgrel=1
pkgdesc="Application deployment system enabling applications to run within Trusted Execution Environments (TEEs)"
arch=("x86_64")
url="https://github.com/enarx/enarx"
license=("GPL3")
depends=()
makedepends=("rust-nightly-bin" "cargo" "git")
provides=("enarx")
conflicts=("enarx")
source=("$_pkgname::git+https://github.com/enarx/enarx.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  cargo build --release --locked --all-features --target-dir=target
}

check() {
   cd $_pkgname
   cargo test --release --locked --target-dir=target
 }

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
