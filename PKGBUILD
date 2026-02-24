# Maintainer: MojArch

_sdk=10.0
_Name="Ps3DiscDumper"
pkgname="ps3-disc-dumper"
pkgver=4.4.2
pkgrel=1
pkgdesc="A handy utility to make decrypted PS3 disc dumps"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/13xforever/${pkgname}"
license=('MIT')
depends=("dotnet-runtime-${_sdk}" 'xdg-utils')
makedepends=("dotnet-sdk-${_sdk}" 'gendesk')
options=('!strip' '!debug' 'staticlibs')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('994a9692d7f24e3cd567a48670fec6252ae645fa02b381402409e32b37442e5ec40b21c0007ccbef3532722870a618ae59704e3e7d33df5e93c759d5803c2c0a')

if   [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
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
  find . -type f -name '*.csproj' -exec \
    sed -e '/PublishSingleFile/d' \
        -e '/IncludeNativeLibrariesForSelfExtract/d' \
        -i "{}" +

  for dir in IrdLibraryClient "${_Name}" UI.Avalonia; do
    dotnet restore "${dir}" "${dotnet_restore_options[@]}"
  done
}

build() {
  _srcenv
  local dotnet_publish_options=(
    --framework "net${_sdk}"
    --configuration Linux
    --runtime "linux-${_msarch}"
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
  cp -vaP build/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "UI.Avalonia/Assets"
  install -vDm644 "icon.svg"  "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
}
