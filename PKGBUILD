# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=mdsh
pkgdesc='A markdown shell pre-processor'
# Using latest commit from master until the next release.
_commit=c78e9090d1450a748d4a21a194d458ee51ad9e7f
pkgver=0.9.2.r10.g${_commit:0:7}
pkgrel=1
url='https://github.com/zimbatm/mdsh'
arch=(aarch64 x86_64)
license=('MIT')
makedepends=('cargo')
depends=('glibc' 'libgcc')
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('e8a5d7f2913157b780344121833a64ed2a9ac0e6711af9d70c6ab8f31919644f8e300383502a25a2ce9c427e8cf00ad6cfaeee888005f8d3e60e9d73e09434e6')

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
