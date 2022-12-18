# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-6.0-bin
pkgname=(
  'aspnet-runtime-6.0-bin'
  'dotnet-runtime-6.0-bin'
  'dotnet-sdk-6.0-bin'
  'dotnet-targeting-pack-6.0-bin'
  'aspnet-targeting-pack-6.0-bin'
 )
pkgver=6.0.12.sdk404
_runtimever=6.0.12
_sdkver=6.0.404
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/58ebc46e-68d7-44db-aaea-5f5cb66a1cb5/44d292c80c0e13c444e6d66d67ca213e/dotnet-sdk-6.0.404-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/1055ed3b-6d81-42b8-bfaf-594baf240ec0/37f4c7113ec851f20569bb7435cd527b/dotnet-sdk-6.0.404-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/40bc5873-1a39-4a47-9df5-b481869594a6/8455eab2092cc1321ac055f016ef90cf/dotnet-sdk-6.0.404-linux-x64.tar.gz')
sha512sums_armv7h=('1b9b5e0c45f90a4c752bf6990e5dda4110403a62392dc78abf9145c69b1d329b2630945a88cb4d7756322b188b7f4a9334bfc376067edff5dcfabfd85098d7d8')
sha512sums_aarch64=('7c58595aa57b655ff5a268ae4fc680ff3fb15a84dcc0ce84ae7eb25ba27bf66f0c5273c985f15034583f5b05437a5354db68c4064953030dc4caebb11339ac76')
sha512sums_x86_64=('7a0f4b308d3fe98df9b426b0f8f8fb7bd7247244af3570e867a3969349c62c7ea4c6da81a1a2280788e300784167a2933db523f461985aef0681e0cf14bf8f0d')

package_dotnet-runtime-6.0-bin() {
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
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-6.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-6.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-6.0-bin
}

package_aspnet-runtime-6.0-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-6.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-6.0")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-6.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-6.0-bin
}

package_dotnet-sdk-6.0-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=(
    'glibc'
    'gcc-libs'
    'dotnet-runtime-6.0-bin'
    'dotnet-targeting-pack-6.0-bin'
    'netstandard-targeting-pack')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-6.0")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-6.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-6.0-bin
}

package_dotnet-targeting-pack-6.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(netstandard-targeting-pack-bin)
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-6.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-6.0)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-6.0-bin
}

package_aspnet-targeting-pack-6.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack (binary)'
  depends=(dotnet-targeting-pack-6.0-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-6.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-6.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-6.0-bin
}
