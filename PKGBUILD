# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# armv7h and aarch64 Comaintainers needed

pkgbase=dotnet-core-7.0-bin
pkgname=(
  'aspnet-runtime-7.0-bin'
  'dotnet-runtime-7.0-bin'
  'dotnet-sdk-7.0-bin'
  'dotnet-targeting-pack-7.0-bin'
  'aspnet-targeting-pack-7.0-bin'
 )
pkgver=7.0.16.sdk406
_runtimever=7.0.16
_sdkver=7.0.406
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/405ac93b-fbfc-4c9b-9395-4f5ad72ec72c/c28821fed1bb1ba1f56c139256c6a074/dotnet-sdk-7.0.406-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/67aad17a-4584-40ff-8ac3-0093c63105a4/472183e47222f475198a4b4a394036f8/dotnet-sdk-7.0.406-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/57150757-56af-450b-ba30-8532fac51e0f/507247327723f24970f66f51554c18bc/dotnet-sdk-7.0.406-linux-x64.tar.gz')
sha512sums_armv7h=('3b7aa846f26701c1c8f3c4798b9b0563b31ac7ca2445cafef8c4b6ffd8b320452cf73c4856742312fc242dcd1bf552e6e6d57773881d23dee53f4ad1bb97bdd4')
sha512sums_aarch64=('7543ab3197653864aa72c2f711e0661a881d7c74ef861fb1e952b15b7f8efd909866e99ea0e43430768db223b79d4e0285f3114087b6e009b5d382b4adad13fc')
sha512sums_x86_64=('5455ac21b1d8a37da326b99128a7d10983673259f4ccf89b7cdc6f67bb5f6d4f123caadb9532d523b2d9025315e3de684a63a09712e2dc6de1702f5ad1e9c410')

package_dotnet-runtime-7.0-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=(
  	"dotnet-host>=${_runtimever}"
    'gcc-libs'
    'glibc'
    'icu'
    'libgssapi_krb5.so'
    'libunwind'
    'zlib'
    'openssl'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-7.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-7.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-7.0-bin
}

package_aspnet-runtime-7.0-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-7.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-7.0")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-7.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-7.0-bin
}

package_dotnet-sdk-7.0-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=(
    'glibc'
    'gcc-libs'
    'dotnet-runtime-7.0-bin'
    'dotnet-targeting-pack-7.0-bin'
    'netstandard-targeting-pack')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-7.0")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-7.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-7.0-bin
}

package_dotnet-targeting-pack-7.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-7.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-7.0)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-7.0-bin
}

package_aspnet-targeting-pack-7.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack (binary)'
  depends=(
    'dotnet-targeting-pack-7.0-bin'
  )
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-7.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-7.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-7.0-bin
}
