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
pkgver=8.0.12.sdk405
_runtimever=8.0.12
_sdkver=8.0.405
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/0d09934d-c272-40e0-b7fc-8a015604d647/7e48c4791acda1a7d5d5fa6ce25e6c2e/dotnet-sdk-8.0.405-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/bb17a3ab-7122-41bd-96cf-33e35b1d4318/7b09327fdd49b7130cf94838f2979aa6/dotnet-sdk-8.0.405-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/a91ddad4-a3c2-4303-9efc-1ca6b7af850c/be1763df9211599df1cf1c6f504b3c41/dotnet-sdk-8.0.405-linux-x64.tar.gz')
sha512sums_armv7h=('f9c422221ce1b9460e4778ee2512b8e38c78eea77e975779af03f82feb5664b94d33c57d103777839b9e772c039419df5eeaa479b55b78d70013542a87d2b602')
sha512sums_aarch64=('07988b784bf71913f607ce0ced50434c69980ae715ca62fb6af68f7eaa26810c3f9ffe24df1d8706d1a557c3eb7756143e5357016089cf1508714baa1cce828a')
sha512sums_x86_64=('2499faa1520e8fd9a287a6798755de1a3ffef31c0dc3416213c8a9bec64861419bfc818f1c1c410b86bb72848ce56d4b6c74839afd8175a922345fc649063ec6')

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
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-8.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-8.0-bin
}

package_aspnet-runtime-8.0-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-8.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-8.0")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-8.0")

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
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-8.0")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-8.0-bin
}

package_dotnet-targeting-pack-8.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-8.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-8.0)

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
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-8.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-8.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-8.0-bin
}
