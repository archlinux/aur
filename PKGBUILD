# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgver=9.0.15.sdk313
_runtimever="${pkgver%.sdk*}"
_dotnetver="${_runtimever%.*}"
_sdkver="${_dotnetver}.${pkgver##"${_runtimever}.sdk"}"
pkgrel=2

pkgbase="dotnet-core-${_dotnetver}-bin"
pkgname=(
  "dotnet-runtime-${_dotnetver}-bin"
  "aspnet-runtime-${_dotnetver}-bin"
  "dotnet-targeting-pack-${_dotnetver}-bin"
  "aspnet-targeting-pack-${_dotnetver}-bin"
  "dotnet-sdk-${_dotnetver}-bin"
)
declare -Ag _arch=(
  ['aarch64']='arm64'
  ['armv7h']='arm'
  ['x86_64']='x64'
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
sha512sums_aarch64=('0278c86bcc9c9da2a2be0f43dd34a8cde2d4b1f541ad101c30db44d44536388fa641c57a07a7ac829b7d403112760b172dc608880f3214208827bb3205c01a60')
sha512sums_x86_64=('cb2f09cc3e44be152e8f7abdfeb18040f6de5d8195bc723f584483775af169bfa5f17c03ce0cb64fa53bcc7d29eb7810684a3fa4cf6b228fa52ad132bf89bf62')
sha512sums_armv7h=('267d68b0943f93fcbac7b064d93a31efb35b0c4bec472a9a805ade537708af01f050b2c25506f6ecce51fd6e55e9a1fd78f7bbd0f3ea19d7b3caac1660620c79')

package_dotnet-runtime-9.0-bin() {
  pkgdesc="The .NET Core runtime"
  depends=(
    "dotnet-host>=${pkgver}"
    'glibc'
    'icu'
    'krb5'
    'libgcc'
    'libstdc++'
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
    "${pkgname//sdk/aspnet-targeting-pack}: Build ASP.NET Core applications"
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
