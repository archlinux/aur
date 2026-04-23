# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=10.0
_Name="YoutubeDownloader"
pkgname="${_Name,,}"
pkgver=1.16.4
pkgrel=1
pkgdesc="Downloads videos and playlists from YouTube"
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
  'ffmpeg'
  'sh'
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
  "${pkgname}.sh"
)
b2sums=('4b6f0261614d6a85b8e24d032965b37bdea59b9ae38f54e950bd600b8a65748031ab7ab72721bcf880d7043bc5fc702c5a1788d27aa250e597fa1085f959ebd3'
        '1790bd5de94e0c11027d516385f2a824a43aa6285f04a8256b320dc0d33437efd6f87ec3217e921f4c02257924978c7097e525a5fa936c2a2040f3a6eff5784a')

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
    # --verbosity normal
  )

  cd "${srcdir}/${_pkgsrc}"
  find . -type f -name '*.csproj' -exec \
    sed -e '/CSharpier/d' \
        -e 's|<DownloadFFmpeg>true|<DownloadFFmpeg>false|g' \
        -i "{}" +

  dotnet restore "${dotnet_restore_options[@]}" ./"${_Name}"
}

build() {
  _source
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
  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/lib/${pkgname}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}/usr/lib/${pkgname}"

  install -vDm644 "Readme.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -vDm644 "favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
