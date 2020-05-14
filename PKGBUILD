# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-bin
pkgname=('dotnet-host-bin' 'aspnet-runtime-bin' 'dotnet-runtime-bin' 'dotnet-sdk-bin')
pkgver=3.1.4.sdk202
_runtimever=3.1.4
_sdkver=3.1.202
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source=('dotnet.sh')
sha512sums=('448e2ad41a1ac5b7adf4a17ef27d01d1f20c6d355fdb1e10b0ceb4bd6edd8b3a24874aa8c42cfcf56267a6a85c5896b5f69764e5e59526f6938ec7c9d1ec7383')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/647e322c-e198-4bff-ba2a-a1a5b8477033/87b7b0af543dba7048a57ee2ab5a31ee/dotnet-sdk-3.1.202-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/15434752-2803-4722-b406-9a62d3e089d5/159bd7713f8a7ff82d7b2f756ae87f4f/dotnet-sdk-3.1.202-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/7d4c708b-38db-48b2-8532-9fc8a3ab0e42/23229fd17482119822bd9261b3570d87/dotnet-sdk-3.1.202-linux-x64.tar.gz')
sha512sums_armv7h=('6a978081468458fb08f405e11d39067f2dab3ec1b9ed9d033f7e74ddf8e700eb15c9c3d86d8fba5dbcf44f03b06c7f4a5d84b531e7d57a75d7a4f4cdc7f98992')
sha512sums_aarch64=('b570a423522de777d05de67410cea7d6d54461b7e2b82a18f4ca21093897836447f215b2737df909ee581508fbd1a61993f3ea1d9856b9a883caed3f7086f0a6')
sha512sums_x86_64=('c59265d42c7277e6368ee69cb58895f43f812f584ecd0b01b4045613abb74c21f281f5a851f012625064052cb79e0f84fb5385b5f7cb4dc4ac8970ee4ee4ba71')

package_dotnet-host-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (binary)'
  provides=("dotnet-host")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{dotnet,licenses/dotnet-host}}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/usr/share/dotnet
  ln -sf /usr/share/dotnet/dotnet.sh "${pkgdir}"/usr/bin/dotnet
  ln -sf /usr/share/dotnet/host/fxr/"${_runtimever}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
}

package_dotnet-runtime-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=('dotnet-host' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-bin" "dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")
  conflicts=("dotnet-runtime-bin" "dotnet-runtime=${_runtimever}" "dotnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime
}

package_aspnet-runtime-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-bin')
  provides=("aspnet-runtime-bin" "aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")
  conflicts=("aspnet-runtime-bin" "aspnet-runtime=${_runtimever}" "aspnet-runtime-3.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime
}

package_dotnet-sdk-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=('dotnet-runtime-bin' 'glibc')
  provides=("dotnet-sdk-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  conflicts=("dotnet-sdk-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-3.1")
  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' packs sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk
}