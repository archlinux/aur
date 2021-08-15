# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-3.1
pkgname=(
  'aspnet-runtime-3.1-bin'
  'dotnet-runtime-3.1-bin'
  'dotnet-sdk-3.1-bin'
  'dotnet-targeting-pack-3.1-bin'
  'aspnet-targeting-pack-3.1-bin'
 )
pkgver=3.1.18.sdk412
_runtimever=3.1.18
_sdkver=3.1.412
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/5aef7e5d-2112-4868-8d7c-4c82f04363c5/e4fe30dc136634001cf357f26c825506/dotnet-sdk-3.1.412-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/f9f54199-f0b3-43ac-badd-f9ef6867641c/50bd985f26c59f5d63f29f571f7f89e5/dotnet-sdk-3.1.412-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/90e2064f-8786-4e12-95cd-8185fc71f1cb/1a3279320411c489f37142ec656ef0b8/dotnet-sdk-3.1.412-linux-x64.tar.gz')
sha512sums_armv7h=('3c66abcdef095db393ecd25501ba1e13c5a78b79ce65e6bd9ddcc3a559528eab21b0a95b39acb86e5f7f8565ae7a799e6c7e6d723121132110f93eb868cf81eb')
sha512sums_aarch64=('bfc6f58cb0b87b0a2cf42d91494b914ab0997c91289599cce1704ee33fac9773e5b37b48d40c2d0fc53709c7f94cc37c26533ef7d0eb90f6db05680b2b603da0')
sha512sums_x86_64=('1ed0c1ab48723cef834906a55fb1889b29dd810cd2bc66cbd345a0baf8a2796045b5b7f4beef3c48bd56bef3ffed690b6fae4a5f017ad8687817b25a76fbd9be')

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