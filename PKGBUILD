# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-preview
pkgname=('dotnet-host-preview' 'aspnet-runtime-preview' 'dotnet-runtime-preview' 'dotnet-sdk-preview')
pkgver=5.0.0+100+preview.6.20318.15
_runtimever=5.0.0-preview.6.20305.6
_sdkver=5.0.100-preview.6.20318.15
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source=('dotnet.sh')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/ec4bba83-4586-4705-a6ae-c648861ca284/d9470c2f68161e3c2b8a0785fe7b3329/dotnet-sdk-5.0.100-preview.6.20318.15-linux-x64.tar.gz')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/fc54f62e-c7bd-43a3-a27b-4afb08bc4d6f/b01ccacf3d94efc0bbe26f64f7fde9b7/dotnet-sdk-5.0.100-preview.6.20318.15-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/164ecfcc-df44-476f-a161-340201aa6fa8/7200eb764dc9ff546d384e3188f98a53/dotnet-sdk-5.0.100-preview.6.20318.15-linux-arm64.tar.gz')
sha512sums=('448e2ad41a1ac5b7adf4a17ef27d01d1f20c6d355fdb1e10b0ceb4bd6edd8b3a24874aa8c42cfcf56267a6a85c5896b5f69764e5e59526f6938ec7c9d1ec7383')
sha512sums_x86_64=('ae68221770e8f199880f00a29d72c624aaedc0c3ca61a7b543a6555acf27eca4c0c24fbd4eddc1322d7dcb4f342325b1d1521c590556bd95c3c2ec653b914dbb')
sha512sums_armv7h=('1dd5c4f90d43983f1b6ccfa7631fd70afe99b26c1111d191dccb860bcfa232052c3589147f730b583b3f498bcd1116a131fae462267b68a00c10d7e7d832e65f')
sha512sums_aarch64=('2a1039c4a94abd33949176407edee84dbd54053b56c7e2d8b69e7cf28e16f89013036cf662403ea8f2ea593b9b1b702e464762d9670da12507d1c1e06a58c04f')

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
  depends=('dotnet-sdk-3.1' 'dotnet-runtime-preview' 'glibc')
  provides=("dotnet-sdk-preview" "dotnet-sdk=${_sdkver%-*}" "dotnet-sdk-5.0")
  conflicts=("dotnet-sdk-preview" "dotnet-sdk=${_sdkver%-*}" "dotnet-sdk-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' packs/{Microsoft.AspNetCore.App.Ref,Microsoft.NETCore.App.Host.linux-x64,Microsoft.NETCore.App.Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview "${pkgdir}"/usr/share/licenses/dotnet-sdk-preview
}
