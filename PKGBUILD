# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgbase=dotnet-core-preview
pkgname=('dotnet-host-preview' 'dotnet-runtime-preview' 'aspnet-runtime-preview' 'dotnet-sdk-preview')
pkgver=3.1.0+100+preview2.014569
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
  'https://download.visualstudio.microsoft.com/download/pr/cea4281b-84fa-428a-a73a-f0c3b89a9590/249ddf191b2dd37c4a53ac3bc383ec8a/dotnet-sdk-3.1.100-preview2-014569-linux-x64.tar.gz'
)
source_armv7h=(
  'https://download.visualstudio.microsoft.com/download/pr/5bfd9b63-28f6-4f3d-a6e4-7f0484c45676/10bb6e66dbf26be198adf757fdeecdb1/dotnet-sdk-3.1.100-preview2-014569-linux-arm.tar.gz'
)
source_aarch64=(
  'https://download.visualstudio.microsoft.com/download/pr/c8ddbc47-4fe0-4a92-897a-38e6f7ca8e05/6288d9250287b56214179afb984bd947/dotnet-sdk-3.1.100-preview2-014569-linux-arm64.tar.gz'
)
sha256sums=('4978b3a31a94032b425d2a2a9b5a17f506f36fb784fbfefdf2cfea9485a30f47')
sha256sums_x86_64=('1c77e7afd4bfd34eeb8f947c2bb1b828cdf25d450bdb71d165fae5b017746421')
sha256sums_armv7h=('ef9563236d42d48f8113ccacfc103c1017ff7f193fa435de98b2359b2905ec5c')
sha256sums_aarch64=('5679879a60bfba1b23bc0b62580d4161f162f79ffd548df4bcfa4614b5ff4c8a')

package_dotnet-host-preview() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview)'
  provides=("dotnet-host=${pkgver%+*}")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses/dotnet-host-preview}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/opt/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-preview
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/usr/bin/dotnet
}

package_dotnet-runtime-preview() {
  pkgdesc='The .NET Core runtime (preview)'
  depends=('dotnet-host-preview' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview
}

package_aspnet-runtime-preview() {
  pkgdesc='The ASP.NET Core runtime (preview)'
  depends=('dotnet-runtime-preview')
  provides=("aspnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/aspnet-runtime-preview
}

package_dotnet-sdk-preview() {
  pkgdesc='The .NET Core SDK (preview)'
  depends=('dotnet-runtime-preview')
  provides=("dotnet-sdk=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  cp -dr --no-preserve='ownership' packs sdk templates "${pkgdir}"/opt/dotnet/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-sdk-preview
}

# vim: ts=2 sw=2 et:
