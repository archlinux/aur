# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-host-2.1' 'dotnet-runtime-2.1' 'aspnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.13
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
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/516cf8d3-f536-4f58-a5ce-aa6f2f85d1c8/98aab0aaedd12e987310f4c2c1f327d3/dotnet-sdk-2.1.802-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/df4506c8-dbaa-4fc9-910b-63044c6d7ecf/0c4530092606a9ba32045996b64749fe/dotnet-sdk-2.1.802-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/8029a774-0cc8-4c62-945e-169a473b51d3/2c3f6a18aed152e5e498035695ed816f/dotnet-sdk-2.1.802-linux-x64.tar.gz')
sha512sums=('a6ee992d7ab08adb916f0b5d72d203f8ab38cfa2e354f062d499d4d8a64ab2b95e5511a041d859331e560f45c5bb642c2f118951e2104f362e10b31cf07e95b0')
sha512sums_armv7h=('12717f5b37d689eaba49fc9c3c40a8fac097022390c19d348b388456e73819c3e0442c3bc06cc49259404dc6d46d63cd951abb232aa1244f2de0763b785bdb42')
sha512sums_aarch64=('42b77b1aa2533c03199884cdd0520777054b662be27d0e27b993bcceadff0d426b76cd6d5426a64b5634543d9f14436cdb15bb54e043fdff444eaec8fcdc2ac7')
sha512sums_x86_64=('8601ec68fa8978c5a08a696cc69f5e0aa9dabf274bade40e2fd9ded2e563f2cc7a1cb418a95c9b52e1fa9b6c4a30993be68cb3b6bbda4598c57b37ec9ce992ad')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-host-2.1() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface version 2.1'
  provides=("dotnet-host=${pkgver%+*}")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses/dotnet-host-2.1}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/opt/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-2.1
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/usr/bin/dotnet
}

package_dotnet-runtime-2.1() {
  pkgdesc='The .NET Core runtime version 2.1'
  depends=('dotnet-host>=2.1.13' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-runtime-2.1
}

package_aspnet-runtime-2.1() {
  arch=('x86_64' 'armv7h')
  pkgdesc='The ASP.NET Core runtime version 2.1'
  depends=('dotnet-runtime=2.1.13')
  provides=("aspnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}

package_dotnet-sdk-2.1() {
  pkgdesc='The .NET Core SDK version 2.1'
  depends=('dotnet-runtime=2.1.13')
  provides=("dotnet-sdk=2.1.802")

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/opt/dotnet/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-sdk-2.1
}
