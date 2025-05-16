# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=angryoxide
pkgver=0.8.32
pkgrel=2
pkgdesc='802.11 Attack Tool'
arch=('x86_64')
url='https://github.com/Ragnt/AngryOxide'
license=('GPL-3.0-only')
makedepends=('cargo' 'git')
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('5c848e7fd2499e25dbb11728ea3d313e8cc6f097cf4e13cc4b3cd2f18e962e43')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # change submodule ssh to url
  sed -i 's/git@github.com:/https:\/\/github.com\//g' .gitmodules
  git submodule update --init
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # executable
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  # bash completion
  mv completions/bash_angryoxide_completions completions/angryoxide
  install -Dm0644 -t "${pkgdir}/usr/share/bash-completion/completions" "completions/${pkgname}"
  # zsh completion
  mv completions/zsh_angryoxide_completions completions/_angryoxide
  install -Dm0644 -t "${pkgdir}/usr/share/zsh/site-functions" "completions/_${pkgname}"
}
