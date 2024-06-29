# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname="funzzy"
pkgver=1.2.0
pkgrel=1
pkgdesc="A lightweight generic purpose file watcher"
arch=('any')
url="https://github.com/cristianoliveira/${pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=("${pkgname}" "fzz")
conflicts=("${pkgname}" 'fzz')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8220491c2614afb914346bf8aed8d9a0a319b562c5e80c0dc67a2d4cb18463d3')

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
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "target/release/fzz" "${pkgdir}/usr/bin/fzz"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
