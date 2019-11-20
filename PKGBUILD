# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-bin
pkgname=('dotnet-host-bin' 'aspnet-runtime-bin' 'dotnet-runtime-bin')
pkgver=3.0.1
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
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/0b30374c-3d52-45ad-b4e5-9a39d0bf5bf0/deb17f7b32968b3a2186650711456152/dotnet-sdk-3.0.101-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/89fb60b1-3359-414e-94cf-359f57f37c7c/256e6dac8f44f9bad01f23f9a27b01ee/dotnet-sdk-3.0.101-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/4f51cfd8-311d-43fe-a887-c80b40358cfd/440d10dc2091b8d0f1a12b7124034e49/dotnet-sdk-3.0.101-linux-x64.tar.gz')
sha512sums=('a6ee992d7ab08adb916f0b5d72d203f8ab38cfa2e354f062d499d4d8a64ab2b95e5511a041d859331e560f45c5bb642c2f118951e2104f362e10b31cf07e95b0')
sha512sums_armv7h=('79f1a40e30b1e3f1e743dc7e9d539ec296a65ba9a2ca5a11c7ba0d3811ddfda5a4897c263da754d6f5ee4d02531d5a42cc303f1106c57d84bbe8d7d713c510bc')
sha512sums_aarch64=('e0c148a515d74325e110b4542c87c6397ec78efd362ef7ca49b31768476d7f174456895a5054159492bd949caf0cdfc466c703855d666bb337a89cae381188ac')
sha512sums_x86_64=('8cd6070c9df1272ac3f2a0e9bd8c1fc2cfef38907fa2e3c81384f005168f45036b5904b4f731cbe37d2b3fe558f560008c481939093b0d08ef0f1778ca97f186')

package_dotnet-host-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (binary)'
  provides=("dotnet-host=${pkgver%+*}")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses/dotnet-host-bin,usr/bin,usr/lib}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/opt/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-bin
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/opt/dotnet
  ln -sf /opt/dotnet/dotnet.sh "${pkgdir}"/usr/bin/dotnet
  ln -sf /opt/dotnet/host/fxr/"${pkgver}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
}

package_dotnet-runtime-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=('dotnet-host>=3.0.1' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-bin
}

package_aspnet-runtime-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime=3.0.1')
  provides=( "aspnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-bin
}