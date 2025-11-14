# Maintainer: Pahasara DvNET <pahasaradev[at]proton[dot]me>
# Contributor: Attila Greguss <floyd0122[at]gmail[dot]com>
# Contributor: Nate Plumm <nate[at]ceresta[dot]com>

pkgbase=dotnet-core-10.0-bin
pkgname=(
  'dotnet-host-10.0-bin'
  'aspnet-runtime-10.0-bin'
  'dotnet-runtime-10.0-bin'
  'dotnet-sdk-10.0-bin'
  'netstandard-targeting-pack-10.0-bin'
  'dotnet-targeting-pack-10.0-bin'
  'aspnet-targeting-pack-10.0-bin'
 )
pkgver=10.0.0.sdk100
_runtimever=10.0.0
_sdkver=10.0.100
_short_ver=10.0
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source=('dotnet.sh')
source_armv7h=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm.tar.gz")
source_aarch64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-arm64.tar.gz")
source_x86_64=("https://builds.dotnet.microsoft.com/dotnet/Sdk/${_sdkver}/dotnet-sdk-${_sdkver}-linux-x64.tar.gz")
sha512sums=('768151c7179fb6a126b3de9cae01e363e8894f6fab384b1e2c5066c2adca4578638983b1b62aea10dd18045e6d6e8f8ea13280481134de94f004a118919b2c06')
sha512sums_x86_64=('f78dbac30c9af2230d67ff5c224de3a5dbf63f8a78d1c206594dedb80e6909d2cc8a9d865d5105c72c2fd2aa266fc0c6c77dedac60408cbccf272b116bd11b07')
sha512sums_armv7h=('45f2d7fd05670a5a14fa480889e45920782277575dba0da44c259997d059d64070b40ac7aae9f0c3a3076d9fed5b787854a8abdc2dfdb4783b449c05c1c9b49c')
sha512sums_aarch64=('24fc2b105ab8484c34213ef57ac4e6a36a6593241f0ebc6cf0a40ec2f5fea2d76de85c4b87b2a53814d194e32ec1288dd5053cd6f52768d79cd0ac948cbf84ea')

package_dotnet-host-10.0-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (binary) - .NET 10.0 LTS'
  provides=("dotnet-host=${_runtimever}")
  depends=(
    'gcc-libs'
    'glibc'
  )
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{dotnet,licenses/dotnet-host-10.0}}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-10.0
  ln -sf /usr/share/dotnet/dotnet "${pkgdir}"/usr/bin/dotnet
  ln -sf /usr/share/dotnet/host/fxr/"${_runtimever}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
  install -Dm 644 "${srcdir}"/dotnet.sh -t "${pkgdir}"/etc/profile.d/
}

package_dotnet-runtime-10.0-bin() {
  pkgdesc='The .NET Core runtime (binary) - .NET 10.0 LTS'
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
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-${_short_ver}")
  conflicts=("dotnet-runtime" "dotnet-runtime-${_short_ver}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-10.0-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-10.0-bin
}

package_aspnet-runtime-10.0-bin() {
  pkgdesc='The ASP.NET Core runtime (binary) - .NET 10.0 LTS'
  depends=('dotnet-runtime-10.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-${_short_ver}")
  conflicts=("aspnet-runtime" "aspnet-runtime-${_short_ver}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-10.0-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-10.0-bin
}

package_dotnet-sdk-10.0-bin() {
  pkgdesc='The .NET Core SDK (binary) - .NET 10.0 LTS'
  depends=(
    'glibc'
    'gcc-libs'
    'dotnet-runtime-10.0-bin'
    'dotnet-targeting-pack-10.0-bin'
    'netstandard-targeting-pack-10.0-bin'
    'aspnet-runtime-10.0-bin'
    'aspnet-targeting-pack-10.0-bin'
  )
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-${_short_ver}=${pkgver}")
  conflicts=("dotnet-sdk" "dotnet-sdk-${_short_ver}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-10.0-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-10.0-bin
}

package_netstandard-targeting-pack-10.0-bin() {
  pkgdesc='The .NET Standard targeting pack (binary) - .NET 10.0 LTS'
  provides=('netstandard-targeting-pack-2.1' 'netstandard-targeting-pack')
  conflicts=('netstandard-targeting-pack-2.1' 'netstandard-targeting-pack')

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  if [ -d "packs/NETStandard.Library.Ref" ]; then
    cp -dr --no-preserve='ownership' packs/NETStandard.Library.Ref "${pkgdir}"/usr/share/dotnet/packs/
  fi
  ln -s dotnet-host-10.0-bin "${pkgdir}"/usr/share/licenses/netstandard-targeting-pack-10.0-bin
}

package_dotnet-targeting-pack-10.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary) - .NET 10.0 LTS'
  depends=(netstandard-targeting-pack-10.0-bin)
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-${_short_ver})
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-${_short_ver})

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-10.0-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-10.0-bin
}

package_aspnet-targeting-pack-10.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack (binary) - .NET 10.0 LTS'
  depends=(dotnet-targeting-pack-10.0-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-${_short_ver})
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-${_short_ver})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-10.0-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-10.0-bin
}
