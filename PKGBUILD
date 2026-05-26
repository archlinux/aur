# Maintainer: MojArch

_sdk=10.0
_Name="Ps3DiscDumper"
pkgname="ps3-disc-dumper"
pkgver=4.5.1
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
b2sums=('fc051c4c9f955c351f2367dec8b1f678cfc76eab164c5c03703835d52225795a72ebc99ceec911a56a4ef7cd9cefd656dfd99cf978a9dc14c94c137af7f4cca4')


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
