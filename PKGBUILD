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
pkgver=11.0.0.sdk100rc3.26522.148
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
)
noextract+=(
  \"\${source_${_carch}[@]##*/}\"
)"
done
sha512sums=('768151c7179fb6a126b3de9cae01e363e8894f6fab384b1e2c5066c2adca4578638983b1b62aea10dd18045e6d6e8f8ea13280481134de94f004a118919b2c06')
sha512sums_aarch64=('e8788cba187792a64bdc5493da4c29066070f3996b0d7899d4f4ace2f76f7f101217e88834522394aa00e306f1c9506faf74f5cd2379fbee314b00ac8f34bb5b')
sha512sums_x86_64=('77ef603622f0632ce59fc631871c9d0ec0c7402399837c659ead5b6fc7ea898f7f64a2632ecdc8d3330e608307416a36bff90a4d10179210489676167b9b80da')
sha512sums_armv7h=('804d1b33c4d9415ec1b50077efe7edba1911e8967795d344d43f7602f5cd3e4400ba8cb102c63bd2d9827ad27605649dac3bcc015e605526d8bbefc55bad737a')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.tar*}"
  bsdtar -xzf "${source_artifact}" -C "${source_artifact%.tar*}" --strip-components 1
}

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
    "${pkgname%${_suffix}-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%${_suffix}-bin}"
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses/dotnet-host" \
              "${pkgdir}/usr/bin" \
              "${pkgdir}/usr/lib"

  cd "${srcdir}"
  install -vDm644 "dotnet.sh" -t "${pkgdir}/etc/profile.d"
  cd "${source_artifact%.tar*}"

  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "host/fxr" \
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
    "${pkgname%${_suffix}-bin}-${_dotnetver}=${pkgver}"
    "${pkgname%${_suffix}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}"
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}/${source_artifact%.tar*}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "shared/Microsoft.NETCore.App"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}-bin}-${_dotnetver}"
}

package_aspnet-runtime-rc-bin() {
  pkgdesc="The ASP.NET Core runtime"
  depends=(
    "${pkgname//aspnet/dotnet}>=${epoch}:${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}=${pkgver}"
    "${pkgname%${_suffix}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}"
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}/${source_artifact%.tar*}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "shared/Microsoft.AspNetCore.App"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}-bin}-${_dotnetver}"
}

package_dotnet-targeting-pack-rc-bin() {
  pkgdesc="The .NET Core targeting pack"
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}=${pkgver}"
    "${pkgname%${_suffix}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}"
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}/${source_artifact%.tar*}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "packs/Microsoft.NETCore.App.Host.linux-${_arch[${CARCH}]}" \
    "packs/Microsoft.NETCore.App.Ref"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}-bin}-${_dotnetver}"
}

package_aspnet-targeting-pack-rc-bin() {
  pkgdesc="The ASP.NET Core targeting pack"
  depends=(
    "${pkgname//aspnet/dotnet}>=${epoch}:${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}=${pkgver}"
    "${pkgname%${_suffix}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}"
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}/${source_artifact%.tar*}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "packs/Microsoft.AspNetCore.App.Ref"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}-bin}-${_dotnetver}"
}

package_dotnet-sdk-rc-bin() {
  pkgdesc="The .NET Core SDK"
  depends=(
    "${pkgname//sdk/runtime}>=${epoch}:${pkgver}-${pkgrel}"
    "${pkgname//sdk/targeting-pack}>=${epoch}:${pkgver}-${pkgrel}"
  )
  optdepends=(
    "${pkgname//dotnet-sdk/aspnet-targeting-pack}: Build ASP.NET Core applications"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}=${pkgver}"
    "${pkgname%${_suffix}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${pkgname%${_suffix}-bin}-${_dotnetver}"
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  install -vd "${pkgdir}/usr/share/dotnet" \
              "${pkgdir}/usr/share/licenses"

  cd "${srcdir}/${source_artifact%.tar*}"
  cp -a --parents --no-preserve=ownership -t "${pkgdir}/usr/share/dotnet" \
    "sdk" \
    "sdk-manifests" \
    "templates"

  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -vsf "dotnet-host" "${pkgdir}/usr/share/licenses/${pkgname%${_suffix}-bin}-${_dotnetver}"
}
