# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgver=9.0.18.sdk316
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
sha512sums_aarch64=('408324fd4ee828cafa17926e33c12cc48460699b58a8322c8a1891ef81eddec0c72df12fa7afa86f5e22fa26bc3750c0fb60481bd167e4b808d5cfb951df0638')
sha512sums_x86_64=('5a8558afd648c14a835e00ae08fa556083f50e3ada164d3e73293fcd4850b0519a27c11f2dae95a9bbe4af432be33bf14451ef11ba69527e34f9cf3077a1c2b5')
sha512sums_armv7h=('c86ab03d2acdf49bd701c1c021a3132e16c9cbe72ed45e84e62a440d2c053f34bd76d645dcee314bf3e8129a28ae5bba58474fc278a940eb7769aa43ffb2d22a')

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
