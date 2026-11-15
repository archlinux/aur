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
pkgver=8.0.34.sdk428
_runtimever=8.0.34
_sdkver=8.0.428
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm.tar.gz")
source_aarch64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm64.tar.gz")
source_x86_64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-x64.tar.gz")
sha512sums_armv7h=('8b8e4fc8dd59adaa3f8c087c5d40ac2e0cbf5d8c3b88f1910f2032ae5baeda96ba0fd5fa3d17543f21f7dec882aa6cdc38a7d5f48cb4b411077448ac0a5fdc9c')
sha512sums_aarch64=('bcc10091e404baaec01d538be8bd7125a33a8338594a6a795b1036128ace747a450d3f1482f16210b6a7ee937b911488676109156ec2c905ce31030badb1b0f2')
sha512sums_x86_64=('33212bb99a2bf003973d41106c7e8fe94208a12958ff601d4a476be379403c85a7dc9183a6ec64dfb44ded7102965be09f35add1758e68e9251bae7891d7b7bf')

package_dotnet-runtime-8.0-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=(
  	"dotnet-host>=${_runtimever}"
    'libgcc'
    'libstdc++'
    'glibc'
    'icu'
    'krb5'
    'libunwind'
    'zlib'
    'openssl'
  )
  optdepends=('lttng-ust2.12: CoreCLR tracing')
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
    'libgcc'
    'libstdc++'
    'dotnet-runtime-8.0-bin'
    'dotnet-targeting-pack-8.0-bin'
    'netstandard-targeting-pack')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-8.0")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-8.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  install -dm 755 "${pkgdir}"/usr/share/dotnet/metadata/workloads/"${_sdkver}"
  touch "${pkgdir}"/usr/share/dotnet/metadata/workloads/"${_sdkver}"/userlocal
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
