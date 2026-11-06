# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=mdsh
pkgdesc='A markdown shell pre-processor'
# Using latest commit from master until the next release.
_commit=eca79da623dab29ed132b6c4d26a26795c2499c2
pkgver=0.9.2.r14.g${_commit:0:7}
pkgrel=1
url='https://github.com/zimbatm/mdsh'
arch=(aarch64 x86_64)
license=('MIT')
makedepends=('cargo')
depends=('glibc' 'libgcc')
source=("${pkgname}-${_commit:0:7}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('883aa079cfed8e2a902f65f347731b2e7293331e61924501d5e246aebac3737aca103de04b3279df51de8900be06711e63073b2acecaf681808816c6827d8f30')

prepare() {
  cd "${pkgname}-${_commit}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${_commit}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_STRIP=false
  cargo build --frozen --all-features --release
}

check() {
  cd "${pkgname}-${_commit}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${_commit}"

  install -vD -t "${pkgdir}/usr/bin" -m755 target/release/mdsh
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
