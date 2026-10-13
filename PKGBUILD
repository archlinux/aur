# Maintainer: matthias
pkgname=llmster-bin
pkgver=0.0.25
_uprel=1
_upver="${pkgver}-${_uprel}"
pkgrel=1
pkgdesc="LM Studio's headless daemon"
arch=('x86_64' 'aarch64')
url="https://lmstudio.ai/docs/developer/core/headless_llmster"
license=('custom')
depends=('glibc' 'gcc-libs')
options=('!strip' '!debug')
provides=('llmster')
conflicts=('llmster' 'lmstudio')
install="${pkgname}.install"

# Append "+cuda12" for the CUDA 12 bundle.
source=("${pkgname}-${_upver}-x86_64.tar.gz::https://llmster.lmstudio.ai/download/${_upver}-linux-x64.full.tar.gz")
noextract=("${pkgname}-${_upver}-x86_64.tar.gz")
sha512sums=('4d119af740379fc7509894d761a85183420a6dd3cb994596a1b6e4b37208a5d3e8cb94ffe583115b1473a6722bab5fffc09b90eb22c755f5dde1458774ab4951')

prepare() {
  # The tarball has no top-level directory, so unpack it into its own folder.
  rm -rf bundle
  mkdir bundle
  bsdtar -xf "${pkgname}-${_upver}-${CARCH}"*.tar.gz -C bundle
}

package() {
  install -d "${pkgdir}/opt/llmster" "${pkgdir}/usr/bin"
  cp -a bundle/. "${pkgdir}/opt/llmster/"
  ln -s /opt/llmster/llmster "${pkgdir}/usr/bin/llmster"
}
