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
pkgver=2.47.1
pkgrel=2
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
sha256sums=('cd90fa50aa68b24bd9c6dbadab2ddd68c1fd69a3faca51e433dacc92e40de459'
            '16effc795aac6a9ad3143bb679c5d93e41f99fc2a0796e91362d4e09b529da79'
            '36ea0d21cf80c7e15779b1db7a241dadfa45a1a21890242df1a18a9290d96d8a'
            'd35bb6279d4e9fedb2bbd307cf269fb0abfe1270f7225511e7f149b4ca0f5f29')
sha256sums_aarch64=('13d2d03485d299ab8fa16272ee77be0911f533231f5ee9169dba6c53e602694e'
                    'bfca736449a8c2c6265219989a197aaecb93a864055cb690265f55cdafe41c1b')
sha256sums_x86_64=('2ed48fbb23ae9836ecd3780857b57cf5c7a9b5e3b07c13c3c606e9147e76ce69'
                   '63551e4411b50fa482e190ea52fef6ffe327e45a11a072ee1434112fbb2ad837')
sha256sums_armv7h=('257d53a3dbecb936ba191117d1a5f2399df40e5ae0b4c5751b068497f8faaf9c'
                   '60acb28e1ec21731a9778b479d4ceba8daee06c76588cc7264b600e08dc45a97')

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
