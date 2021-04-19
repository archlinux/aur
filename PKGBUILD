# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-preview
pkgname=(
  dotnet-host-preview
  aspnet-runtime-preview
  dotnet-runtime-preview
  dotnet-sdk-preview
  # netstandard-targeting-pack-preview
  dotnet-targeting-pack-preview
  aspnet-targeting-pack-preview
)
pkgver=6.0.0.sdk100+preview.3.21202.5
_hostver=6.0.0-preview.3.21201.4
_dotnetruntimever=6.0.0-preview.2.21201.4
_aspnetruntimever=6.0.0-preview.2.21201.13
_sdkver=6.0.100-preview.3.21202.5
pkgrel=1
arch=(x86_64 armv7h aarch64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/cd855e4d-b02a-4327-b218-7ab500ecff83/c7649b00ee20e30244b8b84ff9139c71/dotnet-sdk-6.0.100-preview.3.21202.5-linux-x64.tar.gz)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/bd2c0cea-b1b5-4de8-941b-2b53f94df021/51bdc3008f95104c1e5bf1cd7f34cf78/dotnet-sdk-6.0.100-preview.3.21202.5-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/90d8a5e0-ed8f-430c-a66c-d17a096024a9/95d17428d5b0da3552c502eede9f7f05/dotnet-sdk-6.0.100-preview.3.21202.5-linux-arm64.tar.gz)
sha512sums_x86_64=('f776177c1ca2b672cf05f9ec32f20ef35a039dd8d31beaa139d1e47d71cca4ccf0f2a61bbf006a781e693977ee91cc9e08e12134ffb4c7a03a8e56c163b8661d')
sha512sums_armv7h=('feff4ca8600c48482a4a4cf2863d16e36c4a33e46b1b56567e8acf7599d7ea71feb2bb1715a43e989c26148ea2c5024353114e687c290632fa12f18d184a5ca9')
sha512sums_aarch64=('ee658e35f7917c5681d1f71ad3f82f4f2975d66a9b747ec5b5d58629b75c22fb6f31532b5423ad75b2e92ef333179948b52dd5507eadd9f3431e5638d98268d9')

package_dotnet-host-preview() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview, binary)'
  depends=(glibc)
  provides=(dotnet-host dotnet-host=${_hostver%-*})
  conflicts=(dotnet-host)

  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{dotnet,licenses/dotnet-host-preview}}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-preview
  ln -sf /usr/share/dotnet/dotnet "${pkgdir}"/usr/bin/dotnet
  ln -sf /usr/share/dotnet/host/fxr/"${_hostver}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
}

package_dotnet-runtime-preview() {
  pkgdesc='The .NET Core runtime (preview, binary)'
  depends=(
    "dotnet-host>=${_hostver%-*}"
    glibc 
    icu
    krb5
    libcurl.so
    libunwind
    openssl
    zlib
  )

  optdepends=('lttng-ust: CoreCLR tracing')
  provides=(dotnet-runtime=${_dotnetruntimever%-*} dotnet-runtime-6.0)
  conflicts=(dotnet-runtime=${_dotnetruntimever%-*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview
}

package_aspnet-runtime-preview() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=(dotnet-runtime-preview)
  provides=(aspnet-runtime=${_aspnetruntimever%-*} aspnet-runtime-6.0)
  conflicts=(aspnet-runtime=${_aspnetruntimever%-*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/aspnet-runtime-preview
}

package_dotnet-sdk-preview() {
  pkgdesc='The .NET Core SDK (preview, binary)'
  depends=(
    dotnet-runtime-preview
    dotnet-targeting-pack-preview
    glibc
    netstandard-targeting-pack-2.1
  )
  optdepends=('aspnet-targeting-pack-preview: Build ASP.NET Core applications')
  provides=(dotnet-sdk=${_sdkver%-*} dotnet-sdk-6.0)
  conflicts=(dotnet-sdk=${_sdkver%-*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-sdk-preview
}

# package_netstandard-targeting-pack-preview() {
#   pkgdesc='The .NET Standard targeting pack (preview, binary)'
#   provides=(netstandard-targeting-pack-2.1)
#   conflicts=(netstandard-targeting-pack-2.1)

#   install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
#   cp -dr --no-preserve='ownership' packs/NETStandard.Library.Ref "${pkgdir}"/usr/share/dotnet/packs/
#   ln -s dotnet-host "${pkgdir}"/usr/share/licenses/netstandard-targeting-pack-preview
# }

package_dotnet-targeting-pack-preview() {
  pkgdesc='The .NET Core targeting pack (preview, binary)'
  depends=(netstandard-targeting-pack-2.1)
  provides=(dotnet-targeting-pack=${_dotnetruntimever%-*} dotnet-targeting-pack-6.0)
  conflicts=(dotnet-targeting-pack=${_dotnetruntimever%-*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-x64,Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-preview
}

package_aspnet-targeting-pack-preview() {
  pkgdesc='The ASP.NET Core targeting pack (preview, binary)'
  depends=(dotnet-targeting-pack-preview)
  provides=(aspnet-targeting-pack=${_aspnetruntimever%-*} aspnet-targeting-pack-6.0)
  conflicts=(aspnet-targeting-pack=${_aspnetruntimever%-*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-preview
}
