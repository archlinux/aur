# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="holyc-rs"
pkgname="${_pkgname}-git"
pkgver=0.3.0.r5.a2b2493
_commit="ed98d2efe0b3482f426fbc529bcbde34e218c740"
pkgrel=1
pkgdesc="A HolyC Compiler written in Rust"
arch=('x86_64')
url="https://github.com/Passw/TempleOS-joshjkk-HolyC-Compiler"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="TempleOS-joshjkk-HolyC-Compiler"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
