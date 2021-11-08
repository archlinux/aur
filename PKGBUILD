# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-5.0-bin
pkgname=(
  'aspnet-runtime-5.0-bin'
  'dotnet-runtime-5.0-bin'
  'dotnet-sdk-5.0-bin'
  'dotnet-targeting-pack-5.0-bin'
  'aspnet-targeting-pack-5.0-bin'
 )
pkgver=5.0.12.sdk403
_runtimever=5.0.12
_sdkver=5.0.403
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/93c86ea7-b04e-4d0f-b65a-3a982768e215/285ab1a46d5c4f2067f86f575262c79f/dotnet-sdk-5.0.403-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/91015c72-ce5a-4840-9e87-5bfa4bb80224/b39692ac418d790ff7a2e092eb07de98/dotnet-sdk-5.0.403-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/b77183fa-c045-4058-82c5-d37742ed5f2d/ddaccef3e448a6df348cae4d1d271339/dotnet-sdk-5.0.403-linux-x64.tar.gz')
sha512sums_armv7h=('1b7b4a8aea62a7fd1e1919710b2b35b41ae31a64f79b4cc056a3e5f4778bb6cc0b92999321e1632f29a1eb88d734e44fc42eea52ddfb8aa0424cafd9796a503c')
sha512sums_aarch64=('6cc705fe45c0d8df6a493eb2923539ef5b62d048d5218859bf3af06fb3934c9c716c16f98ee1a28c818d77adff8430bf39a2ae54a59a1468b704b4ba192234ac')
sha512sums_x86_64=('7ba5f7f898dba64ea7027dc66184d60ac5ac35fabe750bd509711628442e098413878789fad5766be163fd2867cf22ef482a951e187cf629bbc6f54dd9293a4a')

package_dotnet-runtime-5.0-bin() {
  pkgdesc='The .NET Core runtime version 5.0 (binary)'
  depends=("dotnet-host>=${_runtimever}"
           'glibc'
           'icu' 
           'krb5'
           'libcurl.so'
           'libunwind'
           'openssl'
           'zlib'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-5.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-5.0-bin
}

package_aspnet-runtime-5.0-bin() {
  pkgdesc='The ASP.NET Core runtime version 5.0 (binary)'
  depends=('dotnet-runtime-5.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-5.0")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-5.0-bin
}

package_dotnet-sdk-5.0-bin() {
  pkgdesc='The .NET Core SDK version 5.0 (binary)'
  depends=(
    'dotnet-runtime-5.0-bin'
    'glibc'
    'dotnet-targeting-pack-5.0-bin'
    'netstandard-targeting-pack-bin')
  optdepends=('aspnet-targeting-pack-5.0-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk-5.0-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-5.0")
  conflicts=("dotnet-sdk-5.0-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-5.0-bin
}

package_dotnet-targeting-pack-5.0-bin() {
  pkgdesc='The .NET Core targeting pack version 5.0 (binary)'
  depends=(netstandard-targeting-pack-bin)
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-5.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-5.0)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-5.0-bin
}

package_aspnet-targeting-pack-5.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack version 5.0 (binary)'
  depends=(dotnet-targeting-pack-5.0-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-5.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-5.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-5.0-bin
}