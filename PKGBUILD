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
pkgver=3.1.6.sdk302
_runtimever=3.1.6
_sdkver=3.1.302
pkgrel=2
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/56691c4c-341a-4bca-9869-409803d23cf8/d872d7a0c27a6c5e9b812e889de89956/dotnet-sdk-3.1.302-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/5ee48114-19bf-4a28-89b6-37cab15ec3f2/f5d1f54ca93ceb8be7d8e37029c8e0f2/dotnet-sdk-3.1.302-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/c1a30ceb-adc2-4244-b24a-06ca29bb1ee9/6df5d856ff1b3e910d283f89690b7cae/dotnet-sdk-3.1.302-linux-x64.tar.gz')
sha512sums_armv7h=('eccb9ba89eb745282cb749e505fcf2209e3b56f41d5ddbb383dbeae04eb58a9b367560d743bc78600c8adab4abb93bbabccaae33613b9d3fec2b150fca5dffc4')
sha512sums_aarch64=('c2bebb673f217d9e7afb80b2b032c6f850d93e2419b5c0f9aa22676114a5c4fa91550a89b46757012fb9535405c1bb7902f0927f093769d4d055a8de84cfc5d8')
sha512sums_x86_64=('a270c150d53eafbb67d294aecd27584b517077b6555d93d1dd933f4209affdda58cae112a50b3a56eeef63e635b5c5d1933f4852a92e760282c7619d2454edbe')

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
  depends=('dotnet-host' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-bin" "dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")
  conflicts=("dotnet-runtime-bin" "dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime
}

package_aspnet-runtime-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-bin')
  provides=("aspnet-runtime-bin" "aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")
  conflicts=("aspnet-runtime-bin" "aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime
}

package_dotnet-sdk-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=('dotnet-runtime-bin' 'glibc')
  provides=("dotnet-sdk-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  conflicts=("dotnet-sdk-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk
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
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack
}

package_aspnet-targeting-pack-bin() {
  pkgdesc='The ASP.NET Core targeting pack (binary)'
  depends=(dotnet-targeting-pack-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-3.1)
  conflicts=(aspnet-targeting-pack=${_runtimever})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack
}