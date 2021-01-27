# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=brchd
pkgver=0.1.0
pkgrel=1
pkgdesc='Data exfiltration toolkit'
url='https://github.com/kpcyrd/brchd'
arch=('x86_64')
license=('GPL3')
depends=('libsodium')
makedepends=('cargo' 'scdoc')
source=(https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('cc6f78352e556e966a6f9fa6cde7d23aa9c6ae0f2647801da73c7ee18c4f2d8c791bb8f23b9fe19d475d3fb67e45feff5c59995c1d637ebc144f49e90a684ffb')
b2sums=('22abbdc21467c6d7ef3340e0f4ee9472bbc6420b314ceccda1f160db962e8c6419ea9be97df00f811ed8301ff400541f601c7d68e283c22c68647d23bd0799b3')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --locked
  scdoc < brchd.1.scd > brchd.1
}

check() {
  cd ${pkgname}-${pkgver}
  cargo test --release --locked
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/bash-completion/completions" \
             "${pkgdir}/usr/share/zsh/site-functions" \
             "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${pkgdir}/usr/bin/brchd" --gen-completions bash > "${pkgdir}/usr/share/bash-completion/completions/brchd"
  "${pkgdir}/usr/bin/brchd" --gen-completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_brchd"
  "${pkgdir}/usr/bin/brchd" --gen-completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/brchd.fish"

  install -Dm 644 brchd.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
