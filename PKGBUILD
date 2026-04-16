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
pkgver=11.0.0.sdk100+preview.3
_runtimever=11.0.0
_sdkver=11.0.100
_short_ver=11.0
_fullver=11.0.0-preview.3.26207.106
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source=('dotnet.sh')
source_armv7h=('https://builds.dotnet.microsoft.com/dotnet/Sdk/11.0.100-preview.3.26207.106/dotnet-sdk-11.0.100-preview.3.26207.106-linux-arm.tar.gz')
source_aarch64=('https://builds.dotnet.microsoft.com/dotnet/Sdk/11.0.100-preview.3.26207.106/dotnet-sdk-11.0.100-preview.3.26207.106-linux-arm64.tar.gz')
source_x86_64=('https://builds.dotnet.microsoft.com/dotnet/Sdk/11.0.100-preview.3.26207.106/dotnet-sdk-11.0.100-preview.3.26207.106-linux-x64.tar.gz')
sha512sums=('768151c7179fb6a126b3de9cae01e363e8894f6fab384b1e2c5066c2adca4578638983b1b62aea10dd18045e6d6e8f8ea13280481134de94f004a118919b2c06')
sha512sums_armv7h=('f16760b28d64b55cbfab3033168ba2881e928c809dffad68947d93258202de01be0082af2e3601dc4c93e37a8f09974c4b3bc99d94ede88f2f9ea3324aa62d32')
sha512sums_aarch64=('9602f4708306956d90277f6ec9db09583a6b467a59588ba8fa959940e0c25597a4e5850c3fbc5c533bc9c61fc3c53309b25e4648d8a2fb29c50eb0df4653b888')
sha512sums_x86_64=('03a9e6880ecd07301a2ae95e4ebea00df758a80843683ca3a35c4615df32493139fca8c3b820a2285eb1558ec7192dfd0081656089dd0d226138bdc6b98e521a')

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
