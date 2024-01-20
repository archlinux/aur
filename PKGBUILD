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
pkgver=7.0.15.sdk405
_runtimever=7.0.15
_sdkver=7.0.405
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/5c1865fa-7197-4177-8807-91ed2f1689f2/a2846ac164072b7a0401102bdce49f91/dotnet-sdk-7.0.405-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/bdfe4e91-3a24-421f-881a-47b6d91404cb/cfe786933a6a7fd358b799af23542827/dotnet-sdk-7.0.405-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/5202b091-2406-445c-b40a-68a5b97c882b/b509f2a7a0eb61aea145b990b40b6d5b/dotnet-sdk-7.0.405-linux-x64.tar.gz')
sha512sums_armv7h=('4e593c52a32f79b43339b2dc43f000b8b991a8ff3e56abfe686292a0db5e084bfa8189d5770b4ae6aff66c4006bd56b8214a7ae33ceff426d5a59d96f4035c2b')
sha512sums_aarch64=('35c3b0036324f0d5a1711859f318863a2f24dd43d61518b38acffe9e278ee203007bf620d783ac706a615175b9c15d348cb9386c800aac219fb23537c03b919b')
sha512sums_x86_64=('6cdf82af56f920c87315209f5b5166126e97b13b6d715b6507ddbc9a2eb618f812e43686b79de810ae6a21e0fb5a8e04d68a004f00a07533c8b664f9c889b5b0')

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
