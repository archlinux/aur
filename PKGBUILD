# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgver=9.0.13.sdk311
_runtimever="${pkgver%.sdk*}"
_dotnetver="${_runtimever%.*}"
_sdkver="${_dotnetver}.${pkgver##"${_runtimever}.sdk"}"
pkgrel=1

declare -Ag _arch=(
  ['aarch64']='arm64'
  ['armv7h']='arm'
  ['x86_64']='x64'
)

_pkgbase="dotnet-core-${_dotnetver}"
_pkgname=(
  "dotnet-runtime-${_dotnetver}"
  "aspnet-runtime-${_dotnetver}"
  "dotnet-targeting-pack-${_dotnetver}"
  "aspnet-targeting-pack-${_dotnetver}"
  "dotnet-sdk-${_dotnetver}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
arch=(
  "${!_arch[@]}"
)
url="https://dotnet.microsoft.com"
license=(
  'MIT'
)
options=(
  'staticlibs'
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  'https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-${_arch[${_carch}]}.tar.gz'
)"
done
# curl -s "https://builds.dotnet.microsoft.com/dotnet/release-metadata/${_dotnetver}/releases.json" |
#   jq -r --arg runtime "$_runtimever" --arg sdk "$_sdkver" --arg arch "${_arch[${CARCH}]}" '
#     .releases[]
#     | select(.sdk["runtime-version"]==$runtime and .sdk["version-display"]==$sdk)
#     | .sdk.files[]
#     | select(.rid == ("linux-" + $arch))
#     | .hash
#   '
sha512sums_aarch64=('58ce76d1cce856eb64a284b3b4a4d1675578be0d6ece4c54987c5531f3ade7096084d9d85ca1af2ee28361918e8dba24f230fecce9145a4ea67ecfb66e436d3c')
sha512sums_x86_64=('ef6239f4b56a08bfd1eda82f877b9350d8b98d248a693c1ec4af85a2f09db19556f7cc4d4b2d3a8ff0cf9e0fcaebb3ec8daabe1774aff346740aacf4bb1e136f')
sha512sums_armv7h=('80eb02ca92b200e9f801c7a344bd9de9abb262cb71332e406671edcdc7a9dd81fa97d629ba0db2d11f3a72d3fbb6da719ee330811feef611b9386df34a48957b')

# pkgver() {
#   cd "${srcdir}"
#   local _runtimever_new="$(ls "templates" | sort -V | tail -n1)"
#   local _sdkver_new="$(ls "sdk" | sort -V | tail -n1)"
#   printf '%s.sdk%s' "${_runtimever_new}" "${_sdkver_new##*.}"
# }

package_dotnet-runtime-9.0-bin() {
  pkgdesc="The .NET Core runtime"
  depends=(
    "dotnet-host>=${pkgver}"
    'gcc-libs'
    'glibc'
    'icu'
    'krb5'
    'libunwind'
    'openssl'
    'zlib'
  )
  optdepends=(
    'lttng-ust2.12: CoreCLR tracing'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "shared/Microsoft.NETCore.App/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}

package_aspnet-runtime-9.0-bin() {
  pkgdesc="The ASP.NET Core runtime"
  depends=(
    "${pkgname//aspnet/dotnet}>=${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "shared/Microsoft.AspNetCore.App/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}

package_dotnet-targeting-pack-9.0-bin() {
  pkgdesc="The .NET Core targeting pack"
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "packs/Microsoft.NETCore.App.Host.linux-${_arch[${CARCH}]}/${_runtimever}" \
    "packs/Microsoft.NETCore.App.Ref/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}

package_aspnet-targeting-pack-9.0-bin() {
  pkgdesc="The ASP.NET Core targeting pack"
  depends=(
    "${pkgname//aspnet/dotnet}>=${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "packs/Microsoft.AspNetCore.App.Ref/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}

package_dotnet-sdk-9.0-bin() {
  pkgdesc="The .NET Core SDK"
  depends=(
    "${pkgname//sdk/runtime}>=${pkgver}-${pkgrel}"
    "${pkgname//sdk/targeting-pack}>=${pkgver}-${pkgrel}"
  )
  optdepends=(
    "aspnet-targeting-pack-${_dotnetver}-bin: Build ASP.NET Core applications"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "sdk/${_sdkver}" \
    "sdk-manifests" \
    "templates/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
