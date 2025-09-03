# Maintainer: Mark Hegreberg <aur@hegreberg.io>

pkgname=doxx-git
_pkgname="${pkgname%-git}"
pkgver=r25.ccb4079
pkgrel=1
pkgdesc='Terminal .docx viewer inspired by Glow'
arch=(x86_64 aarch64)
url='https://github.com/bgreenwell/doxx'
license=('MIT')
makedepends=(git cargo)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!lto)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features
}

package() {
  cd "${_pkgname}"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
