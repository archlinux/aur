# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='arm64'
  ['armv7h']='arm'
  ['x86_64']='x64'
)

_Name="DiscordChatExporter"
_pkgbase="discord-chat-exporter"
_pkgname=(
  "${_pkgbase}-cli"
  "${_pkgbase}-gui"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=2.47.3
pkgrel=1
pkgdesc="Exports Discord chat logs to a file"
arch=(
  "${!_arch[@]}"
)
url="https://github.com/Tyrrrz/${_Name}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'gendesk'
)
options=(
  '!strip'
  '!debug'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/Readme.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/License.txt"
  "${_pkgsrc}.png::${url}/raw/refs/tags/${pkgver}/favicon.png"
  "${_pkgbase}-gui-bin.sh"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  '${_Name}.Cli.${pkgver}-linux-${_arch[${_carch}]}.zip::${url}/releases/download/${pkgver}/${_Name}.Cli.linux-${_arch[${_carch}]}.zip'
  '${_Name}.${pkgver}-linux-${_arch[${_carch}]}.zip::${url}/releases/download/${pkgver}/${_Name}.linux-${_arch[${_carch}]}.zip'
)
noextract+=(
  \"\${source_${_carch}[@]%%::*}\"
)"
done
sha256sums=('230aa918a98940895219ebfc520b31af75c741cd76e886748c6f67aa2134f32d'
            '16effc795aac6a9ad3143bb679c5d93e41f99fc2a0796e91362d4e09b529da79'
            'e547019e29fb45858ab6c78b30fd9406a8e0ca6e4ccb605465f9e4ffc88c22d8'
            'd35bb6279d4e9fedb2bbd307cf269fb0abfe1270f7225511e7f149b4ca0f5f29')
sha256sums_aarch64=('955b58d4bd6ca9107387f4c62bf3a0608bb7837e6f9decf3a216150bd2d888d9'
                    '16738622e21d5ca57e7f4a0ec82203ba8a7e176df00025740cf583faf7367424')
sha256sums_x86_64=('8f86bd3a2c2f4412ffbbb2dcb9348642f8f929ad94a4f290ff0f78068c44fc86'
                   '27d02c5c34a90c1d4dfb5004c3bec66bc8a602e876e62b25f3cc1e4c4a92d561')
sha256sums_armv7h=('3a248ad8b92f5e75071fa273627f7d0c555a8b63d754c56c126057e20b5e6fe3'
                   '8456d445851a7001ed2400c9c217398e4c351c0b8be8c896fe1d24d1d9af9064')

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${_pkgbase}-gui" \
    --pkgdesc "${pkgdesc}" \
    --name "Discord Chat Exporter (GUI)" \
    --categories "Utility"
}

package_discord-chat-exporter-cli-bin() {
  pkgdesc+=" - CLI"
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname%-bin}"
  bsdtar -xf "${_Name}.Cli.${pkgver}-linux-${_arch[${CARCH}]}.zip" -C "${pkgdir}/usr/lib/${pkgname%-bin}" --no-same-owner
  ln -vsf "/usr/lib/${pkgname%-bin}/${_Name}.Cli" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_discord-chat-exporter-gui-bin() {
  pkgdesc+=" - GUI"
  depends+=(
    'fontconfig'
    'sh'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -vDm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -vDm644 "${_pkgsrc}.png"       "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname%-bin}"
  bsdtar -xf "${_Name}.${pkgver}-linux-${_arch[${CARCH}]}.zip" -C "${pkgdir}/usr/lib/${pkgname%-bin}" --no-same-owner
  # ln -vsf "/usr/lib/${pkgname%-bin}/${_Name}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
