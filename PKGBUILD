# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-5.0-bin
pkgname=(
  'aspnet-runtime-5.0-bin'
  'dotnet-runtime-5.0-bin'
  'dotnet-sdk-5.0-bin'
  'dotnet-targeting-pack-5.0-bin'
  'aspnet-targeting-pack-5.0-bin'
 )
pkgver=5.0.16.sdk407
_runtimever=5.0.16
_sdkver=5.0.407
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/17588888-bd97-41e6-a1ef-9f1da6b8bdf6/ab16a7b0b82297f76abc793b5d187952/dotnet-sdk-5.0.407-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/8be77687-0931-40e4-8e50-b1b4cb367277/eef06721da36a9395dbaf8cb879ba820/dotnet-sdk-5.0.407-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/06628342-344d-4524-ba62-e4762c0322f2/49fc2867cf4cfde29c721ff3b03cdf1b/dotnet-sdk-5.0.407-linux-x64.tar.gz')
sha512sums_armv7h=('37db60df90f9f43a5399c1b7929c545e3815d7a91fdea82c96a136dcef993b0f8c67568759ae24321dee818fd1501cea8e541a159e10ed1a08fa96dddf2ffb9e')
sha512sums_aarch64=('500428a6a99d3825400be5cc1a723283f21a98c15ef68914e9252fc872b625fd10c220afd9787b7db6b226a04e83d30658234d464ccdf838639920d1768025e0')
sha512sums_x86_64=('b45f1bf086bfb5e0701c5e14534524ffc87d0195358ac4fa2cf36dac74537ca4c21c7177cfbfa7e121e77aa4106bb1e7039c9739ad73b942e2437bc5e39e6dce')

package_dotnet-runtime-5.0-bin() {
  pkgdesc='The .NET Core runtime version 5.0 (binary)'
  depends=("dotnet-host>=${_runtimever}"
           'glibc'
           'icu' 
           'krb5'
           'libcurl.so'
           'libunwind'
           'openssl'
           'zlib'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-5.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-5.0-bin
}

package_aspnet-runtime-5.0-bin() {
  pkgdesc='The ASP.NET Core runtime version 5.0 (binary)'
  depends=('dotnet-runtime-5.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-5.0")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-5.0-bin
}

package_dotnet-sdk-5.0-bin() {
  pkgdesc='The .NET Core SDK version 5.0 (binary)'
  depends=(
    'dotnet-runtime-5.0-bin'
    'glibc'
    'dotnet-targeting-pack-5.0-bin'
    'netstandard-targeting-pack-bin')
  optdepends=('aspnet-targeting-pack-5.0-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk-5.0-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-5.0")
  conflicts=("dotnet-sdk-5.0-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-5.0-bin
}

package_dotnet-targeting-pack-5.0-bin() {
  pkgdesc='The .NET Core targeting pack version 5.0 (binary)'
  depends=(netstandard-targeting-pack-bin)
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-5.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-5.0)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-5.0-bin
}

package_aspnet-targeting-pack-5.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack version 5.0 (binary)'
  depends=(dotnet-targeting-pack-5.0-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-5.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-5.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-5.0-bin
}