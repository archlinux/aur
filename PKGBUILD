# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=angryoxide
_pkgname=AngryOxide
pkgver=0.8.27
pkgrel=1
_patch=""
pkgdesc='802.11 Attack Tool'
arch=('x86_64')
url='https://github.com/Ragnt/AngryOxide'
license=('GPL-3.0-only')
makedepends=('cargo' 'git')
options=(!lto)
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('15552acde6052c1eb1719d316586791eb6c8d550ed1cee6d9b1f0261c8b83cf2284ab49280e9655d91ef0c36267a55cf2456e4f1bd0bb754047d15b7ad584c4c')

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
