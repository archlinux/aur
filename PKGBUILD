# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgbase=dotnet-core-preview
pkgname=('dotnet-host-preview' 'dotnet-runtime-preview' 'aspnet-runtime-preview' 'dotnet-sdk-preview')
pkgver=3.1.0+100+preview3.014645
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
  'https://download.visualstudio.microsoft.com/download/pr/941853c3-98c6-44ff-b11f-3892e4f91814/14e8f22c7a1d95dd6fe9a53296d19073/dotnet-sdk-3.1.100-preview3-014645-linux-x64.tar.gz'
)
source_armv7h=(
  'https://download.visualstudio.microsoft.com/download/pr/018e0c67-f335-4a44-b79f-79a4093342d7/29fc2229b5f83f4176b9c9ff16aebada/dotnet-sdk-3.1.100-preview3-014645-linux-arm.tar.gz'
)
source_aarch64=(
  'https://download.visualstudio.microsoft.com/download/pr/beadd57f-83ec-407a-96da-624c61c5fdcf/b1e5eb0c57f3558680e94310ba6c1470/dotnet-sdk-3.1.100-preview3-014645-linux-arm64.tar.gz'
)
sha256sums=('4978b3a31a94032b425d2a2a9b5a17f506f36fb784fbfefdf2cfea9485a30f47')
sha256sums_x86_64=('91152a4e1c4aa273c880ff88a318568f46dbc0a1b64bf51a5d2371bb8070ea78')
sha256sums_armv7h=('d12b67ca6eeaa8e85fa856e6101c9b535f926f2d9f4f0d362e02c5bf75078231')
sha256sums_aarch64=('75968c3340178b0210beed12849dde42b9393d221d9821396813875f76ce8a0b')

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
