# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=angryoxide
_pkgname=AngryOxide
pkgver=0.8.28
pkgrel=1
_patch=""
pkgdesc='802.11 Attack Tool'
arch=('x86_64')
url='https://github.com/Ragnt/AngryOxide'
license=('GPL-3.0-only')
makedepends=('cargo' 'git')
options=(!lto)
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('9d5dafe9f09d1afa0f7677121427d13e8784304d43114a5b9ac4d463fb121acf1ae349befe4725bbe103df4931d3a08fd4df1107f1b3950c8e3587a48521ff81')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  # executable
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  # bash completion
  mv completions/bash_angryoxide_completions completions/angryoxide
  install -Dm0644 -t "${pkgdir}/usr/share/bash-completion/completions" "completions/${pkgname}"
  # zsh completion
  mv completions/zsh_angryoxide_completions completions/_angryoxide
  install -Dm0644 -t "${pkgdir}/usr/share/zsh/site-functions" "completions/_${pkgname}"
}
