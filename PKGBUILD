# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-3.1
pkgname=(
  'aspnet-runtime-3.1'
  'dotnet-runtime-3.1'
  'dotnet-sdk-3.1'
  'dotnet-targeting-pack-3.1'
  'aspnet-targeting-pack-3.1'
 )
pkgver=3.1.11.sdk405
_runtimever=3.1.11
_sdkver=3.1.405
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/2178c8a1-ad48-4e51-9ddd-4e3ab64d1f0e/68746abefadf62be43ca525653c915a1/dotnet-sdk-3.1.405-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/ebb398e7-06d1-48f9-94e7-ddae049b704f/6bb78627f0337b980ece2a3181963fbd/dotnet-sdk-3.1.405-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/5de23f6d-648c-455b-a7a9-d11c9a5bca40/4836262466f2d288e8ad8647944d062f/dotnet-sdk-3.1.405-linux-x64.tar.gz')
sha512sums_armv7h=('110f595a835ebc5c974fcb24e5ed7b81461288ddcf6b3a0dcead3f22b6995698dab767304e0bd98d3c450a297db8f04b185bbaa0d310fc9f1d3f9c3157fdac06')
sha512sums_aarch64=('e720b7c6497da52ce4a927b1a29df5c180fbf5b4f800185de61a31092c0bfa18a78bb9c2fee744fabc78214c5be6e9277f3dc14ae1426b55274f9726997fc733')
sha512sums_x86_64=('924ec0ab3f126d340ef37fe90263a91f31218995716d1ad5a817bdc6ef71e4d8e87a91edeeb785f5dff3912cc08fe87615718986bb5540ff23e9edf2302e38dd')

package_dotnet-runtime-3.1() {
  pkgdesc='The .NET Core runtime 3.1 (binary)'
  depends=('dotnet-host'
           'glibc'
           'icu' 
           'krb5'
           'libcurl.so'
           'libunwind'
           'openssl'
           'zlib'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/dotnet-runtime-3.1
}

package_aspnet-runtime-3.1() {
  pkgdesc='The ASP.NET Core runtime 3.1 (binary)'
  depends=('dotnet-runtime-3.1')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-3.1
}

package_dotnet-sdk-3.1() {
  pkgdesc='The .NET Core SDK 3.1 (binary)'
  depends=(
    'dotnet-runtime-3.1'
    'glibc'
    'dotnet-targeting-pack-3.1'
    'netstandard-targeting-pack-2.1')
  optdepends=('aspnet-targeting-pack-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/dotnet-sdk-3.1
}

package_dotnet-targeting-pack-3.1() {
  pkgdesc='The .NET Core targeting pack 3.1 (binary)'
  depends=(netstandard-targeting-pack-2.1)
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-3.1)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-3.1)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-3.1
}

package_aspnet-targeting-pack-3.1() {
  pkgdesc='The ASP.NET Core targeting pack 3.1 (binary)'
  depends=(dotnet-targeting-pack-3.1)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-3.1)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-3.1)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-3.1 "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-3.1
}