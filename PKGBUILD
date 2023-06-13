# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# armv7h and aarch64 Comaintainers needed

pkgbase=dotnet-core-6.0-bin
pkgname=(
  'aspnet-runtime-6.0-bin'
  'dotnet-runtime-6.0-bin'
  'dotnet-sdk-6.0-bin'
  'dotnet-targeting-pack-6.0-bin'
  'aspnet-targeting-pack-6.0-bin'
 )
pkgver=6.0.18.sdk410
_runtimever=6.0.18
_sdkver=6.0.410
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/5e96f312-9963-4aae-98c5-38bb1cf3020d/9c5fa4d735eb7af674a365821525b503/dotnet-sdk-6.0.410-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/bf758689-351e-4857-8e9d-b2f155577bcf/759401b27c3c68d3ae344d2112bf9057/dotnet-sdk-6.0.410-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/ac5809b0-7930-4ae9-9005-58f2fd7912f3/4cf0cb18d22a162b33149b1f28a8e045/dotnet-sdk-6.0.410-linux-x64.tar.gz')
sha512sums_armv7h=('3869ed4526c0758999a11cab20ce943239d0c45b330cc28c24c6b6917454b5a417aeb75a02ec974a5e638103554d5e8b839c2eb3f436591ea018b4a8abdc336a')
sha512sums_aarch64=('75776b101672714f4e919b71313c3abba6f9b8a14d36751b31fb5400106e87d55e3aa45c1bf25be26a40847637f583815e40d61a837bebda66f30b88294f7e49')
sha512sums_x86_64=('8c85f5b10eb786c8cf31bf268131a2345a295d88d318310dc8457d831f0a587ec1600e43beb7f55aec2248483b9a95e905a468b592f0c910443b4aaa9baeb2e3')

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
  depends=(
    'netstandard-targeting-pack'
  )
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
  depends=(
    'dotnet-targeting-pack-6.0-bin'
  )
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-6.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-6.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-6.0-bin
}
