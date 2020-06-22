# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-preview
pkgname=('dotnet-host-preview' 'aspnet-runtime-preview' 'dotnet-runtime-preview' 'dotnet-sdk-preview')
pkgver=5.0.0+100+preview.5.20279.10
_runtimever=5.0.0-preview.5.20278.1
_sdkver=5.0.100-preview.5.20279.10
pkgrel=2
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source=('dotnet.sh')
sha512sums=('448e2ad41a1ac5b7adf4a17ef27d01d1f20c6d355fdb1e10b0ceb4bd6edd8b3a24874aa8c42cfcf56267a6a85c5896b5f69764e5e59526f6938ec7c9d1ec7383')
sha512sums_x86_64=('0ee982dd7b6015d05c04a33ffba77fa9f61863578c5fd7c4b3847043da2fd17c36b2f8535af53f46dee66e9e59a52f5e7c995af7f9a69fbd3abbc524aca5931b')
sha512sums_armv7h=('6256e013e0e1a153671b9ac3afb49db2646d5e9710112626f52f91070e9832fd17c475414387c6d544dadf2b62df342400d7c34ac01e7a1807d53587ac2d0bc8')
sha512sums_aarch64=('426caa42f586f5213169828c8ee049f10bb8ee0aa1c8961d006396e74c995f0cadc88c9dffeb13f573f3b21bdd9a11279adb0f00bccd20f38da66153b8be43d0')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/6fb3f700-22ed-43d8-8f54-8152f359054b/050d3254d477aeb124a45d0cb13f864d/dotnet-sdk-5.0.100-preview.5.20279.10-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/a529731c-7c51-42f4-9386-46c6466019dc/e408a0275c2333ae29a6e31c00c1ae64/dotnet-sdk-5.0.100-preview.5.20279.10-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/7cf9fa3e-af03-4181-baab-e04ed4b05268/fd44776a5169d6b126ee11d6140691be/dotnet-sdk-5.0.100-preview.5.20279.10-linux-x64.tar.gz')

package_dotnet-host-preview() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview, binary)'
  provides=('dotnet-host' "dotnet-host=${_runtimever%-*}")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{dotnet,licenses/dotnet-host-preview}}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-preview
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/usr/share/dotnet
  ln -sf /usr/share/dotnet/dotnet.sh "${pkgdir}"/usr/bin/dotnet
  ln -sf /usr/share/dotnet/host/fxr/"${_runtimever}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
}

package_dotnet-runtime-preview() {
  pkgdesc='The .NET Core runtime (preview, binary)'
  depends=("dotnet-host>=${_runtimever%-*}" 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-preview" "dotnet-runtime=${_runtimever%-*}" "dotnet-runtime-5.0")
  conflicts=("dotnet-runtime-preview" "dotnet-runtime=${_runtimever%-*}" "dotnet-runtime-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview
}

package_aspnet-runtime-preview() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=('dotnet-runtime-preview')
  provides=("aspnet-runtime-preview" "aspnet-runtime=${_runtimever%-*}" "aspnet-runtime-5.0")
  conflicts=("aspnet-runtime-preview" "aspnet-runtime=${_runtimever%-*}" "aspnet-runtime-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/aspnet-runtime-preview
}

package_dotnet-sdk-preview() {
  pkgdesc='The .NET Core SDK (preview, binary)'
  depends=('dotnet-sdk=3.1' 'dotnet-runtime-preview' 'glibc')
  provides=("dotnet-sdk-preview" "dotnet-sdk=${_sdkver%-*}" "dotnet-sdk-5.0")
  conflicts=("dotnet-sdk-preview" "dotnet-sdk=${_sdkver%-*}" "dotnet-sdk-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' packs/{Microsoft.AspNetCore.App.Ref,Microsoft.NETCore.App.Host.linux-x64,Microsoft.NETCore.App.Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-sdk-preview
}
