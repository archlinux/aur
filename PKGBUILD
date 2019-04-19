# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgbase=dotnet-core-preview
pkgname=('dotnet-host-preview' 'dotnet-runtime-preview' 'aspnet-runtime-preview' 'dotnet-sdk-preview')
pkgver=3.0.0+100+preview.011223
_pkgver=3.0.0+100-preview-011223
pkgrel=1
arch=('x86_64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source=(
  'https://download.visualstudio.microsoft.com/download/pr/26d4dc1f-f674-4902-9921-f287f65266f9/ef8a67939f0c3e5729b2674a5e013328/dotnet-sdk-3.0.100-preview4-011223-linux-x64.tar.gz'
  'https://download.visualstudio.microsoft.com/download/pr/efe3f589-6a9e-4c05-95ca-a514188d048a/b81d36316bc4406efd37df0419691208/aspnetcore-runtime-3.0.0-preview4-19216-03-linux-x64.tar.gz'
  'dotnet.sh'
)
sha256sums=('cd4a37d05093934de8e134e0c78542cfc4dbae5eb5659dcaaea7958b758e5121'
            '7e76d2b3db92b94d726522e434670b4326bcd2887ca2f02548c595654045c8ae'
            'f4cb02490234b853946477f82514f0c6247b55b08b2e85fae98e99a6e6974edd')

package_dotnet-host-preview() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview)'
  provides=('dotnet-host')
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
  provides=('dotnet-runtime-3.0')
  conflicts=('dotnet-runtime-3.0')

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview
}

package_aspnet-runtime-preview() {
  pkgdesc='The ASP.NET Core runtime (preview)'
  depends=('dotnet-runtime-preview')
  provides=('aspnet-runtime-3.0')
  conflicts=('aspnet-runtime-3.0')

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/aspnet-runtime-preview
}

package_dotnet-sdk-preview() {
  pkgdesc='The .NET Core SDK (preview)'
  depends=('dotnet-runtime-preview')
  provides=('dotnet-sdk-3.0')
  conflicts=('dotnet-sdk-3.0')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/opt/dotnet/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-sdk-preview
}

# vim: ts=2 sw=2 et:
