# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgbase=dotnet-core-preview
pkgname=('dotnet-host-preview' 'dotnet-runtime-preview' 'aspnet-runtime-preview' 'dotnet-sdk-preview')
pkgver=3.0.0+100+preview.012264
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
  'https://download.visualstudio.microsoft.com/download/pr/72ce4d40-9063-4a2e-a962-0bf2574f75d1/5463bb92cff4f9c76935838d1efbc757/dotnet-sdk-3.0.100-preview6-012264-linux-x64.tar.gz'
  'https://download.visualstudio.microsoft.com/download/pr/ea4b23b0-d7dc-4d39-8de4-d4c89e1f9551/bfe628fcb8f19d4c97c75d1217af1a8b/aspnetcore-runtime-3.0.0-preview6.19307.2-linux-x64.tar.gz'
  'dotnet.sh'
)
sha256sums=('5149eeee283cc226186d311df664de5eb96a52d1e37a61ae58abf3b0a3d66d5c'
            '24c009363c072f6c76687ce686b4aa3d72b4eb5eaf1a3ceb85bdff6807719b28'
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
