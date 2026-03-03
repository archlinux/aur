# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=10.0
_Name="DiscordChatExporter"
pkgbase="discord-chat-exporter"
pkgname=(
  "${pkgbase}-core"
  "${pkgbase}-cli"
  "${pkgbase}-gui"
)
pkgver=2.47
pkgrel=1
pkgdesc="Exports Discord chat logs to a file"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/Tyrrrz/${_Name}"
license=(
  'MIT'
)
depends=(
  "dotnet-runtime-${_sdk}"
)
makedepends=(
  "dotnet-sdk-${_sdk}"
  'gendesk'
)
options=(
  '!strip'
  '!debug'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgbase}_xdg_settings.patch"
)
b2sums=('aedd44539bdbd92225f8ded056861fdfcca14f5a867452845e183195bc868333f79917d8b88cb54b97b76692d3f6ff5bc0170bdaac7e194aa2d8d0dee35439bb'
        'ec3740a7c60b0f5fc2773e991e6cde9b4116d77d50094b237e118f456d9273c18a8e3bc2da2ff8a86eb35fa7df4f81c94759467b415f53e4794fb7a4e0929a91')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

_source() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
}

prepare() {
  _source
  local dotnet_restore_options=(
    --runtime "linux-${_msarch}"
    --locked-mode
  )

  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_xdg_settings.patch"

  for dir in Core Cli Gui; do
    dotnet restore "${dotnet_restore_options[@]}" "${_Name}.${dir}"
  done
}

build() {
  _source
  local dotnet_publish_options=(
    --configuration Release
    --framework "net${_sdk}"
    --no-restore
    # --output build
    --no-self-contained
    --runtime "linux-${_msarch}"
    -p:DebugType=None
    -p:DebugSymbols=false
    -p:Version="${pkgver%%.[A-Za-z]*}"
    -p:PublishTrimmed=false
    -p:PublishMacOSBundle=false
  )

  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${pkgbase}-gui" \
    --pkgdesc "${pkgdesc}" \
    --name "Discord Chat Exporter (GUI)" \
    --exec "${pkgbase}-gui" \
    --icon "${pkgbase}" \
    --categories "Utility"

  cd "${_pkgsrc}"
  dotnet publish "${dotnet_publish_options[@]}" --output build-core "${_Name}.Core"

  mkdir -p build-{cli,gui}
  cp -aT build-core build-cli
  cp -aT build-core build-gui

  dotnet publish "${dotnet_publish_options[@]}" --output build-cli "${_Name}.Cli"
  dotnet publish "${dotnet_publish_options[@]}" --output build-gui "${_Name}.Gui"

  find build-core -type f | while read -r f; do
    rel="${f#build-core/}"
    rm -f "build-cli/$rel" "build-gui/$rel"
  done
}

package_discord-chat-exporter-core() {
  pkgdesc+=" - Core"

  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/lib/${pkgbase}"
  cp -vaT --no-preserve=ownership "build-core" "${pkgdir}/usr/lib/${pkgbase}"

  install -vDm644 "Readme.md"   "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  install -vDm644 "favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_discord-chat-exporter-cli() {
  pkgdesc+=" - CLI"
  depends+=(
    "${pkgbase}-core>=${pkgver}-${pkgrel}"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgbase}"
  cp -vaT --no-preserve=ownership "build-cli" "${pkgdir}/usr/lib/${pkgbase}"
  ln -vsf "/usr/lib/${pkgbase}/${_Name}.Cli" "${pkgdir}/usr/bin/${pkgname}"
}

package_discord-chat-exporter-gui() {
  pkgdesc+=" - GUI"
  depends+=(
    "${pkgbase}-core>=${pkgver}-${pkgrel}"
  )

  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgbase}"
  cp -vaT --no-preserve=ownership "build-gui" "${pkgdir}/usr/lib/${pkgbase}/"
  ln -vsf "/usr/lib/${pkgbase}/${_Name}" "${pkgdir}/usr/bin/${pkgname}"
}
