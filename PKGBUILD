# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="percival"
pkgname="${_pkgname}-git"
pkgver=r25.0ef0d55
pkgrel=1
pkgdesc="A HolyC Compiler written in Rust"
arch=('x86_64')
url='https://github.com/StappsWorld/Percival'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="Percival"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
