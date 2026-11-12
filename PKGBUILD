# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# armv7h and aarch64 Comaintainers needed

pkgbase=dotnet-core-10.0-bin
pkgname=(
  'aspnet-runtime-10.0-bin'
  'dotnet-runtime-10.0-bin'
  'dotnet-sdk-10.0-bin'
  'dotnet-targeting-pack-10.0-bin'
  'aspnet-targeting-pack-10.0-bin'
 )
pkgver=10.0.15.sdk404
_runtimever=10.0.15
_sdkver=10.0.404
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm.tar.gz")
source_aarch64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm64.tar.gz")
source_x86_64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-x64.tar.gz")
sha512sums_armv7h=('8842c932018ecd242a27128183a89f9729671c07fd3b5a0ea6a1149289abfd110572a5a488ebfa4da6b9b6212ba94dc085ac7c606dd4e7d504b8a4a6c54cf741')
sha512sums_aarch64=('3533a3869da219cac45c567aadac3d8e96cdf1c6a04fe1c1d5fdeefea5d45af8424488f0144730d11b4a751f7ad546fb11e4c2b2725cd8401efee726711f8f11')
sha512sums_x86_64=('577d0eb17fec33d029104c5c63a1ab0accc3e28776274abef2218dbac5af18d2109b5406d26b31d76f5c245215e3ba0926a94c20246c672c41847c9e1eb1dc50')

package_dotnet-runtime-10.0-bin() {
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
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-10.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-10.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-10.0-bin
}

package_aspnet-runtime-10.0-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-10.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-10.0")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-10.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-10.0-bin
}

package_dotnet-sdk-10.0-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'dotnet-runtime-10.0-bin'
    'dotnet-targeting-pack-10.0-bin'
    'netstandard-targeting-pack')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-10.0")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-10.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  install -dm 755 "${pkgdir}"/usr/share/dotnet/metadata/workloads/"${_sdkver}"
  touch "${pkgdir}"/usr/share/dotnet/metadata/workloads/"${_sdkver}"/userlocal
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-10.0-bin
}

package_dotnet-targeting-pack-10.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-10.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-10.0)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-10.0-bin
}

package_aspnet-targeting-pack-10.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack (binary)'
  depends=(
    'dotnet-targeting-pack-10.0-bin'
  )
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-10.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-10.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-10.0-bin
}
