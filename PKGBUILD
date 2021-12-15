# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-5.0-bin
pkgname=(
  'aspnet-runtime-5.0-bin'
  'dotnet-runtime-5.0-bin'
  'dotnet-sdk-5.0-bin'
  'dotnet-targeting-pack-5.0-bin'
  'aspnet-targeting-pack-5.0-bin'
 )
pkgver=5.0.13.sdk404
_runtimever=5.0.13
_sdkver=5.0.404
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/bbc6105c-07b4-4cda-b438-91afa4e4f2f3/61411defdb5fff3736a9263718bca37b/dotnet-sdk-5.0.404-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/21bf6b86-84a9-4cc4-9713-c812c18b1504/8ef52712e25b5075b91dd51b85ae170d/dotnet-sdk-5.0.404-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/2c1eb8c8-ac05-4dc7-9bef-307b3e450e9d/75e85b3d1662f60afd69572fd5df6884/dotnet-sdk-5.0.404-linux-x64.tar.gz')
sha512sums_armv7h=('39e56d5966edfbb8e4e343c3bc97f71e809713f61d12afb0a6901a1dff6e29df8de0288c99246c638bb76582cd9523b529dacd981c37c2365e4d724738950851')
sha512sums_aarch64=('d35abcfacb3da88eed82f9f7a0a9d3f8680d4c85839c8b348c247ddc9b3b99e7a3417d406976e3ac91d8d4bd31e0efb685ebaf4c33bb59586d00cdc731b59893')
sha512sums_x86_64=('6f9b83b2b661ce3b033a04d4c50ff3a435efa288de1a48f58be1150e64c5dd9d6bd2a4bf40f697dcd7d64ffaac24f14cc4a874e738544c5d0e8113c474fd2ee0')

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