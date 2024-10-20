# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="funzzy"
pkgver=1.4.1
pkgrel=1
pkgdesc="A lightweight generic purpose file watcher"
arch=('x86_64')
url="https://github.com/cristianoliveira/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
provides=("${pkgname}")
conflicts=("${pkgname}")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd292b4a1b7838571a2183a55fe82fdf47bc2810e4434807abff7e637463df0a')

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

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/bin"
  ln -s "${pkgname}" "fzz"
}
