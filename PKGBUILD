# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# armv7h and aarch64 Comaintainers needed

pkgbase=dotnet-core-8.0-bin
pkgname=(
  'aspnet-runtime-8.0-bin'
  'dotnet-runtime-8.0-bin'
  'dotnet-sdk-8.0-bin'
  'dotnet-targeting-pack-8.0-bin'
  'aspnet-targeting-pack-8.0-bin'
 )
pkgver=8.0.32.sdk426
_runtimever=8.0.32
_sdkver=8.0.426
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm.tar.gz")
source_aarch64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm64.tar.gz")
source_x86_64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-x64.tar.gz")
sha512sums_armv7h=('d248edd143352b4126039ce6d75a08f41316b0f86fe397a910e3bfaafb3f07b160e266180b06c3b9d93048c3f8bc8b63a7ca644a638ff7d47292b59ab754dbc5')
sha512sums_aarch64=('8a49694501bb67f35be0d345fec4ec660b7e311e6d31cde48e2699cc94cbd901d71dc5aef61a42bc35883e0175883cc2599f7f6ff4af3525381b7d7b8342bef5')
sha512sums_x86_64=('8141d01bdc53f604aed3bb661b604707a64209f8a947cd81bf95b4f518951593d77864069191f54ea5e84362a409da6b0f69074bf893b283d7e0cf93e2bf20a8')

package_dotnet-runtime-8.0-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=(
  	"dotnet-host>=${_runtimever}"
    'libgcc'
    'libstdc++'
    'glibc'
    'icu'
    'libunwind'
    'zlib'
    'openssl'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-8.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-8.0-bin
}

package_aspnet-runtime-8.0-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-8.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-8.0")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-8.0-bin
}

package_dotnet-sdk-8.0-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'dotnet-runtime-8.0-bin'
    'dotnet-targeting-pack-8.0-bin'
    'netstandard-targeting-pack')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-8.0")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-8.0-bin
}

package_dotnet-targeting-pack-8.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-8.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-8.0)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-8.0-bin
}

package_aspnet-targeting-pack-8.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack (binary)'
  depends=(
    'dotnet-targeting-pack-8.0-bin'
  )
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-8.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-8.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-8.0-bin
}
