# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-snap"
pkgver=1.5.208
pkgrel=2
pkgdesc="A nonlinear puzzle platformer taking place in impossible spaces"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/divVerent/${_pkgname}"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libx11')
makedepends=('squashfs-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "io.github.divverent.${_pkgsrc}.metainfo.xml::${url}/raw/v${pkgver}/io.github.divverent.${_pkgname}.metainfo.xml")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2642.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2643.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2644.snap")
b2sums=('bd65a7c0de64233e634a6a5c2a8e8a401b70741be1f8a21ac41004651a797ba3acdc17c74cca1352a6780ef6787109f2fa957d65b1914e9e2f36460407804d49'
        '1bbdb8ea81b42a8ce554f92fd57009eef6b296472f910c5542d8a445e34bb0eee0e627a74462b9f453fe9d8853bde71fdb0eea11102bb604129753de6ecc6e06'
        '61d6b4effaa603b367dcbf5bd069d150a93f8d9d2d70d81755d5fcfdba0aa5bcace71cc8e33a795f6af333bffadde7d733ac551377b43360384814f6ed679467')
b2sums_x86_64=('51cdf6421e1321dff3be2ce1ccd5b91e3b9919d7bd4709cb9a45885c4d83aa76643e34997df25822d9b34998fa9305ece64e9044fbc65410b1cd13a9ee79711d')
b2sums_aarch64=('596b0e5d09fffcfeb67779d9641b42e642aa728b146fbd54efa6608e33dfd5094950d4e93897c411a6d1d5a25b5b155fbd1d359ebb68ca2d1aa27d893e5250b7')
b2sums_armv7h=('dfab751f2fe8037adcc002766c1ea42eb1007c6adb3043df7135e65cf90730f4c7ce51db29c5b6db6d62c9c33eabfae7e2fefde8b2cc3f6915da2320f8ae83b2')

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
