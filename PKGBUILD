# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="TempleDriver"
_pkgname="${_binname,,}"
pkgname="${_pkgname}-snap"
pkgver=1.1.1
_commit="f300481b04bff205ad5cbe92a1997cba2d3e59ef"
pkgrel=2
pkgdesc="A driving game dedicated to King Terry A. Davis"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mrbid/${_binname}"
license=('Unlicense')
makedepends=('squashfs-tools')
depends=('glibc' 'hicolor-icon-theme' 'libglvnd' 'sdl2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/${_commit}/README.md"
        "LICENSE-${pkgver}.md::${url}/raw/${_commit}/LICENSE.md"
        "${_pkgsrc}.appdata.xml::${url}/raw/${_commit}/flat/${_pkgname}.appdata.xml")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/euH2Y1LDnEHbX4GpjAiIhjDFUfxi15ru_65.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/euH2Y1LDnEHbX4GpjAiIhjDFUfxi15ru_67.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/euH2Y1LDnEHbX4GpjAiIhjDFUfxi15ru_66.snap")
sha384sums=('2fcc4f2d61896d38fde580806f03e9b0b0b247121ba79fb7e0a1a15d7e5aa2a3a99bc361fac1dd467f4dfcb1a6a625a1'
            '262e42404a8d686f114e350ea3ba89f860e58ffc0e905d937a9cd912e1b29a23911ca85ddb9eae1d6d280b310b0db7ce'
            '24f5f237d4fd7cbf3272dada81668f9a954c33cfe561c22bee4e1422a4f9be84455c05c539eab3eb6b57cfec79d6d431')
sha384sums_x86_64=('90ffde70d63a73bf376b69361443c8c9a91ec94e4e661d010b9b502b073be758b865047608c4549f4b5381b435bb75e2')
sha384sums_aarch64=('212feb2fe423c4961e1f8dc298e5577271e6abdd9097aedac5822f520095d741cdde82c076c2de26b518bd3b89bca5bf')
sha384sums_armv7h=('a319a57070f2c9bf2f38dd93850b67236812d701e43ded70f6b71b33e88042fb2e3f4db2d997e9c4d732183ed6faf586')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"

  cd "${_pkgsrc}-${CARCH}/meta/gui"
  sed -i 's|Icon=${SNAP}/meta/gui/templedriver\.png|Icon=templedriver|' "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -Dm644 "${_pkgsrc}.appdata.xml" "${pkgdir}/usr/share/metainfo/${_pkgname}.appdata.xml"
  
  cd "${_pkgsrc}-${CARCH}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "meta/gui"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
