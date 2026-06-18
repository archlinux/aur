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
pkgver=4.7
pkgrel=1
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


sha256sums=('e7acb6b27d6bee2525fdaa12660c602b034c25094e8a2679334601d8878a9e06')
sha256sums_aarch64=('db5aa126353a18fd664818e4f1b9cfffaa77e32d4c9af0ea87e8f028a395a1ed'
                    '77809a22b9681e98a26aec37c37897ff15fb7380798a16b1d1401b13bd1e7b87')
sha256sums_armv7h=('b60e11a66805ecc19685aaa17220bd6f30b9c82f416c5fbb79f9828157ed6eed'
                   'e90502b264e9826177f77660d94e00cc992c2ddcc50bbaa93196e4b00efef3f3')
sha256sums_i686=('e4e0e175a3ce8b6801b2175a304d5776a82cf75dd5dffb664155b2a15a9abe8b'
                 'c9cabb23c42387417fc8376f54c9ac4f916183359e9b9910cd1713e02d3fb98f')
sha256sums_x86_64=('0b1a6c54c2c619c12e169fe9241edda4b81080b519451cec2984bf0d2c6cb73c'
                   '69e855001e34b108eb8124ff1eae8445026b2a30a83b6e6314f705ae963d0fe1')

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
  cd "${srcdir}/${_pkgsrc}/misc/logo"
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
  cd "${srcdir}/${_pkgsrc}/misc/logo"
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
