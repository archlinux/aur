# Maintainer: Matteo De Carlo <matteo.dek@gmail.com>

pkgname=sodium-git
pkgver=0.1.0.319.3bb1da3
pkgrel=1
pkgdesc="Sodium is an editor inspired by Vim (but not a clone). It aims to be efficient, fast, and productive."
arch=('x86_64')
url="https://github.com/redox-os/sodium"
license=('MIT')
depends=('sdl2')
makedepends=('cargo')
provides=('sodium')
conflicts=('sodium-bin' 'sodium')
source=("${pkgname}::git+https://github.com/redox-os/sodium.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo -n $(grep version Cargo.toml| sed 's/version = "\(.*\)"/\1./')
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  # Use a temporary local Cargo repository.
  export CARGO_HOME="${srcdir}/cargo-repository"

  cd "${srcdir}/${pkgname}"
  cargo build --release
}

# no tests available
#check() {
#  # Use a temporary local Cargo repository.
#  export CARGO_HOME="$srcdir/cargo-repository"
#
#  cd "${srcdir}/${pkgname}"
#  cargo test
#}

package() {
  install -D -m755 "${srcdir}/${pkgname}/target/release/sodium" "${pkgdir}/usr/bin/sodium"
}

