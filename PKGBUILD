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
pkgver=6.0.0.sdk100+preview.2.21155.3
_hostver=6.0.0-preview.2.21154.6
_dotnetruntimever=6.0.0-preview.2.21154.6
_aspnetruntimever=6.0.0-preview.2.21154.6
_sdkver=6.0.100-preview.2.21155.3
pkgrel=1
arch=(x86_64 armv7h aarch64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/25c7e38e-0a6a-4d66-ac4e-b550a44b8a98/49128be84b903799259e7bebe8e9d969/dotnet-sdk-6.0.100-preview.2.21155.3-linux-x64.tar.gz)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/8c9dc65d-e004-4fe3-8327-4ba4c235095c/d16e99faf79b817b846f5734e94830de/dotnet-sdk-6.0.100-preview.2.21155.3-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/1d639275-6a89-45e9-a337-725c3ce49439/aa35a5e06539c6ffe1f81e74e45784e9/dotnet-sdk-6.0.100-preview.2.21155.3-linux-arm64.tar.gz)
sha512sums_x86_64=('90d9b6070f7732dcf75f5a09a4f10f9b23c835a3bb144e0c3f1fa451cadd3d49c9781973b180f70a4d2798358a7c00f3c0b9b3bf35326fe4c94e470e84ac8c35')
sha512sums_armv7h=('82adee2db3b57388bd0d48e5eaab64e5e6bece462d49cc0161c8b3b7559ecbc764d48ad112c7893f86858610e21342c7ca50ee1e090a4ddfd09483c24f6e5c63')
sha512sums_aarch64=('91796b6d611b3a8c1e85d8f2fd07f8889d15f4bcab7307cd1ca24c51cc1f352e3bb77f0e6219ddf92b210030feeffe18ebd1ab97b4256202e287e7e7a5236df0')

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
