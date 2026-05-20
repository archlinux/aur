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
pkgver=4.6.3
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


sha256sums=('2261028c0dfc10e0cf4800a5b2e5a57ea241f72965162327f5764d536a69a46a')
sha256sums_aarch64=('90c70382eee1542904bf507b9bdc6e62a230ac73fd214bf3887a9e0a4d85aeed'
                    '970d2fecb66d8cff7457903e291cac4293e2468d24375db58b747a0f8b6c58e4')
sha256sums_armv7h=('9db8b77e916d45f9368c7654b9fa9b0e9b03dacd032118ad854f96c6e62c21b9'
                   '17054d83892fefb920a4a00b06d7cec4ceee877ceec8acd2ca4deefe5fb178fa')
sha256sums_i686=('03acad0ea2713954c3b499eaf3a2863892996100b91e58023bb125edb07f6292'
                 'a5a96b09bfcfabb2ff2f50aa3ba0f24ec41b2437729c8ccbaf0045c91b724b60')
sha256sums_x86_64=('d0bc2113065e481c9c2c2b2c37daa4e8be3fe9e27f0ab9ab0b6096e9a37907f3'
                   '702a8a6785060203fd46373adf864586ecf0c377ac685d7107dde66b1eba0a9e')

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
