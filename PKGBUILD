# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="TempleDriver"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.1.1
_commit="f300481b04bff205ad5cbe92a1997cba2d3e59ef" # 1.1.1
pkgrel=1
pkgdesc="A driving game dedicated to King Terry A. Davis"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/mrbid/${_Name}"
license=('Unlicense')
depends=(
  'glibc'
  'libgles'
  'sdl2'
)
makedepends=(
  'squashfs-tools'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/${_commit}/README.md"
        "${_pkgsrc}-LICENSE.md::${url}/raw/${_commit}/LICENSE.md"
        "${_pkgsrc}.appdata.xml::${url}/raw/${_commit}/flat/${_pkgname}.appdata.xml")
# https://askubuntu.com/a/1196449
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/euH2Y1LDnEHbX4GpjAiIhjDFUfxi15ru_67.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/euH2Y1LDnEHbX4GpjAiIhjDFUfxi15ru_66.snap")
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/euH2Y1LDnEHbX4GpjAiIhjDFUfxi15ru_65.snap")
sha256sums=('6e7718c42707aee26c3ee595fa37bfb896f08e6c950497954d82721fa2768ed5'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd'
            '32812355856988863bf6dcb1b1fc04502162a789250c789db8270adefc0976f5')
sha256sums_aarch64=('8fbbe3b35e2570e7d12d0ddccb69ed2884021595f7fbf6e746585b0e2a9d4000')
sha256sums_armv7h=('b7026400294bafcf7ba24aaa5830f159b355999c4bb3aaa28ea573ac7b87aa4c')
sha256sums_x86_64=('a91a827a45846022afa729e6c20ca259f3599cd7bc1e56c4bdf11141ea772b44')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"

  cd "${_pkgsrc}-${CARCH}/meta/gui"
  sed -i "s|Icon=.*|Icon=${_pkgname}|" "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}.appdata.xml" "${pkgdir}/usr/share/metainfo/${_pkgname}.appdata.xml"
  
  cd "${_pkgsrc}-${CARCH}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "meta/gui"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -vDm644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
