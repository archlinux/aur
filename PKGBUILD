# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-snap"
pkgver=1.5.202
pkgrel=1
pkgdesc="A nonlinear puzzle platformer taking place in impossible spaces"
arch=('x86_64' 'aarch64' 'armhf')
url="https://github.com/divVerent/${_pkgname}"
license=('Apache-2.0')
makedepends=('squashfs-tools')
depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libx11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "io.github.divverent.${_pkgsrc}.metainfo.xml::${url}/raw/v${pkgver}/io.github.divverent.${_pkgname}.metainfo.xml")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2630.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2631.snap")
source_armhf=("${_pkgsrc}-armhf.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2632.snap")
b2sums=('bd65a7c0de64233e634a6a5c2a8e8a401b70741be1f8a21ac41004651a797ba3acdc17c74cca1352a6780ef6787109f2fa957d65b1914e9e2f36460407804d49'
        '1bbdb8ea81b42a8ce554f92fd57009eef6b296472f910c5542d8a445e34bb0eee0e627a74462b9f453fe9d8853bde71fdb0eea11102bb604129753de6ecc6e06'
        '05c407047bc46c61adcbf833c62667b61b71e41160f3e83fd2e271082ad3d1ef0ac36f9fa8a0987577e21620c7ba787aadd6cbb18c265c64ab77de86ceaaf2fc')
b2sums_x86_64=('e45f8808effe5401cc1b4e0099101456579f5c6a024141526c27aefee1bb6a28d78fdeb6bd98f310452eb9e5e421c697143c7193a735943b51f93100d5be1e08')
b2sums_aarch64=('ca05b67a4877c822fe0446190f29475b51b049711eaf6a8c3f224fe3320b06c50dacbd8e2dfae96d9eaf87d80f4469fbd49e1b69b711dc67c0888abafcbbc080')
b2sums_armhf=('f96645848eb0fad6bcf53bbd24cd30e5da8704b082d80b32dba1fad86606425044cd1ab9e80ec366235b941bb54ed0fe94828e200604a4ef302d2895cc63efb8')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"

  cd "${_pkgsrc}-${CARCH}/meta/gui"
  sed -i 's|Icon=${SNAP}/meta/gui/aaaaxy\.png|Icon=aaaaxy|' "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "io.github.divverent.${_pkgsrc}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.divverent.${_pkgname}.metainfo.xml"
  
  cd "${_pkgsrc}-${CARCH}"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "meta/gui"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm644 "icon.svg"        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
