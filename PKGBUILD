# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgver=9.0.11.sdk307
_runtimever="${pkgver%.sdk*}"
_dotnetver="${_runtimever%.*}"
_sdkver="${_dotnetver}.${pkgver##"${_runtimever}.sdk"}"
_netstandardver=2.1
pkgrel=4

if   [ "${CARCH}" = 'aarch64' ]; then _arch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _arch=arm;
elif [ "${CARCH}" = 'x86_64'  ]; then _arch=x64;
else _arch=DUMMY;
fi

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
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://dotnet.microsoft.com"
license=(
  'MIT'
)
options=(
  'staticlibs'
)
source_aarch64=(
  "https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm64.tar.gz"
)
source_armv7h=(
  "https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm.tar.gz"
)
source_x86_64=(
  "https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-x64.tar.gz"
)
# curl -s "https://builds.dotnet.microsoft.com/dotnet/release-metadata/${_dotnetver}/releases.json" |
#   jq -r --arg runtime "$_runtimever" --arg sdk "$_sdkver" --arg arch "$_arch" '
#     .releases[]
#     | select(.sdk["runtime-version"]==$runtime and .sdk["version-display"]==$sdk)
#     | .sdk.files[]
#     | select(.rid == ("linux-" + $arch))
#     | .hash
#   '
sha512sums_aarch64=('46bfb0bd3e8124f0fabdd234bcf20383a86459d55f3d3d73178a0bce288b40b82c5dfd172586be447520e211fdcfda86902cb106b5ecc4d315234d9c8f8bcb70')
sha512sums_armv7h=('cdd6bc1bddee4faf1507e13d6db3e4e93acb05fe2b9fb7a1f6e5ce4eecf63b29533305933ed50386e87945fdd4c9baf6291df63a31af8bd99b69d22cfbeb8909')
sha512sums_x86_64=('fcc178ac0026cfea1eb37320fb25ffd32e6bc2b1d48c091f6085b88a15f24080dae2a332343c51ca2421f613d5f7abde898346589f4959f1e51d619c2247d216')

# pkgver() {
#   cd "${srcdir}"
#   local _runtimever_new="$(ls "templates" | sort -V | tail -n1)"
#   local _sdkver_new="$(ls "sdk" | sort -V | tail -n1)"
#   printf '%s.sdk%s' "${_runtimever_new}" "${_sdkver_new##*.}"
# }

package_dotnet-runtime-9.0-bin() {
  pkgdesc="The .NET Core runtime"
  depends=(
    # "dotnet-host>=${pkgver}"
    "dotnet-host"
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
    "${pkgname//aspnet/dotnet}=${pkgver}"
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
    "netstandard-targeting-pack-${_netstandardver}"
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
    "packs/Microsoft.NETCore.App.Host.linux-${_arch}/${_runtimever}" \
    "packs/Microsoft.NETCore.App.Ref/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}

package_aspnet-targeting-pack-9.0-bin() {
  pkgdesc="The ASP.NET Core targeting pack"
  depends=(
    "${pkgname//aspnet/dotnet}=${pkgver}"
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
    "${pkgname//sdk/runtime}=${pkgver}"
    "${pkgname//sdk/targeting-pack}=${pkgver}"
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
