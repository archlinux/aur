# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-6.0-bin
pkgname=(
  'aspnet-runtime-6.0-bin'
  'dotnet-runtime-6.0-bin'
  'dotnet-sdk-6.0-bin'
  'dotnet-targeting-pack-6.0-bin'
  'aspnet-targeting-pack-6.0-bin'
 )
pkgver=6.0.13.sdk405
_runtimever=6.0.13
_sdkver=6.0.405
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/0cd0c511-c215-48d4-a2a6-e2c94b208605/56b7da0b2c8240ec30001df55d1891d8/dotnet-sdk-6.0.405-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/c05dfb39-64d7-42cb-8caa-d669c0509c9b/d498099b33fd336d01e28c38515cb21d/dotnet-sdk-6.0.405-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/c7f21771-9b09-4c81-883b-90dff8760c1e/fe992d38a94cc6f301c0236db3920c0a/dotnet-sdk-6.0.405-linux-x64.tar.gz')
sha512sums_armv7h=('c35fb905495f6eaf8b26ea6d61bcc59a56da8e7f3ac70dc8e620553d4baea81f65412bbed1099a724b22a118e09c4e290510434ac593d2cf6cf18db7cf370268')
sha512sums_aarch64=('6c31666a95817a7049bd47717c9cf9ab159e94e90987f46883e272dc6dee92fb0d890f4e590faca4458cd2b3943133fb2fa58c2fc175db98d4c6c531f6b2c3c3')
sha512sums_x86_64=('44e719c67dd06c73a8736ab63423d735850bc607adf4b8a9f4123945b13014f8144b4fb2c4cfe790d323106b7ce604388cc5d617bc153fd7820878b9187a2cd4')

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
  depends=(netstandard-targeting-pack-bin)
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
  depends=(dotnet-targeting-pack-6.0-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-6.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-6.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-6.0-bin
}
