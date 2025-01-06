# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-snap"
pkgver=1.5.250
pkgrel=1
pkgdesc="A nonlinear puzzle platformer taking place in impossible spaces"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/divVerent/${_pkgname}"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libx11')
makedepends=('squashfs-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "io.github.divverent.${_pkgsrc}.metainfo.xml::${url}/raw/refs/tags/v${pkgver}/io.github.divverent.${_pkgname}.metainfo.xml")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2696.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2697.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2698.snap")
b2sums=('bd65a7c0de64233e634a6a5c2a8e8a401b70741be1f8a21ac41004651a797ba3acdc17c74cca1352a6780ef6787109f2fa957d65b1914e9e2f36460407804d49'
        '1bbdb8ea81b42a8ce554f92fd57009eef6b296472f910c5542d8a445e34bb0eee0e627a74462b9f453fe9d8853bde71fdb0eea11102bb604129753de6ecc6e06'
        '00dfd08030e6a9a1014c9238c4389b13440fcec5cc945ae304f0d2eab4d5ab410c19813364985ad51f4a718c56b15139166f782275fba6b772f564cfcecc0480')
b2sums_x86_64=('0ec6252b7c24272e873c90e20f7c679095c1eac6a903cd0fd96dc6dbdb3e718e75500acaf2e9d7fe0ed21c706223ec6ee0620345859f9ced2f53754bf7ee238f')
b2sums_aarch64=('4f10e539bf161578e86df2de13ca9886aaaa4df3a1c609d088fc8acac01a4cab0c8cd7a324a2948bfc64163a6be05157ee4414d484902339754f4e25adf1a10b')
b2sums_armv7h=('4af1f2982992ae3905207f7855bedf4a1883480ffe30a20275be92ec036daf0e46e81804464e2a37ac690baece5b597101fbf1cdc27b0086d495483a68f17629')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/meta/gui"
  sed -i 's|Icon=${SNAP}/meta/gui/aaaaxy\.png|Icon=aaaaxy|' "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "io.github.divverent.${_pkgsrc}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.divverent.${_pkgname}.metainfo.xml"
  
  cd "${_pkgsrc}-${CARCH}"
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "meta/gui"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -vDm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -vDm644 "icon.svg"        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
