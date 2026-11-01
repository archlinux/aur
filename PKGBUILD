# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgver=9.0.22.sdk320
_runtimever="${pkgver%.sdk*}"
_dotnetver="${_runtimever%.*}"
_sdkver="${_dotnetver}.${pkgver##"${_runtimever}.sdk"}"
pkgrel=1

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
)
noextract+=(
  \"\${source_${_carch}[@]##*/}\"
)"
done
sha512sums_aarch64=('88d78bf798432e9b92fe93cbffdad3ff3cc7b3e93b640c75ef46a2caa2d4d0b6dfdca002fcd007d4e95725f2e974ffbd99ae4e3a9d7999a57a667ab5d00ef0e8')
sha512sums_x86_64=('eb371100b5c40641a812b3683bfda1772f0b69e5232091293c715d49eb837f52174b9b9a93375d692bddbfd1d57005f1a9aa774b4b30276665b0c0b1a9b66427')
sha512sums_armv7h=('ef41396f393161cceb93acfb08b942556838b6213d6176b32428c3d8d00f0fd597bd5bacdefdaf01c9421fe18e8b0ba771a170b3af81ba6cb6b51e00e505bcbf')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.tar*}"
  bsdtar -xzf "${source_artifact}" -C "${source_artifact%.tar*}" --strip-components 1
}

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
    "${pkgname%-${_dotnetver}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
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
}

package_aspnet-runtime-9.0-bin() {
  pkgdesc="The ASP.NET Core runtime"
  depends=(
    "${pkgname//aspnet/dotnet}>=${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%-${_dotnetver}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
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
}

package_dotnet-targeting-pack-9.0-bin() {
  pkgdesc="The .NET Core targeting pack"
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%-${_dotnetver}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
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
}

package_aspnet-targeting-pack-9.0-bin() {
  pkgdesc="The ASP.NET Core targeting pack"
  depends=(
    "${pkgname//aspnet/dotnet}>=${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%-${_dotnetver}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
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
}

package_dotnet-sdk-9.0-bin() {
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
    "${pkgname%-${_dotnetver}-bin}=${_dotnetver}"
  )
  conflicts=(
    "${pkgname%-bin}"
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
}
