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
pkgver=5.0.0+100+rc.2.20479.15
_hostver=5.0.0-rc.2.20475.5
_runtimever=5.0.0-rc.2.20475.5
_sdkver=5.0.100-rc.2.20479.15
pkgrel=1
arch=(x86_64 armv7h aarch64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/69cb8922-7bb0-4d3a-aa92-8cb885fdd0a6/2fd4da9e026f661caf8db9c1602e7b2f/dotnet-sdk-5.0.100-rc.2.20479.15-linux-x64.tar.gz)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/068ebc6e-4a1d-45ec-a766-733a142f2839/e0da4c731c943ca2b267c15edb565108/dotnet-sdk-5.0.100-rc.2.20479.15-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/b416bc12-1478-4241-bc31-6fe68f8b73b6/582f018a97172f4975973390cf3f58e7/dotnet-sdk-5.0.100-rc.2.20479.15-linux-arm64.tar.gz)
sha512sums_x86_64=(e705043cdec53827695567eed021c76b100d77416f10cc18d4f5d02950f85bf9ccd7e2c22643f00a883e11b253fb8aa098e4dce008008a0796f913496f97e362)
sha512sums_armv7h=(22e97c15393a4f986563f5e8b031b49983eb55531170b86594d7caab819b41032393a9b3db4ee96cb88fae3971ba243bb64187606e3a00fc64d2e434d906a637)
sha512sums_aarch64=(1aab49b2c328c4de8c40e790df99aa327a3aeba5d904696fa151acbfb7b5620ebf3d1e2e9726895d92b6146295840ffe3f2fb7208a81c7b73d2c92c9fcf50dbf)

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
