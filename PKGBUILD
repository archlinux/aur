# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_suffix="-rc"
pkgbase="dotnet-core${_suffix}-bin"
pkgname=(
  "dotnet-host${_suffix}-bin"
  "dotnet-runtime${_suffix}-bin"
  "aspnet-runtime${_suffix}-bin"
  "dotnet-targeting-pack${_suffix}-bin"
  "aspnet-targeting-pack${_suffix}-bin"
  "dotnet-sdk${_suffix}-bin"
)
pkgver=10.0.7.sdk203
_runtimever="$(sed -E 's/\.sdk[0-9]+([A-Za-z]+)/-\1./g; s/\.sdk.*//' <<< "${pkgver}")"
_dotnetver="$(cut -d. -f1,2 <<< "${_runtimever%%-*}")"
_sdkver="$(sed -E 's/([0-9]+)\.sdk([0-9]+)([A-Za-z]+)/\2-\3./g; s/[0-9]+\.sdk//g' <<< "${pkgver}")"
pkgrel=1
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
source=(
  "dotnet.sh"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  'https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-${_arch[${_carch}]}.tar.gz'
)"
done
sha512sums=('768151c7179fb6a126b3de9cae01e363e8894f6fab384b1e2c5066c2adca4578638983b1b62aea10dd18045e6d6e8f8ea13280481134de94f004a118919b2c06')
sha512sums_aarch64=('7fbc8e8b20b6d6cb40269544ea4b5e919dd7fc7b066b429f32e7fa9087224f17445b90c7807c46745cc42f299dd7ef65abd023bec03fc341ce07a5bb52a59218')
sha512sums_x86_64=('fdc36a27285b6f39b625814454f4dd3e76f2259c1279d0317d7fa297514bba607de323290d42caf67f62b9081ab26b6edb079e00f2b8c709c5826d3349a451d9')
sha512sums_armv7h=('93c792edaf740018ba5605b9ae2167f01fe63982510b5e438072f63fa214aee95a3fc633cf028a7cc20ab0b60119dacafeeec28e616921766b56f88e218a6b06')

package_dotnet-host-rc-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface'
  depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'sh'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%${_suffix}*}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}*}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses/dotnet-host" \
              "${pkgdir}/usr/bin" \
              "${pkgdir}/usr/lib"

  cd "${srcdir}"
  install -vDm644 "dotnet.sh" "${pkgdir}/etc/profile.d/dotnet.sh"

  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "host/fxr/${_runtimever}" \
    "dotnet" \
    "dnx"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/licenses/dotnet-host" \
    "LICENSE.txt" \
    "ThirdPartyNotices.txt"

  ln -vsf "/usr/share/dotnet/dotnet" "${pkgdir}/usr/bin/dotnet"
  ln -vsf "/usr/share/dotnet/dnx" "${pkgdir}/usr/bin/dnx"
  ln -vsf "/usr/share/dotnet/host/fxr/${_runtimever}/libhostfxr.so" "${pkgdir}/usr/lib/libhostfxr.so"
}

package_dotnet-runtime-rc-bin() {
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
    "${pkgname%${_suffix}*}-${_dotnetver}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}*}-${_dotnetver}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "shared/Microsoft.NETCore.App/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}*}-${_dotnetver}"
}

package_aspnet-runtime-rc-bin() {
  pkgdesc="The ASP.NET Core runtime"
  depends=(
    "${pkgname//aspnet/dotnet}>=${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%${_suffix}*}-${_dotnetver}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}*}-${_dotnetver}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "shared/Microsoft.AspNetCore.App/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}*}-${_dotnetver}"
}

package_dotnet-targeting-pack-rc-bin() {
  pkgdesc="The .NET Core targeting pack"
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%${_suffix}*}-${_dotnetver}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}*}-${_dotnetver}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "packs/Microsoft.NETCore.App.Host.linux-${_arch[${CARCH}]}/${_runtimever}" \
    "packs/Microsoft.NETCore.App.Ref/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}*}-${_dotnetver}"
}

package_aspnet-targeting-pack-rc-bin() {
  pkgdesc="The ASP.NET Core targeting pack"
  depends=(
    "${pkgname//aspnet/dotnet}>=${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%${_suffix}*}-${_dotnetver}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}*}-${_dotnetver}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "packs/Microsoft.AspNetCore.App.Ref/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}*}-${_dotnetver}"
}

package_dotnet-sdk-rc-bin() {
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
    "${pkgname%${_suffix}*}-${_dotnetver}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}*}-${_dotnetver}"
  )

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "sdk/${_sdkver}" \
    "sdk-manifests" \
    "templates/${_runtimever}"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}*}-${_dotnetver}"
}
