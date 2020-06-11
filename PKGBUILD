# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgbase=dotnet-core-preview
pkgname=('dotnet-host-preview' 'dotnet-runtime-preview' 'aspnet-runtime-preview' 'dotnet-sdk-preview')
pkgver=5.0.0+100+preview.4.20279.10
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
  'https://download.visualstudio.microsoft.com/download/pr/7cf9fa3e-af03-4181-baab-e04ed4b05268/fd44776a5169d6b126ee11d6140691be/dotnet-sdk-5.0.100-preview.5.20279.10-linux-x64.tar.gz'
)
source_armv7h=(
  'https://download.visualstudio.microsoft.com/download/pr/6fb3f700-22ed-43d8-8f54-8152f359054b/050d3254d477aeb124a45d0cb13f864d/dotnet-sdk-5.0.100-preview.5.20279.10-linux-arm.tar.gz'
)
source_aarch64=(
  'https://download.visualstudio.microsoft.com/download/pr/a529731c-7c51-42f4-9386-46c6466019dc/e408a0275c2333ae29a6e31c00c1ae64/dotnet-sdk-5.0.100-preview.5.20279.10-linux-arm64.tar.gz'
)
sha256sums=('4978b3a31a94032b425d2a2a9b5a17f506f36fb784fbfefdf2cfea9485a30f47')
sha256sums_x86_64=('aa2d59719fa26a872c00a1d63c4e2984473f12958500c6abe6134c7cedaff20b')
sha256sums_armv7h=('6de678da7df725c27f3aa93f5a549178a06cfb9cba28290f87b7f1824dbad5f9')
sha256sums_aarch64=('4bb9bbc71473aa66b8e16ce9bf302d43ca860f05acc2d11bbef49d49ef73a3ba')

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
