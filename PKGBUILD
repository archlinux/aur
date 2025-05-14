# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="YoutubeDownloader"
pkgname="${_Name,,}"
pkgver=1.15
pkgrel=1
pkgdesc="Downloads videos and playlists from YouTube"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Tyrrrz/${_Name}"
license=('MIT')
depends=("dotnet-runtime>=${_sdk}" 'ffmpeg')
makedepends=("dotnet-sdk>=${_sdk}" 'gendesk')
options=('!strip' '!debug' 'staticlibs')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}_xdg_settings.patch")
b2sums=('7be51668d82d0c60f6bd7e54b2623083ba4e5a6684f2fdf18f8991c4a790facb2a94de65eebabd3f3520ee8dd99d6802bf3e9e8cbc696b14fdfe3102d4e8a165'
        '422e82520465e646ddc1a0f2d0dbd0c624141df292a5e6a5ebd4cee9c4025769ae518e8c373d35632ee804148b68de109232d64ebd33c455eb81d6dbf3663817')

if [ "${CARCH}" = 'x86_64' ]; then _msarch=x64;
elif [ "${CARCH}" = 'armv7h' ]; then _msarch=arm;
elif [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64; fi

_srcenv() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
}

prepare() {
  _srcenv
  local dotnet_restore_options=(
    -p:TargetFrameworks="net${_sdk}"
    -p:RuntimeIdentifiers="linux-${_msarch}" 
  )

  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_xdg_settings.patch"

  find . -type f -name '*.csproj' -exec \
    sed -e '/CSharpier/d' \
        -e 's|<DownloadFFmpeg>true|<DownloadFFmpeg>false|g' \
        -i "{}" +

  dotnet restore ./"${_Name}" "${dotnet_restore_options[@]}"
}

build() {
  _srcenv
  local dotnet_publish_options=(
    --framework "net${_sdk}"
    --runtime "linux-${_msarch}"
    --configuration Release
    --no-self-contained
    --no-restore
    --output build
    -p:Version="${pkgver%%.[A-Za-z]*}"
    # -p:PublishTrimmed=true
    -p:CSharpier_Bypass=true
    -p:PublishMacOSBundle=false
  )

  cd "${srcdir}"
  gendesk -f -n \
    --name "Youtube Downloader" \
    --exec "${_Name}" \
    --icon "${pkgname}" \
    --comment "${pkgdesc}" \
    --categories "AudioVideo;Network;Utility" \
    "${pkgname}"

  cd "${_pkgsrc}"
  dotnet publish "${dotnet_publish_options[@]}" ./"${_Name}"

  find "build" -type f \( -name '*.pdb' -o -name '*.config' \) -delete
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaP ./build/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/${_Name}" "${pkgdir}/usr/bin/${_Name}"

  install -vDm644 "Readme.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -vDm644 "favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
