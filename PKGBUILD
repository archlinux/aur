# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="Ps3DiscDumper"
pkgname="ps3-disc-dumper"
pkgver=4.3.6
pkgrel=1
pkgdesc="A handy utility to make decrypted PS3 disc dumps"
arch=('x86_64')
url="https://github.com/13xforever/${pkgname}"
license=('MIT')
depends=("dotnet-runtime>=${_sdk}" 'xdg-utils')
makedepends=("dotnet-sdk>=${_sdk}" 'gendesk')
options=('!strip' '!debug' 'staticlibs')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a79ce33969a60cae727b41fd3bc969be78eb8244911e6c4ad978623f4763f8d8c28c27c9418dc4a40593d0ca613a9b16a63296b514a8c20ba333036b8e0b6de6')

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
  find . -type f -name '*.csproj' -exec \
    sed -e '/PublishSingleFile/d' \
        -e '/IncludeNativeLibrariesForSelfExtract/d' \
        -i "{}" +

  dotnet restore ./IrdLibraryClient "${dotnet_restore_options[@]}"
  dotnet restore ./"${_Name}" "${dotnet_restore_options[@]}"
  dotnet restore ./UI.Avalonia "${dotnet_restore_options[@]}"
}

build() {
  _srcenv
  local dotnet_publish_options=(
    --framework "net${_sdk}"
    --configuration Linux
    --runtime linux-x64
    --no-self-contained
    --no-restore
    --output build
    -p:Version="${pkgver%%.[A-Za-z]*}"
    # -p:PublishTrimmed=true
  )

  cd "${srcdir}"
  gendesk -f -n \
    --name "PS3 Disc Dumper" \
    --exec "${pkgname}" \
    --icon "${pkgname}" \
    --comment "${pkgdesc}" \
    --categories "Utility;DiscUtility" \
    "${pkgname}"

  cd "${_pkgsrc}"
  dotnet publish "${dotnet_publish_options[@]}" ./UI.Avalonia

  find "build" -type f \( -name '*.pdb' -o -name '*.config' \) -delete
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaP ./build/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "UI.Avalonia/Assets"
  install -vDm644 "icon.svg"  "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
}
