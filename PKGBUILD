# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-snap"
pkgver=1.5.220
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
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "io.github.divverent.${_pkgsrc}.metainfo.xml::${url}/raw/v${pkgver}/io.github.divverent.${_pkgname}.metainfo.xml")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2671.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2669.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/45FRxm5PS8V7HztyVI7dzlFlOQ9jexwK_2670.snap")
b2sums=('bd65a7c0de64233e634a6a5c2a8e8a401b70741be1f8a21ac41004651a797ba3acdc17c74cca1352a6780ef6787109f2fa957d65b1914e9e2f36460407804d49'
        '1bbdb8ea81b42a8ce554f92fd57009eef6b296472f910c5542d8a445e34bb0eee0e627a74462b9f453fe9d8853bde71fdb0eea11102bb604129753de6ecc6e06'
        '0bd20845464e5989eaf87856cac1c7aedfdb9de5e752bb703fec5ae097d581d121f44d710e41498575fd8e20449a6f1a1142810522ecceb2fe140494a2bcd20a')
b2sums_x86_64=('1966dbfc25d10447a7074b309444d4eb801df12c957b62bb1cbd47a3946d2025e10038e9d5e41b71257ab6f55299c58e7c8a7d583634b239a367a13bfe9d9623')
b2sums_aarch64=('5aed225cc5da1d20d6098cfb0e123c502952e33a1b08df65f187bd0d8e68c557e0bb697d1bbbd944946b5e98ef3f709e9768343786d52f5f07ee7e6cd0be5e97')
b2sums_armv7h=('d4ee2592d09668923c1a53084cebe2b7049867ea6a941a8a3339128f7e7c78df49f4d93f3f0602ef1776be3a04fa08e8dfb8775b1bb9521f37afea2ef3bf43b9')

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
