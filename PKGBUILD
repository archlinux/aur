# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname="mcman"
pkgver=0.4.4
pkgrel=1
pkgdesc="Powerful Minecraft Server Manager CLI. Docker and git support included."
arch=('any')
url="https://github.com/ParadigmMC/${pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'bzip2')
optdepends=('git: for git support'
            'docker: for docker support')
makedepends=('cargo')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('060e4b980d1612e0c82dd2775f3c35bcebd5e6ca9999b90131e52d40e65fc95c')

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
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
