# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="DiscordChatExporter"
pkgbase="discord-chat-exporter"
pkgname=("${pkgbase}-"{core,cli,gui})
pkgver=2.46
pkgrel=2
pkgdesc="Exports Discord chat logs to a file"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Tyrrrz/${_Name}"
license=('MIT')
depends=("dotnet-runtime-${_sdk}")
makedepends=("dotnet-sdk-${_sdk}" 'gendesk')
options=('!strip' '!debug' 'staticlibs')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgbase}_xdg_settings.patch")
b2sums=('2486cd227c0cb9987427cb547601ee7e94323a695155478f91c682b3303e016fff01a4f50616fef7f9f3bab265d8674f6515c1a96b35dae46cd66195cccfb573'
        'ec3740a7c60b0f5fc2773e991e6cde9b4116d77d50094b237e118f456d9273c18a8e3bc2da2ff8a86eb35fa7df4f81c94759467b415f53e4794fb7a4e0929a91')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

_srcenv() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
}

prepare() {
  _srcenv
  local dotnet_restore_options=(
    --runtime "linux-${_msarch}"
    --locked-mode
    --verbosity normal
  )

  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_xdg_settings.patch"

  for dir in "${_Name}".{Core,Cli,Gui}; do
    dotnet restore "${dir}" "${dotnet_restore_options[@]}"
  done
}

build() {
  _srcenv
  local dotnet_publish_options=(
    --framework "net${_sdk}"
    --configuration Release
    --runtime "linux-${_msarch}"
    --no-self-contained
    --no-restore
    # --output build
    -p:Version="${pkgver%%.[A-Za-z]*}"
    -p:PublishTrimmed=false
    -p:PublishMacOSBundle=false
  )

  cd "${srcdir}"
  gendesk -f -n \
    --name "Discord Chat Exporter" \
    --exec "${pkgbase}-gui" \
    --icon "${pkgbase}" \
    --comment "${pkgdesc}" \
    --categories "Utility" \
    "${pkgbase}-gui"

  cd "${_pkgsrc}"
  dotnet publish "${dotnet_publish_options[@]}" --output build-core "${_Name}.Core"

  mkdir -p build-{cli,gui}
  cp -a build-core/* build-cli/
  cp -a build-core/* build-gui/

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
  cp -vaP build-core/* "${pkgdir}/usr/lib/${pkgbase}/"

  install -vDm644 "Readme.md"   "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  install -vDm644 "favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_discord-chat-exporter-cli() {
  pkgdesc+=" - CLI"
  depends+=("${pkgbase}-core=${pkgver}-${pkgrel}")

  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgbase}"
  cp -vaP build-cli/* "${pkgdir}/usr/lib/${pkgbase}/"
  ln -vsf "/usr/lib/${pkgbase}/${_Name}.Cli" "${pkgdir}/usr/bin/${pkgname}"
}

package_discord-chat-exporter-gui() {
  pkgdesc+=" - GUI"
  depends+=("${pkgbase}-core=${pkgver}-${pkgrel}")

  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgbase}"
  cp -vaP build-gui/* "${pkgdir}/usr/lib/${pkgbase}/"
  ln -vsf "/usr/lib/${pkgbase}/${_Name}" "${pkgdir}/usr/bin/${pkgname}"
}
