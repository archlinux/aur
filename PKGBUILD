# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgbase=dotnet-core-rc
pkgname=('dotnet-host-rc' 'dotnet-runtime-rc' 'aspnet-runtime-rc' 'dotnet-sdk-rc')
pkgver=3.0.0+100+rc1.014190
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source=(
  'dotnet.sh'
)
source_x86_64=(
  'https://download.visualstudio.microsoft.com/download/pr/b81a2bd3-a8a4-4c7e-bd69-030f412ff7b4/3fc5f2c0481313daf2e18c348362ff3f/dotnet-sdk-3.0.100-rc1-014190-linux-x64.tar.gz'
)
source_armv7h=(
  'https://download.visualstudio.microsoft.com/download/pr/29f1b10f-758f-44fb-b14c-49833e5379aa/c259e43ccc84a77fdf4ab5feea6774b3/dotnet-sdk-3.0.100-rc1-014190-linux-arm.tar.gz'
)
source_aarch64=(
  'https://download.visualstudio.microsoft.com/download/pr/19cc5d2e-6794-401a-8b57-29a96cbf21b5/f1de24385a2b5a8fcbebab3af9ec07c4/dotnet-sdk-3.0.100-rc1-014190-linux-arm64.tar.gz'
)
sha256sums=('4978b3a31a94032b425d2a2a9b5a17f506f36fb784fbfefdf2cfea9485a30f47')
sha256sums_x86_64=('4429853c24e054cd8ec0e471a41682da591888b9652d24021c761c0ba6be8d7f')
sha256sums_armv7h=('8b0f0f27e2e4fba85fb48117f771de306fec89943b13d61ce220db95eb732c90')
sha256sums_aarch64=('34dc98d4abbde383b4b2ce6836e321de074a8aaeb21163e9eb8d68fe2b88a918')

package_dotnet-host-rc() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (RC)'
  provides=("dotnet-host=${pkgver%+*}")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses/dotnet-host-rc}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/opt/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-rc
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/usr/bin/dotnet
}

package_dotnet-runtime-rc() {
  pkgdesc='The .NET Core runtime (RC)'
  depends=('dotnet-host-rc' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-rc "${pkgdir}"/usr/share/licenses/dotnet-runtime-rc
}

package_aspnet-runtime-rc() {
  pkgdesc='The ASP.NET Core runtime (RC)'
  depends=('dotnet-runtime-rc')
  provides=("aspnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-rc "${pkgdir}"/usr/share/licenses/aspnet-runtime-rc
}

package_dotnet-sdk-rc() {
  pkgdesc='The .NET Core SDK (RC)'
  depends=('dotnet-runtime-rc')
  provides=("dotnet-sdk=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  cp -dr --no-preserve='ownership' packs sdk templates "${pkgdir}"/opt/dotnet/
  ln -s dotnet-host-rc "${pkgdir}"/usr/share/licenses/dotnet-sdk-rc
}

# vim: ts=2 sw=2 et:
