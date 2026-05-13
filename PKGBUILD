# Maintainer: Aaron Robinson <aaronrobin1234@gmail.com>
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Attila Greguss <floyd0122[at]gmail[dot]com>

# based almost entirely on the PKGBUILD from dotnet-core-bin

pkgbase=dotnet-preview-bin
pkgname=(
  'dotnet-host-preview-bin'
  'aspnet-runtime-preview-bin'
  'dotnet-runtime-preview-bin'
  'dotnet-sdk-preview-bin' 
  'dotnet-targeting-pack-preview-bin'
  'aspnet-targeting-pack-preview-bin'
 )
pkgver=11.0.0.sdk100+preview.4
_runtimever=11.0.0
_sdkver=11.0.100
_short_ver=11.0
_fullver=11.0.0-preview.4.26230.115
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source=('dotnet.sh')
source_armv7h=('https://builds.dotnet.microsoft.com/dotnet/Sdk/11.0.100-preview.4.26230.115/dotnet-sdk-11.0.100-preview.4.26230.115-linux-arm.tar.gz')
source_aarch64=('https://builds.dotnet.microsoft.com/dotnet/Sdk/11.0.100-preview.4.26230.115/dotnet-sdk-11.0.100-preview.4.26230.115-linux-arm64.tar.gz')
source_x86_64=('https://builds.dotnet.microsoft.com/dotnet/Sdk/11.0.100-preview.4.26230.115/dotnet-sdk-11.0.100-preview.4.26230.115-linux-x64.tar.gz')
sha512sums=('768151c7179fb6a126b3de9cae01e363e8894f6fab384b1e2c5066c2adca4578638983b1b62aea10dd18045e6d6e8f8ea13280481134de94f004a118919b2c06')
sha512sums_armv7h=('005eac84e3e16aaeeb4377e3b882ab9ce3af076735ca5aae7230c4f61c185365438d05e4f05945c8d5c31ceed356e184b55e8feb046b01dcad651e85fe0913c8')
sha512sums_aarch64=('f0488bfd17cc9dbb53cf4390505ffde58efd286af8d9599f53b6c652990c726dcf7bba0499982aa9e2d9fe2208f43166d145ec80ac26397047ae178f28d0e2f3')
sha512sums_x86_64=('f4c74518bc9c8b92b18fbae299c7916b16d8ffad0f3e1768fb76f8c3b7b4ad3875bb8718ae2311083324fa8d58d6adcfcc3e4aed177f269432b72e7b3a9dd8ae')

package_dotnet-host-preview-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview, binary)'
  provides=("dotnet-host" "dotnet-host=${_runtimever}")
  depends=(
    'gcc-libs'
    'glibc'
  )
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{dotnet,licenses/dotnet-host}}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host
  ln -sf /usr/share/dotnet/dotnet "${pkgdir}"/usr/bin/dotnet
  ln -sf /usr/share/dotnet/host/fxr/"${_fullver}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
  install -Dm 644 "${srcdir}"/dotnet.sh -t "${pkgdir}"/etc/profile.d/
}

package_dotnet-runtime-preview-bin() {
  pkgdesc='The .NET Core runtime (preview, binary)'
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
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-${_short_ver}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview-bin
}

package_aspnet-runtime-preview-bin() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=('dotnet-runtime-preview-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-${_short_ver}")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-${_short_ver}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-preview-bin
}

package_dotnet-sdk-preview-bin() {
  pkgdesc='The .NET Core SDK (preview, binary)'
  depends=(
    'glibc'
    'gcc-libs'
    'dotnet-runtime-preview-bin'
    'dotnet-targeting-pack-preview-bin'
    'netstandard-targeting-pack'
    'aspnet-runtime-preview-bin'
    'aspnet-targeting-pack-preview-bin'
  )
  provides=("dotnet-sdk-preview-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-${_short_ver}=${pkgver}")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-${_short_ver}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  # this might cause problems? but since dotnet-sdk-bin also provides these files, i will remove them here
  rm -rf "${pkgdir}"/usr/share/dotnet/sdk-manifests/8.0.100
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-preview-bin
}

package_dotnet-targeting-pack-preview-bin() {
  pkgdesc='The .NET Core targeting pack (preview, binary)'
  depends=(netstandard-targeting-pack)
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-${_short_ver})
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-${_short_ver})

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-preview-bin
}

package_aspnet-targeting-pack-preview-bin() {
  pkgdesc='The ASP.NET Core targeting pack (preview, binary)'
  depends=(dotnet-targeting-pack-preview-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-${_short_ver})
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-${_short_ver})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-preview-bin
}
