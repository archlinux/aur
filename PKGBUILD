# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-bin
pkgname=(
  'dotnet-host-bin'
  'aspnet-runtime-bin'
  'dotnet-runtime-bin'
  'dotnet-sdk-bin'
  # netstandard-targeting-pack-bin
  'dotnet-targeting-pack-bin'
  'aspnet-targeting-pack-bin'
  )
pkgver=3.1.7.sdk401
_runtimever=3.1.6
_sdkver=3.1.401
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/a92a6358-52c3-472b-ad6d-d2d80abdcef4/37a7551a4e2c9e455caed5ef777a8983/dotnet-sdk-3.1.401-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/8c39349a-23d0-46b0-8206-8b573a404709/b42fd441c1911acc90aaddaa58d7103f/dotnet-sdk-3.1.401-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/4f9b8a64-5e09-456c-a087-527cfc8b4cd2/15e14ec06eab947432de139f172f7a98/dotnet-sdk-3.1.401-linux-x64.tar.gz')
sha512sums_armv7h=('2c84d8442fd872aafbdff7a1f131c4bacfb75ca69426d2aa2b9f3cf05a8e3a365923c14f7eb732113dd7a9fdc674c955e70817fb355aaabca25b79ed33356a15')
sha512sums_aarch64=('ab9afd226b920dce24bcd372cccb1965163829c26d1f11f1df3d8f9be5afb1d87f26b23e5fbeb58cf4ddaa040b8228fa00a786c379a454b9d99c2964197ab4cd')
sha512sums_x86_64=('5498add9ef83da44d8f7806ca1ce335ad4193c0d3181a5abda4b65e116c7331aac37a229817ff148e4487e9734ad2438f102a0eef0049e26773a185ceb78aac4')

package_dotnet-host-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (binary)'
  provides=("dotnet-host")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{dotnet,licenses/dotnet-host}}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host
  ln -sf /usr/share/dotnet/dotnet "${pkgdir}"/usr/bin/dotnet
  ln -sf /usr/share/dotnet/host/fxr/"${_runtimever}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
}

package_dotnet-runtime-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=('dotnet-host'
           'glibc'
           'icu' 
           'krb5'
           'libcurl.so'
           'libunwind'
           'openssl'
           'zlib'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-bin" "dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")
  conflicts=("dotnet-runtime-bin" "dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-bin
}

package_aspnet-runtime-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-bin')
  provides=("aspnet-runtime-bin" "aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")
  conflicts=("aspnet-runtime-bin" "aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-bin
}

package_dotnet-sdk-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=('dotnet-runtime-bin' 'glibc')
  provides=("dotnet-sdk-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  conflicts=("dotnet-sdk-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-bin
}

# package_netstandard-targeting-pack-bin() {
#   pkgdesc='The .NET Standard targeting pack (binary)'
#   provides=(netstandard-targeting-pack-2.1)
#   conflicts=(netstandard-targeting-pack-2.1)

#   install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
#   cp -dr --no-preserve='ownership' packs/NETStandard.Library.Ref "${pkgdir}"/usr/share/dotnet/packs/
#   ln -s dotnet-host "${pkgdir}"/usr/share/licenses/netstandard-targeting-pack
# }

package_dotnet-targeting-pack-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(netstandard-targeting-pack)
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-3.1)
  conflicts=(dotnet-targeting-pack=${_runtimever})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-x64,Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-bin
}

package_aspnet-targeting-pack-bin() {
  pkgdesc='The ASP.NET Core targeting pack (binary)'
  depends=(dotnet-targeting-pack-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-3.1)
  conflicts=(aspnet-targeting-pack=${_runtimever})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-bin
}