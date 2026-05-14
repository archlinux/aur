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
pkgver=8.0.27.sdk421
_runtimever=8.0.27
_sdkver=8.0.421
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm.tar.gz")
source_aarch64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm64.tar.gz")
source_x86_64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-x64.tar.gz")
sha512sums_armv7h=('25e75f393d63116ae15a47602c5b773e0ee6e1624b14144d9899c2fd1a7aa3613689e3262a6eec46789b67038d974f9e20b59a48649284e837e357377aee0ed5')
sha512sums_aarch64=('bcf74721953419d674829b5b368154ede19da2960413c2485c38e9c5878749c0551a2882d8979ba17d22b0587b1516a78f6f6568b48069544192701871de7f73')
sha512sums_x86_64=('3bee18a8706f169178a2609cce7d31a4ec3e21ae0758c2387b9a0756dbc267342b60cf00024c76fe91518e49617b241f8ebf1e52cb3fa5644da5966b76589b22')

package_dotnet-runtime-8.0-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=(
  	"dotnet-host>=${_runtimever}"
    'gcc-libs'
    'glibc'
    'icu'
    'libunwind'
    'zlib'
    'openssl'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-8.0")
  conflicts=("dotnet-runtime-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-8.0-bin
}

package_aspnet-runtime-8.0-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-8.0-bin')
  provides=("aspnet-runtime-8.0")
  conflicts=( "aspnet-runtime-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-8.0-bin
}

package_dotnet-sdk-8.0-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=(
    'glibc'
    'gcc-libs'
    'dotnet-runtime-8.0-bin'
    'dotnet-targeting-pack-8.0-bin'
    'netstandard-targeting-pack')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk-8.0")
  conflicts=("dotnet-sdk-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-8.0-bin
}

package_dotnet-targeting-pack-8.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(dotnet-targeting-pack-8.0)
  conflicts=(dotnet-targeting-pack-8.0)

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
  provides=(aspnet-targeting-pack-8.0)
  conflicts=(aspnet-targeting-pack-8.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-8.0-bin
}
