# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgver=9.0.11.sdk308
_runtimever="${pkgver%.sdk*}"
_dotnetver="${_runtimever%.*}"
_sdkver="${_dotnetver}.${pkgver##"${_runtimever}.sdk"}"
pkgrel=2

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
sha512sums_aarch64=('21fbdcdcb8762f3579ef2a8ac5d92cb0db960901f1c30d037fa1652238ef606bfc7bffa2e51fcc83f94f3c2c7d5bee5dcfed4b66baa455ae3d38681e264d23ff')
sha512sums_armv7h=('de250787bbe4f9fb38b76d1f0bed6b3b8d8ed51b3d289dba68f1a4963ccce92fe54e940f22d970fd2f5209f123113a11499a98710584d53bb5d214a0fb767929')
sha512sums_x86_64=('3aacff096524a1dae9bc035f71a6805fa7ec3430d395771fc1c85505165a78361ce2cc9c9c35433376e5c30aec37e2eb2e77de0a6ba7ddd7dc6053baf2c2709a')

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
