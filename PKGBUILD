# Maintainer: Nova Bürky (me@novadragon.space)
_pkgbase="godot"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase/godot/godot-mono}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.6.2
pkgrel=6
pkgdesc="Godot Engine - Prebuilt binary from GitHub"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)


url="https://godotengine.org"
_url="https://github.com/godotengine/godot-builds"
license=(MIT)
makedepends=(desktop-file-utils)
depends=(glibc)

_pkgver="${pkgver}-stable"
_pkgsrc="godot-${_pkgver}"


source=(
  "${_url}/releases/download/${_pkgver}/${_pkgsrc}.tar.xz"
)
source_aarch64=(
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.arm64.zip"
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_arm64.zip"
)
source_armv7h=(
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.arm32.zip"
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_arm32.zip"
)
source_i686=(
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.x86_32.zip"
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_x86_32.zip"
)
source_x86_64=(
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.x86_64.zip"
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_x86_64.zip"
)


sha256sums=('3465f34ae41cb7d7c17b0516c7cce93cc8a7a4d62331456b7b18e4e1d1b064c2')
sha256sums_aarch64=('c9154154de14acb1f38a6c8618f01f4111ecbd1cdbcecd0a5151be42de2bd1c9'
                    '65ee9699f6112c87bff2191c8e82ed96cf4c48c6e1549b8a9eb2664a8e80c99e')
sha256sums_armv7h=('d78dc08446394b6023624df7e1cead16fc9464409dd44df71f7febb5a88d1e88'
                   '388f44c5fab27e69762c8061c290177156b53f63c71e1add01cefd53ed5a1de0')
sha256sums_i686=('5c750b9ad53955f1e54fdf2dd61f75c6074d4972872b12e64046ec2f2b928c12'
                 '9d96e2ce7578a6f323a4ab02a7d82c518dd139c802d170270ca59a73a134aa29')
sha256sums_x86_64=('30e6b6d141f0cd5bebd629ad1d0ef1324e60091bb20662d026b402ba58c59937'
                   '7d53302c31648ad98b620e8ca5b0c869c1066495770e62b2fa770cfeb004f167')

prepare(){


  cd "${srcdir}/${_pkgsrc}/misc/dist/linux"
  cp -f "org.godotengine.Godot.desktop" "org.godotengine.Godot-mono.desktop"

  desktop-file-edit --set-key="Exec" --set-value="godot-mono %f" "org.godotengine.Godot-mono.desktop"

  desktop-file-edit --set-key="Icon" --set-value="godot-mono" "org.godotengine.Godot-mono.desktop"



  desktop-file-edit --set-name="Godot Engine Mono" "org.godotengine.Godot-mono.desktop"

  # MIME info fix, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    "org.godotengine.Godot.xml"

}

package_godot-bin() {
  depends=(
    'glibc'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm755 "${source_artifact%.zip}" -t "${pkgdir}/usr/lib/${_pkgbase}"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE.txt"


  # dev versions of 4.7 have this in this commented out folder, lets have that stand here
  # cd "${srcdir}/${_pkgsrc}/misc/logo"
  install -vDm644 "icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.svg"

  cd "${srcdir}/${_pkgsrc}/misc/dist/linux"
  install -vDm644 "godot.6" "${pkgdir}/usr/share/man/man6/${pkgname%-bin}.6"
  install -vDm644 "org.godotengine.Godot.desktop" "${pkgdir}/usr/share/applications/org.godotengine.Godot.desktop"
  install -vDm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/metainfo/org.godotengine.Godot.xml"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${_pkgbase}/${source_artifact%.zip}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_godot-mono-bin() {
  depends+=(
    'dotnet-sdk'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  local source_array="source_${CARCH}[1]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vd "${pkgdir}/usr/lib/${_pkgbase}"
  cp -aT --no-preserve=ownership "${source_artifact%.zip}" "${pkgdir}/usr/lib/${_pkgbase}"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE.txt"

  # dev versions of 4.7 have this in this commented out folder, lets have that stand here
  # cd "${srcdir}/${_pkgsrc}/misc/logo"
  install -vDm644 "icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.svg"

  cd "${srcdir}/${_pkgsrc}/misc/dist/linux"
  install -vDm644 "godot.6" "${pkgdir}/usr/share/man/man6/${pkgname%-bin}.6"
  install -vDm644 "org.godotengine.Godot-mono.desktop" "${pkgdir}/usr/share/applications/org.godotengine.Godot-mono.desktop"
  install -vDm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/metainfo/org.godotengine.Godot-mono.xml"

  install -vd "${pkgdir}/usr/bin"
  # mhm
  local source_artifact_fix="${source_artifact%.zip}"
  ln -vsf "/usr/lib/${_pkgbase}/${source_artifact_fix/linux_/linux.}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
