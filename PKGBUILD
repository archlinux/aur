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
pkgver=10.0.0.sdk100+preview.3
_runtimever=10.0.0
_sdkver=10.0.100
_short_ver=10.0
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source=('dotnet.sh')
source_armv7h=('https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.100-preview.3.25201.16/dotnet-sdk-10.0.100-preview.3.25201.16-linux-arm.tar.gz')
source_aarch64=('https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.100-preview.3.25201.16/dotnet-sdk-10.0.100-preview.3.25201.16-linux-arm64.tar.gz')
source_x86_64=('https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.100-preview.3.25201.16/dotnet-sdk-10.0.100-preview.3.25201.16-linux-x64.tar.gz')
sha512sums=('768151c7179fb6a126b3de9cae01e363e8894f6fab384b1e2c5066c2adca4578638983b1b62aea10dd18045e6d6e8f8ea13280481134de94f004a118919b2c06')
sha512sums_armv7h=('9409d8a906bae261b22f272cc80a1b41b8be7726437708815944e232396f0f889b874df37b3c28e6158002d2ae578f36c808d7670622a9f5cb9242df66fffc5c')
sha512sums_aarch64=('9e1f7ddd98d468f937b74469397b1fc1238c4174b94dc5a78e61c6984359f594dcfd0c248e502ebda165ec6100198ebb797b1da08be47320ce926612318b65ea')
sha512sums_x86_64=('aaad778cc80f5e5f023cbdab47af67703214a7a1900d12782f5d956f8623de1bd3801026727fbb5ecf84fbc885185daad92832b47da3b6514a45aa56fa971156')

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
  ln -sf /usr/share/dotnet/host/fxr/"${_runtimever}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
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
