# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-3.1
pkgname=(
  'aspnet-runtime-3.1-bin'
  'dotnet-runtime-3.1-bin'
  'dotnet-sdk-3.1-bin'
  'dotnet-targeting-pack-3.1-bin'
  'aspnet-targeting-pack-3.1-bin'
 )
pkgver=3.1.16.sdk410
_runtimever=3.1.16
_sdkver=3.1.410
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/9f93cdf3-2f04-461b-8c42-dbd84b624878/e69a16b86c90ddaa52775673bde765f4/dotnet-sdk-3.1.410-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/0d0ad29d-da90-42ce-a88d-94f47f9ddc09/bbfafc31b9a7e36140a74e0e157e9e3e/dotnet-sdk-3.1.410-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/e6ae53a9-8567-4f44-b6ce-684d4f4a0b27/e0c29635c1c2ae9424390a41fecc95f1/dotnet-sdk-3.1.410-linux-x64.tar.gz')
sha512sums_armv7h=('139c9b41a89af44bef74de27df31d4bf50e56e5edd2d76e501bcaab7fc39764c1d74ef142fdd4f077a21c84b550b65038a642a4c65bbe65c0e38c6ce7fb7ac25')
sha512sums_aarch64=('58400007d55b122becb229a45d0fa8676890e16e818e229a9b6f5684e6d9133a22e4cb144f3a1af351c01fe9cc70056d43ab8164dca2b841cbdfae96fd7b02db')
sha512sums_x86_64=('aef9340008c2002b73171f186a6a167edf3494b740286927fc86f908eca20f5df13289f88ba2a1ef2011c93542d8aefec11d919ed191fb449dcf1b22e0cd74bc')

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