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
pkgver=11.0.0.sdk100
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
sha512sums_aarch64=('cfa248bb1377606e868602fb5b4d66fa16b7546156593937d1982f7f2142e6ded76d71c4a26efdab99f87c46ab40c3c672ab1b57ef7fa25449efe5b140a55af4')
sha512sums_x86_64=('1bec9cca2ec689b1e80245b84f2b53c9441d1aa6daccf2ceb27490768bffa95954fa585bd275def31069d874d543d9ba9e6591fe9ade2dbd9f34ec5c0fd0050c')
sha512sums_armv7h=('2830e5cccf152a2b2a726580f1d99799b01ba413798f362eecaea1cd0a10535da6f5a68b3477db8972564e63f7fad350bb940ba345041fd037e9a6e0e0f94351')

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
