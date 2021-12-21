# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=moe-nim
_pkgname=${pkgname%-nim}
pkgver=0.3.0
pkgrel=1
pkgdesc='A command line based editor inspired by vim. Written in Nim.'
arch=('x86_64')
url='https://editor.moe'
_gh='https://github.com/fox0430/moe'
license=('GPL3')
depends=('glibc')
optdepends=(
  'wl-clipboard: Clipboard support (Wayland)'
  'xsel: Clipboard support (x11)'
  'xclip: Clipboard support (x11)'
  )
makedepends=('git' 'nim' 'nimble')
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}.tar.gz::${_gh}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0ccdeb1e3902b6248150ad140bdfce28c3a5c5444ba2e715a8c2f6263f8e09f')

prepare() {
  cd "${_pkgname}-${pkgver}"
  nimble --nimbleDir:./.nimble refresh
  nimble --nimbleDir:./.nimble install --depsOnly
}

build() {
  cd "${_pkgname}-${pkgver}"
  nimble --nimbleDir:./.nimble --localdeps release --skipUserCfg:on
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" moe
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" documents/*
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/example" example/moerc.toml
}
