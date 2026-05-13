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
pkgver=10.0.8.sdk300
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
sha512sums_aarch64=('b503fe0cac8f8748d1ae67af40bc9157456cc0f93c8264e3bc52cc52a12fbbbc3a16e905d8528214f29337d7349859bb08de99b1e1406da92723b071b3f45ce5')
sha512sums_x86_64=('a0c404c1a2f85d70e32392ce297eb388c0310c519521b538a031a895469444c67f347d4f9ca1f8441f525967a89c9b75e2cd1676da486f95118cf4025c38d904')
sha512sums_armv7h=('2411df6660a56029f9995aefa0b2bb66c5e4928227b62e9facfe8e232efea944c424fa300f6d5f05633eb2aa52a716b3176c42f9bc89f34f4d2a59fa4a80b8bc')

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
    "${pkgname//dotnet-sdk/aspnet-targeting-pack}: Build ASP.NET Core applications"
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
