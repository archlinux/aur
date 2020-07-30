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
pkgver=5.0.0+100+preview.7.20366.6
_hostver=5.0.0-preview.7.20364.11
_runtimever=5.0.0-preview.7.20365.19
_sdkver=5.0.100-preview.7.20366.6
pkgrel=3
arch=(x86_64 armv7h aarch64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/6e9bdda1-72b5-4d2e-8908-be9321b8db26/cbc8ab6c3a1aca2a8dd92e272edd3293/dotnet-sdk-5.0.100-preview.7.20366.6-linux-x64.tar.gz)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/20349622-b776-4fa0-a981-adacd7d57b9c/174f26a811b61a11a2132613e27f442a/dotnet-sdk-5.0.100-preview.7.20366.6-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/a7d933ce-5f1d-4c7b-a388-509ee6ee710c/152fa9acb7ee9cf34d7cb0eeeb36d448/dotnet-sdk-5.0.100-preview.7.20366.6-linux-arm64.tar.gz)
sha512sums_x86_64=(a1369d4e9e6281a3656acf6ba8357fbb9b25824fa63b42b55700f4d7ab58b2dc355b91c356a13c7d76da92e30dd3a5ccefd1d3396eacc1ac62cbae608b5eed86)
sha512sums_armv7h=(2e473ba7d2ed706313a02438da2b338fa91785cbbd68d1c15268641b3d547b7183e9f5be02df8f6d2af537e02280dae94cee63a4d3dd42bfbfb3cb4ce5fade59)
sha512sums_aarch64=(34cc65a879c8dedf854e0bb5b8b3f415c7db1ea9281a868516b6c0fdbb6d356dbd41ca258c10aec0c33339a5bc3be6cdf4e4d96099b6e3f73abb841e9c8d2dae)

package_dotnet-host-preview() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview, binary)'
  depends=(glibc)
  provides=(dotnet-host)
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
    dotnet-host-preview
    glibc 
    icu
    krb5
    libcurl.so
    libunwind
    openssl
    zlib
  )

  optdepends=('lttng-ust: CoreCLR tracing')
  provides=(dotnet-runtime-5.0)
  conflicts=(dotnet-runtime-5.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview
}

package_aspnet-runtime-preview() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=(dotnet-runtime-preview)
  provides=(aspnet-runtime-5.0)
  conflicts=(aspnet-runtime-5.0)

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
  provides=(dotnet-sdk-5.0)
  conflicts=(dotnet-sdk-5.0)

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
  provides=(dotnet-targeting-pack-5.0)
  conflicts=(dotnet-targeting-pack-5.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-x64,Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-preview
}

package_aspnet-targeting-pack-preview() {
  pkgdesc='The ASP.NET Core targeting pack (preview, binary)'
  depends=(dotnet-targeting-pack-preview)
  provides=(aspnet-targeting-pack-5.0)
  conflicts=(aspnet-targeting-pack-5.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-preview
}
