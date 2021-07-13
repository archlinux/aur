# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-3.1
pkgname=(
  'aspnet-runtime-3.1-bin'
  'dotnet-runtime-3.1-bin'
  'dotnet-sdk-3.1-bin'
  'dotnet-targeting-pack-3.1-bin'
  'aspnet-targeting-pack-3.1-bin'
 )
pkgver=3.1.17.sdk411
_runtimever=3.1.17
_sdkver=3.1.411
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/c36515e8-b5eb-4501-bfda-555c16938673/4faa9e8f1e1f84f020e85ab3dbd4c306/dotnet-sdk-3.1.411-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/3dc91205-b4b2-4b90-bd5d-899b85c79454/6831ad89fe379c5ed01dbd362cbd4cac/dotnet-sdk-3.1.411-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/c7afc344-acf0-4a6c-8e53-4455f2bcfc85/321418f6300e475f6c5d52849efa2e2e/dotnet-sdk-3.1.411-linux-x64.tar.gz')
sha512sums_armv7h=('a684155eb088e280ea4e8612e06b3ccd3d00a58ecd84d0971ee96ac0ec80c1d7333acf929590a886be5759eec33890bfd126152f740657fb9bbea09e9f96e97a')
sha512sums_aarch64=('c9b03b858e6063fc200a103930fb5a3b03ae35b89b884bb461bad36ce34f14fa84c4e98edc7082bcf5b132fbd31d8d58192e62ae055e757d064ed98e4ec5c600')
sha512sums_x86_64=('4117763444028519865f11f3c1f7e951245b06e93f30429fc97089f31ef0ce63777ebfa83b3c729b8c5ec9b2562a0f23036e69b3a5766ff999106e2068b55950')

package_dotnet-runtime-3.1-bin() {
  pkgdesc='The .NET Core runtime 3.1 (binary)'
  depends=('dotnet-host'
           'glibc'
           'icu' 
           'krb5'
           'libcurl.so'
           'libunwind'
           'openssl'
           'zlib'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/dotnet-runtime-3.1
}

package_aspnet-runtime-3.1-bin() {
  pkgdesc='The ASP.NET Core runtime 3.1 (binary)'
  depends=('dotnet-runtime-3.1')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-3.1
}

package_dotnet-sdk-3.1-bin() {
  pkgdesc='The .NET Core SDK 3.1 (binary)'
  depends=(
    'dotnet-runtime-3.1'
    'glibc'
    'dotnet-targeting-pack-3.1'
    'netstandard-targeting-pack-2.1')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/dotnet-sdk-3.1
}

package_dotnet-targeting-pack-3.1-bin() {
  pkgdesc='The .NET Core targeting pack 3.1 (binary)'
  depends=(netstandard-targeting-pack-2.1)
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-3.1)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-3.1)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-3.1
}

package_aspnet-targeting-pack-3.1-bin() {
  pkgdesc='The ASP.NET Core targeting pack 3.1 (binary)'
  depends=(dotnet-targeting-pack-3.1)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-3.1)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-3.1)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-3.1
}