# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="YoutubeDownloader"
pkgname="${_Name,,}"
pkgver=1.15.1
pkgrel=1
pkgdesc="Downloads videos and playlists from YouTube"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Tyrrrz/${_Name}"
license=('MIT')
depends=(
  "dotnet-runtime-${_sdk}"
  'ffmpeg'
)
makedepends=(
  "dotnet-sdk-${_sdk}"
  'gendesk'
)
options=('!strip' '!debug')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}_xdg_settings.patch")
b2sums=('899e7f4824c135b467a940dcf87e2151e837de0f8a70d04a0ec8cbffa7fb3fe8f7ec6b144713aaf3077c6b4259aa408430d60bca6da2310713d953c20a023126'
        '422e82520465e646ddc1a0f2d0dbd0c624141df292a5e6a5ebd4cee9c4025769ae518e8c373d35632ee804148b68de109232d64ebd33c455eb81d6dbf3663817')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
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
    # --verbosity normal
  )

  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_xdg_settings.patch"

  find . -type f -name '*.csproj' -exec \
    sed -e '/CSharpier/d' \
        -e 's|<DownloadFFmpeg>true|<DownloadFFmpeg>false|g' \
        -i "{}" +

  dotnet restore "${dotnet_restore_options[@]}" ./"${_Name}"
}

build() {
  _srcenv
    local dotnet_publish_options=(
    --configuration Release
    --framework "net${_sdk}"
    --no-restore
    --output build
    --no-self-contained
    --runtime "linux-${_msarch}"
    # --verbosity detailed
    -p:DebugType=None
    -p:DebugSymbols=false
    -p:Version="${pkgver%%.[A-Za-z]*}"
    -p:CSharpier_Bypass=true
    -p:PublishMacOSBundle=false
  )

  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "Youtube Downloader" \
    --exec "${_Name}" \
    --categories "AudioVideo;Network;Utility"

  cd "${_pkgsrc}"
  dotnet publish "${dotnet_publish_options[@]}" ./"${_Name}"
  dotnet build-server shutdown
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}/usr/lib/${pkgname}"
  ln -vsf "/usr/lib/${pkgname}/${_Name}" "${pkgdir}/usr/bin/${_Name}"

  install -vDm644 "Readme.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -vDm644 "favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
