# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=10.0
_Name="DiscordChatExporter"
pkgbase="discord-chat-exporter"
pkgname=(
  "${pkgbase}-core"
  "${pkgbase}-cli"
  "${pkgbase}-gui"
)
pkgver=2.47.1
pkgrel=4
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
  "${pkgbase}-gui.sh"
)
b2sums=('4ddd4d88bbf17a4d3f1b634456696984d8b92d4cc4d82c3c0ee99cc3b10352cd46da3d4e816e185216ec446ab883caf5debc74ee58e71bef1e3385438216bd99'
        'f8a33018574ef29bfe740a6852cabfc56b97e2004dae02bd9a24be89d75515b9540a4edbe8cf34a8a2770089145c2e6841a80f47f6844a6c0a82ce2e0223f0f6')

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
  sed -e '/TreatWarningsAsErrors/d' \
      -i 'Directory.Build.props'

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
    'sh'
  )

  cd "${srcdir}"
  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgbase}"
  cp -vaT --no-preserve=ownership "build-gui" "${pkgdir}/usr/lib/${pkgbase}"
  # ln -vsf "/usr/lib/${pkgbase}/${_Name}" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
