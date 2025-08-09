# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: xyzzy

_Name="Ryujinx"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.3.2
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=('aarch64' 'x86_64')
url="https://ryujinx.app"
_url="https://git.ryujinx.app/ryubing/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'fontconfig' 'gcc-libs' 'glibc' 'jack' 'libpulse' 'libx11' 'wayland')
makedepends=('desktop-file-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/-/raw/${pkgver}/README.md?ref_type=tags&inline=false"
        "${_pkgsrc}.desktop::${_url}/-/raw/${pkgver}/distribution/linux/${_Name}.desktop?ref_type=tags&inline=false"
        "${_pkgsrc}.svg::${_url}/-/raw/${pkgver}/distribution/misc/Logo.svg?ref_type=tags&inline=false")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::https://git.ryujinx.app/api/v4/projects/1/packages/generic/Ryubing/${pkgver}/${_pkgsrc}-linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::https://git.ryujinx.app/api/v4/projects/1/packages/generic/Ryubing/${pkgver}/${_pkgsrc}-linux_x64.tar.gz")
sha256sums=('503f5f72050bffe23f7d7cc13a3a7c45430afe585950e3e3574c4e99455e8743'
            'a19dc6e539931df63d4813f787c51f460cf72e0c44b20add1c0c6ef56c47d840'
            '6d8329413c64e2eb8a1706d2cf97e89fc5083b0654468bd6feefe47e61faaad2')
sha256sums_aarch64=('97f4bed6c4993ef29402456bb84981370950243f56a0d18f3b0c3cf57f16a131')
sha256sums_x86_64=('b1db7f41a06ed9a5fb040737c2d32eb332daedcde26e40d53f48adde305a1e6e')

prepare() {
  cd "${srcdir}"
  desktop-file-edit --set-key="Exec" --set-value="${_pkgname} %f" "${_pkgsrc}.desktop"
  desktop-file-edit --set-icon="${_pkgname}" "${_pkgsrc}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -vDm644 "${_pkgsrc}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"

  cd "publish"
  install -vDm755 "${_Name}" "${pkgdir}/usr/lib/${_pkgname}/${_Name}"
  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${_pkgname}/${_Name}" "${pkgdir}/usr/bin/${_pkgname}"

  find . -maxdepth 1 -type f \( -name '*lib*.so*' -o -name '*.dll*' \) -exec \
    cp -vr --no-preserve=ownership "{}" "${pkgdir}/usr/lib/${_pkgname}" \;

  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "mime"
  install -vDm644 "${_Name}.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"

}
