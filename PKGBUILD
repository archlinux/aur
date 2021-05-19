# Maintainer: Sean Olson <olson.sean.k@gmail.com>

pkgname='nym-git'
pkgver=0
pkgver() {
  cd "$srcdir/$repo"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
pkgrel=1
arch=('x86_64')
pkgdesc='Manipulate files en masse using patterns.'
url='https://github.com/olson-sean-k/nym'
license=('MIT')
makedepends=('rust')
checkdepends=('rust')
provides=('nym')
conflicts=('nym')
repo='nym'
source=("$repo::git+https://github.com/olson-sean-k/nym.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$repo"
    RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release --locked --all-features
}

check() {
    cd "$srcdir/$repo"
    RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release --locked --all-features
}

package() {
    cd "$srcdir/$repo"
    targetdir=${CARGO_TARGET_DIR:-target}
    install -Dm755 "$targetdir/release/nym" "$pkgdir/usr/bin/nym"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/nym/LICENSE"
}
