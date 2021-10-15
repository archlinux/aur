# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-3.1
pkgname=(
  'aspnet-runtime-3.1-bin'
  'dotnet-runtime-3.1-bin'
  'dotnet-sdk-3.1-bin'
  'dotnet-targeting-pack-3.1-bin'
  'aspnet-targeting-pack-3.1-bin'
 )
pkgver=3.1.20.sdk414
_runtimever=3.1.20
_sdkver=3.1.414
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/cefd43b6-16ac-4435-bcc6-594ebb0441cf/7d064f0f61c4174f620eafe97484e6cb/dotnet-sdk-3.1.414-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/040f982b-bd08-496f-ae52-a60361a79546/7d572611a4177c48d868e0516ac192dc/dotnet-sdk-3.1.414-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/d34e1a17-40d4-442d-b0e2-dc297a8742ef/e8bd62b16712bb759ed29145bde51676/dotnet-sdk-3.1.414-linux-x64.tar.gz')
sha512sums_armv7h=('08c93b7948151fbe3db9fa105ed02bfefb510e437aa9ad418c60ba96b41a7e25f891a1d4308f51595a9aa385d4e9ca05cab8a803e75728fb70aa9bae30f37b67')
sha512sums_aarch64=('42b526d4ae914a0f1b04cbefe70b2c052eae9791dce54431ee5aff2e1bba5dbd08f49505a835319dab0551e9e9788f239e53ac154760cc8c0a85512cbe568408')
sha512sums_x86_64=('f0a133a2bfbbdb6e3f35ad543bfd8e48f35e2a0e0bd719f712853d686e5f453b89569504813fde33baf8788dfe509bb3bc7ad69026588761f0a07362eac76104')

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