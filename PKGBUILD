# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="YoutubeDownloader"
pkgname="${_Name,,}"
pkgver=1.14.2
pkgrel=1
pkgdesc="Downloads videos and playlists from YouTube"
arch=('x86_64')
url="https://github.com/Tyrrrz/${_Name}"
license=('MIT')
depends=("dotnet-runtime>=${_sdk}" 'ffmpeg')
makedepends=("dotnet-sdk>=${_sdk}" 'gendesk')
options=('!strip' '!debug' 'staticlibs')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}_xdg_settings.patch")
b2sums=('90fe7b0fb9357113325ce1755a67f5a949da457e32dcaeb4eee53f2521c39b9ce013610e299bb74411592ceb277e7afb5a1d66740e10340998177312dfc5d4e4'
        '2abd236b80032bd0cadd3f44b8e9071f7de848ed0f474663dec8b7fc7e2f7a25e5c9db2b8af04ec874d736a1159cc45ce6cf2c69f220c5b4d37fcbc7f903f170')

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
    -p:RuntimeIdentifiers=linux-x64
  )

  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_xdg_settings.patch"

  find . -type f -name '*.csproj' -exec \
    sed -i '/CSharpier/d' "{}" +

  dotnet restore ./"${_Name}" "${dotnet_restore_options[@]}"
}

build() {
  _srcenv
  local dotnet_publish_options=(
    --framework "net${_sdk}"
    --configuration Release
    --runtime linux-x64
    --no-self-contained
    --no-restore
    --output build
    -p:Version="${pkgver%%.[A-Za-z]*}"
    # -p:PublishTrimmed=true
    -p:CSharpier_Bypass=true
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
