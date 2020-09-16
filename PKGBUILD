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
pkgver=5.0.0+100+rc.1.20452.10
_hostver=5.0.0-rc.1.20451.14
_runtimever=5.0.0-rc.1.20451.14
_sdkver=5.0.100-rc.1.20452.10
pkgrel=1
arch=(x86_64 armv7h aarch64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/e5536fae-e963-4fa6-a203-15604c7d703a/d0968c03feeeed41c2428854e13c0085/dotnet-sdk-5.0.100-rc.1.20452.10-linux-x64.tar.gz)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/e6456209-63c8-43fc-ba2d-11c43c9eacd5/3a12e6bae9ff57c1964eb83cb01604b6/dotnet-sdk-5.0.100-rc.1.20452.10-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/8f24c20f-cf36-44bb-9405-becc781e6a1c/b5d8a40cde8b4525ea65ac4e5c7250d5/dotnet-sdk-5.0.100-rc.1.20452.10-linux-arm64.tar.gz)
sha512sums_x86_64=(d7e709dacc4bb188c2380060d24bfb5b791240dc33af8499fb4a31e1885a9377dad1d1ebc76847432ea67d5e4ac832a31679dc293e09fa6dade28f5fbbe4db9b)
sha512sums_armv7h=(b0e6627497ced9d09fad9c48d266bd4cb94727dc254d8b4a79d445732669c14f5d9592a98c0452cb25ae5eb4f642373f544418e36873b33f0f3dd94f14003e26)
sha512sums_aarch64=(2d04890c71e845d1eb08f5dfbbb9c93024d7a52fb1cc3fd50bd51bc6bd44e455c5c82abc8f04eef23bd012984ae5f86143c600ceb49c4c733935d95d5b68785f)

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
  provides=(dotnet-runtime=${_runtimever%-*} dotnet-runtime-5.0)
  conflicts=(dotnet-runtime=${_runtimever%-*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview
}

package_aspnet-runtime-preview() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=(dotnet-runtime-preview)
  provides=(aspnet-runtime=${_runtimever%-*} aspnet-runtime-5.0)
  conflicts=(aspnet-runtime=${_runtimever%-*})

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
    netstandard-targeting-pack
  )
  optdepends=('aspnet-targeting-pack-preview: Build ASP.NET Core applications')
  provides=(dotnet-sdk=${_sdkver%-*} dotnet-sdk-5.0)
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
  depends=(netstandard-targeting-pack)
  provides=(dotnet-targeting-pack=${_runtimever%-*} dotnet-targeting-pack-5.0)
  conflicts=(dotnet-targeting-pack=${_runtimever%-*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-x64,Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-preview
}

package_aspnet-targeting-pack-preview() {
  pkgdesc='The ASP.NET Core targeting pack (preview, binary)'
  depends=(dotnet-targeting-pack-preview)
  provides=(aspnet-targeting-pack=${_runtimever%-*} aspnet-targeting-pack-5.0)
  conflicts=(aspnet-targeting-pack=${_runtimever%-*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-preview
}
