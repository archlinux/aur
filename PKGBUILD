# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-host-2.1' 'dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.14
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source=('dotnet.sh')
sha512sums=('a6ee992d7ab08adb916f0b5d72d203f8ab38cfa2e354f062d499d4d8a64ab2b95e5511a041d859331e560f45c5bb642c2f118951e2104f362e10b31cf07e95b0')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/94409a9a-41e3-4df9-83bc-9e23ed96abaf/2b75460d9a8eef8361c01bafc1783fab/dotnet-sdk-2.1.607-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/7522a153-84f6-447e-afe8-ffe2f5724478/a9370fb612f1501241b199a5e479200b/dotnet-sdk-2.1.607-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/39e68289-0364-4173-a12b-c6234e94c527/92f3eb83bfca8b7cd360868996763125/dotnet-sdk-2.1.607-linux-x64.tar.gz')
sha512sums_armv7h=('2cd8fa250e6a0e81faf409e7dc4f6d581117f565d58cff48b31f457e7cafc7f3cfe0de0df2b1c5d035733879750eb2af22fcc950720a7a7192e4221318052838')
sha512sums_aarch64=('e7f5e30a55bb5af3ecec0ee5566622755db4199de488e89c5e4b5d5f870d0a2c77f337346ddd9711c8c4f25b1fc85f1b4ba219bef9706e9b9510d718b5e5f9d6')
sha512sums_x86_64=('bfcee5d0121bc3b4dcd08c7a99e700a9dc89e9dcf326ae40046a222bc2fe0212bca14811dcf1e96a6cc6ecd085fbc492e30dc2c2d19ee1741960bbd5e238233a')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-host-2.1() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface version 2.1'
  provides=("dotnet-host=${pkgver%+*}")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses/dotnet-host-2.1,usr/bin,usr/lib}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/opt/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-2.1
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/opt/dotnet
  ln -sf /opt/dotnet/dotnet.sh "${pkgdir}"/usr/bin/dotnet
  ln -sf /opt/dotnet/host/fxr/"${pkgver}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
}

package_dotnet-runtime-2.1() {
  pkgdesc='The .NET Core runtime version 2.1'
  depends=('dotnet-host>=2.1.14' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-runtime-2.1
}

package_dotnet-sdk-2.1() {
  pkgdesc='The .NET Core SDK version 2.1'
  depends=('dotnet-runtime=2.1.14')
  provides=("dotnet-sdk=2.1.607")

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/opt/dotnet/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-sdk-2.1
}
