# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="mcman"
pkgver=0.4.5
pkgrel=1
pkgdesc="Powerful Minecraft Server Manager CLI. Docker and git support included."
arch=('x86_64')
url="https://github.com/ParadigmMC/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('bzip2' 'gcc-libs' 'glibc')
optdepends=('git: for git support'
            'docker: for docker support')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('6081fe57b122e7551b25a95edb137ddd14411f5bd635ce7c74c676d7534da3c869b08b831a0c5f6fd6588b399fdf48403ad2a3ea6d41220e12d3726bcf5ec9a9')

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
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
