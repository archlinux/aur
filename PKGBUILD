# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-snap"
pkgver=1.5.256
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
_snap="45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "io.github.divverent.${_pkgsrc}.metainfo.xml::${url}/raw/refs/tags/v${pkgver}/io.github.divverent.${_pkgname}.metainfo.xml")
# curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/aaaaxy | jq
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snap}_2705.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snap}_2706.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snap}_2707.snap")
b2sums=('bd65a7c0de64233e634a6a5c2a8e8a401b70741be1f8a21ac41004651a797ba3acdc17c74cca1352a6780ef6787109f2fa957d65b1914e9e2f36460407804d49'
        '1bbdb8ea81b42a8ce554f92fd57009eef6b296472f910c5542d8a445e34bb0eee0e627a74462b9f453fe9d8853bde71fdb0eea11102bb604129753de6ecc6e06'
        '2b0d58a69445bc4bea96bdcbd97c264ccf963b7868a281a201191fbf6a71c1ead6d0fbf1daf59608843b17a9ac34c693ba151ebbd18a1f8eb2d50bb992ee5ffa')
b2sums_x86_64=('5b2caf15c9d9e987f4e95d40aaacad0a05ecb5ea48501fa0b0366b1af3b75c179914e0fd8f5767bfcb04b38cab24057e8562cfea948d748db719ecc02d06b492')
b2sums_aarch64=('0a98290d5a9ffa0408944eacc71b41b086056ea9792cab502997443e9d9b9770335fe3356ba5651bcf5624865dcd05abb80ba494228e23bd29e21d0a5ebd6019')
b2sums_armv7h=('590da64f5bb2dffae236a3e4c9dfc7d8798e5dcd4fb759eafc7c68a9a05689b463803398f1d7a1c701d807e9bcba1ca20991473ea373b58375fb6cfd2f9a2a31')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/meta/gui"
  sed -i 's|^Icon=.*|'"Icon=${_pkgname}|" "${_pkgname}.desktop"
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
