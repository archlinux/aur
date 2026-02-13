# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# armv7h and aarch64 Comaintainers needed

pkgbase=dotnet-core-8.0-bin
pkgname=(
  'aspnet-runtime-8.0-bin'
  'dotnet-runtime-8.0-bin'
  'dotnet-sdk-8.0-bin'
  'dotnet-targeting-pack-8.0-bin'
  'aspnet-targeting-pack-8.0-bin'
 )
pkgver=8.0.24.sdk418
_runtimever=8.0.24
_sdkver=8.0.418
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm.tar.gz")
source_aarch64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm64.tar.gz")
source_x86_64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-x64.tar.gz")
sha512sums_armv7h=('1466ad6f4abadeb33d57ff3e062db90b1937dd798fa6869c013e7fd6426f26f211f0e7222f72707fce2cdf226cd697a2654b67561cf8c54edd05aa194507af43')
sha512sums_aarch64=('9193c9a77a5eedfac24974160e9b2d95865e88c8c4f0741042d2ebb4bc3317bf341ecb974ac6dad91c10d7adee22db717b35d3fef686f5aad67f4aff44574033')
sha512sums_x86_64=('fbd9fc9f0bca73f771e79c12d721a18da97ba23c43794b941b110ccaac0fcd16156c996a5b9cfc0650120601791f2909e93ecb268f687c7b82889934c766c2b9')

package_dotnet-runtime-8.0-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=(
  	"dotnet-host>=${_runtimever}"
    'gcc-libs'
    'glibc'
    'icu'
    'libunwind'
    'zlib'
    'openssl'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-8.0")
  conflicts=("dotnet-runtime-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-8.0-bin
}

package_aspnet-runtime-8.0-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-8.0-bin')
  provides=("aspnet-runtime-8.0")
  conflicts=( "aspnet-runtime-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-8.0-bin
}

package_dotnet-sdk-8.0-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=(
    'glibc'
    'gcc-libs'
    'dotnet-runtime-8.0-bin'
    'dotnet-targeting-pack-8.0-bin'
    'netstandard-targeting-pack')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk-8.0")
  conflicts=("dotnet-sdk-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-8.0-bin
}

package_dotnet-targeting-pack-8.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(dotnet-targeting-pack-8.0)
  conflicts=(dotnet-targeting-pack-8.0)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-8.0-bin
}

package_aspnet-targeting-pack-8.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack (binary)'
  depends=(
    'dotnet-targeting-pack-8.0-bin'
  )
  provides=(aspnet-targeting-pack-8.0)
  conflicts=(aspnet-targeting-pack-8.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-8.0-bin
}
