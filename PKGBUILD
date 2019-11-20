# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-bin
pkgname=('dotnet-host-bin' 'aspnet-runtime-bin' 'dotnet-runtime-bin')
pkgver=3.0.0
pkgrel=5
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source=('dotnet.sh')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/8ddb8193-f88c-4c4b-82a3-39fcced27e91/b8e0b9bf4cf77dff09ff86cc1a73960b/dotnet-sdk-3.0.100-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/cbc83a0e-895c-4959-99d9-21cd11596e64/b0e59c2ba2bd3ef0f592acbeae7ab27d/dotnet-sdk-3.0.100-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/886b4a4c-30af-454b-8bec-81c72b7b4e1f/d1a0c8de9abb36d8535363ede4a15de6/dotnet-sdk-3.0.100-linux-x64.tar.gz')
sha512sums=('a6ee992d7ab08adb916f0b5d72d203f8ab38cfa2e354f062d499d4d8a64ab2b95e5511a041d859331e560f45c5bb642c2f118951e2104f362e10b31cf07e95b0')
sha512sums_armv7h=('c81dddb0b2db8e29762f222f8dc15b8f3fdf939226c4015d2d919b8faaece503c7bbe0ceeec3e8dc27ad9ca29d027bb1164ac9901f7bbf9c5e4a793e4111d45d')
sha512sums_aarch64=('18c3bc07c4486381f54d4b40eb8401bf56c14fef5febc4639e3134d74ce66172d1e66c2dea9684ad727f08e9dd7e89d74535a8642fb2a2203445483293f3b3c3')
sha512sums_x86_64=('766da31f9a0bcfbf0f12c91ea68354eb509ac2111879d55b656f19299c6ea1c005d31460dac7c2a4ef82b3edfea30232c82ba301fb52c0ff268d3e3a1b73d8f7')

package_dotnet-host-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (binary)'
  provides=("dotnet-host=${pkgver%+*}")
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses/dotnet-host-bin,usr/bin,usr/lib}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/opt/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-bin
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/opt/dotnet
  ln -sf /opt/dotnet/dotnet.sh "${pkgdir}"/usr/bin/dotnet
  ln -sf /opt/dotnet/host/fxr/"${pkgver}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
}

package_dotnet-runtime-bin() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=('dotnet-host>=3.0.0' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-bin
}

package_aspnet-runtime-bin() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime=3.0.0')
  provides=("aspnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-bin
}

#package_dotnet-sdk-bin() {
#  pkgdesc='The .NET Core SDK (binary)'
#  depends=('dotnet-runtime=3.0.0')
#  provides=("dotnet-sdk=3.0.100")

#  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
#  cp -dr --no-preserve='ownership' packs sdk templates "${pkgdir}"/opt/dotnet/
#  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-bin
#}
