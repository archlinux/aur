# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="Ps3DiscDumper"
pkgname="ps3-disc-dumper"
pkgver=4.3.4
pkgrel=1
pkgdesc="A handy utility to make decrypted PS3 disc dumps"
arch=('x86_64')
url="https://github.com/13xforever/${pkgname}"
license=('MIT')
depends=("dotnet-runtime>=${_sdk}" 'xdg-utils')
makedepends=("dotnet-sdk>=${_sdk}" 'gendesk')
options=('!strip' '!debug' 'staticlibs')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "13xforever-DiscUtils-c4c8baf165a01831e080252a322d38c00f5b71c0.tar.gz::https://github.com/13xforever/DiscUtils/archive/c4c8baf165a01831e080252a322d38c00f5b71c0.tar.gz")
b2sums=('7dfd2b350e903353734eae7dbfc70146fde0f8cce55328c22d9186148e42d4bf41571637e3a6765bce29cb21c22bf02139996a50ab2f0b3ec6a72983041eb6a9'
        '3557bc9a07b5bb14565384510a21379971164cbd632130f597040fe80ff1b975ca2152fd2e5b3eef2e5d63b26a2492b3a56a468d32e490c2ef348ad63f070276')

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

  cd "${srcdir}"
  cp -R ./"DiscUtils-c4c8baf165a01831e080252a322d38c00f5b71c0"/* "${_pkgsrc}/DiscUtils"

  cd "${_pkgsrc}"
  find . -type f -name '*.csproj' -exec \
    sed -e '/PublishSingleFile/d' \
        -e '/IncludeNativeLibrariesForSelfExtract/d' \
        -i "{}" +

  dotnet restore ./DiscUtils "${dotnet_restore_options[@]}"
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
