# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-5.0-bin
pkgname=(
  'aspnet-runtime-5.0-bin'
  'dotnet-runtime-5.0-bin'
  'dotnet-sdk-5.0-bin'
  'dotnet-targeting-pack-5.0-bin'
  'aspnet-targeting-pack-5.0-bin'
 )
pkgver=5.0.14.sdk405
_runtimever=5.0.14
_sdkver=5.0.405
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/05835b75-b3a8-446f-b436-5d4ca73a07ff/3c97bef6e58a5bd84ed9df3f625cd6bc/dotnet-sdk-5.0.405-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/3c0011b6-9ec7-484e-9485-56512752c5b5/06c6163c7481da86a15811355ba8beaa/dotnet-sdk-5.0.405-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/e10f8ecd-eb2c-42a0-a217-98a18517e12c/436b90a4d5be20456b210c406c0f7718/dotnet-sdk-5.0.405-linux-x64.tar.gz')
sha512sums_armv7h=('a84eaa3ae75377bf9c6853c58187888324ca412a51bf7f3f96b1fdefb4dbbc02d4d0e71e5e6cbd07b4124684cda054ec14910cbc220d1120845ec6219d7e0636')
sha512sums_aarch64=('f53ee4bc1b5f79300072f4e8f71eccad5f9bd72cef7c792540309f98dd4fc175647422d16f2f48d0645474aae4a10e33646f0d4b74461656a49d34d765e71451')
sha512sums_x86_64=('be1b3b2c213937d5d17ed18c6bd3f8fab2d66593642caf14229d12f68ddfa304edb4d88ce735ee0347969dc79a9e3d7d8cddfb5ff2044177cda0f2072ed8bd47')

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