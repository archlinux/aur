# Maintainer: ami-chuu (amichuu73@proton.me)

pkgname='tonelib-grandmagus-bin'
pkgver=1.0.0
pkgrel=1
pkgdesc="TL GrandMagus is a full-featured amp suite that will imbue your guitar tone with a full spectrum of arcane."
arch=('x86_64')
url="https://tonelib.net/plugins/tl-grandmagus.html"
license=('custom:ToneLib')
depends=('alsa-lib' 'freetype2' 'gcc-libs' 'glibc' 'libglvnd' 'libx11')
optdepends=('jack: JACK output')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::http://tonelib.net/download/ToneLib-GrandMagus-amd64.deb")
sha512sums=('a740a9766340c25f2a6a91d7e4b273422340eca17523d777a31e0d850845df88f63d71b5f7fc9aa1812e9ad987269a9035f26c2a12e3ac166d887979662aa812')

package() {

  cd "${srcdir}"

  # Extract .deb
  ar x "${pkgname}-${pkgver}.deb"

  # Extract package data
  bsdtar -xf data.tar.* -C "${pkgdir}"

  # License
  install -Dm644 "${pkgdir}/usr/share/doc/tonelib-grandmagus/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true

}
