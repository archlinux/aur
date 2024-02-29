# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=angryoxide
_pkgname=AngryOxide
pkgver=0.8.7b
pkgrel=1
_patch=""
pkgdesc='802.11 Attack Tool'
arch=('x86_64')
url='https://github.com/Ragnt/AngryOxide'
license=('GPL-3.0-only')
makedepends=('cargo' 'git')
options=(!lto)
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('64b510435953a22c323cae2d309fc48af1c10b65610d5ef6005cf738934c4e91b47adb04a0e77b0d411085220c77b77c6fc5706fd320034d8f7c9fc304015ab8')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  # cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
  # temporary to fix build
  cargo fetch --target "${CARCH}-unknown-linux-gnu"
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
