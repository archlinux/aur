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
pkgver=7.0.20.sdk410
_runtimever=7.0.20
_sdkver=7.0.410
pkgrel=2
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://builds.dotnet.microsoft.com/dotnet/Sdk/7.0.410/dotnet-sdk-7.0.410-linux-arm.tar.gz')
source_aarch64=('https://builds.dotnet.microsoft.com/dotnet/Sdk/7.0.410/dotnet-sdk-7.0.410-linux-arm64.tar.gz')
source_x86_64=('https://builds.dotnet.microsoft.com/dotnet/Sdk/7.0.410/dotnet-sdk-7.0.410-linux-x64.tar.gz')
sha512sums_armv7h=('95b639a1475d9b7637d41a14c0cab3993b3a2b4be63dbf251ffef840461c51d9d5ecd78ef09c857fe28399155f7a40449e08c7a33ce08850c4e18efaabab45ac')
sha512sums_aarch64=('2db6a3b9a532d2f59a2b459e634206913a9585c821f3f578a421e3bae346a92dd9b85b76ebde343ca3057275f7ec4d0bca71cbb7f2badb6dcdb516244e84da46')
sha512sums_x86_64=('20b8e02979328e4c4a14493f7791ed419aabd0175233db80cd60e2c004b829b3e8301281ea86b27ba818372473accf5a6d553e5354c54917c8e84d25f5855caa')

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
  provides=("dotnet-runtime-7.0")
  conflicts=("dotnet-runtime-7.0")

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
  provides=("dotnet-sdk-7.0")
  conflicts=("dotnet-sdk-7.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-7.0-bin
}

package_dotnet-targeting-pack-7.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(dotnet-targeting-pack-7.0)
  conflicts=(dotnet-targeting-pack-7.0)

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
  provides=(aspnet-targeting-pack-7.0)
  conflicts=(aspnet-targeting-pack-7.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-7.0-bin
}
