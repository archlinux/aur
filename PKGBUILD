# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="code2prompt"
pkgname="${_pkgname}-git"
pkgver=1.1.0.r21.g89f30d2
pkgrel=1
pkgdesc="A CLI tool to convert your codebase into a single LLM prompt"
arch=('any')
url="https://github.com/mufeedvh/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib')
makedepends=('git' 'cargo')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  # cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
