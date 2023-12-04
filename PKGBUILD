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
pkgver=7.0.14.sdk404
_runtimever=7.0.14
_sdkver=7.0.404
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/6d070d9e-6748-49b4-8ebb-cfd74c25b89c/530fb7c5244e9a1ac798820335c58c35/dotnet-sdk-7.0.404-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/2157e304-6f7a-4646-8886-05cc0dba157d/4cecdaeec9fd4715d0eee8987f406c21/dotnet-sdk-7.0.404-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/9c3e1dcb-485a-44cf-b1cb-d6c0b643d805/d4b2a46283254b6d68f61ee3f1a06952/dotnet-sdk-7.0.404-linux-x64.tar.gz')
sha512sums_armv7h=('25a5a4ba918be181fbe58b4e5c5b385c4825837ed0e3778b01754c35f0d2651ec71873697f8781e91adad9177c366a179c34378418d4736366c978115ca0a32b')
sha512sums_aarch64=('b7131829d08dadbfd3b55a509e2d9a9de90b7447e27187bd717cebf1b134bd0ddfcb9285032f2ce08bd427487125e8b3e9cdc99b7f92436901e803e65f1581de')
sha512sums_x86_64=('f5c122044e9a107968af1a534051e28242f45307c3db760fbb4f3a003d92d8ea5a856ad4c4e8e4b88a3b6a825fe5e3c9e596c9d2cfa0eca8d5d9ee2c5dad0053')

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
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-7.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-7.0")

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
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-7.0")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-7.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-7.0-bin
}

package_dotnet-targeting-pack-7.0-bin() {
  pkgdesc='The .NET Core targeting pack (binary)'
  depends=(
    'netstandard-targeting-pack'
  )
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-7.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-7.0)

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
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-7.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-7.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-7.0-bin
}
