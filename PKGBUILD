# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="funzzy"
pkgname="${_pkgname}-git"
pkgver=1.2.0.r9.g5a92558
pkgrel=1
pkgdesc="A lightweight generic purpose file watcher"
arch=('any')
url="https://github.com/cristianoliveira/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=("${_pkgname}=${pkgver%%.r*}" "fzz=${pkgver%%.r*}")
conflicts=("${_pkgname}" 'fzz')
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
  install -Dm755 "target/release/fzz" "${pkgdir}/usr/bin/fzz"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
