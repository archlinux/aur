# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-lts
pkgver=1.0.4
pkgrel=1
pkgdesc="Provides the Long Term Service (LTS) versions of .NET core shared framework, i.e. coreclr and corefx."
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
groups=()
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'openssl' 'curl')
makedepends=('cmake' 'make' 'clang' 'llvm' 'gettext')
provides=('dotnet=1.0.4')
conflicts=('dotnet-bin')
replaces=()
backup=()
options=(staticlibs)
install=

source=(
  "coreclr-${pkgver}.tar.gz::https://github.com/dotnet/coreclr/archive/v${pkgver}.tar.gz"
  "corefx-${pkgver}.tar.gz::https://github.com/dotnet/corefx/archive/v${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://go.microsoft.com/fwlink/?LinkID=843462"
  'llvm-39-github-pull-8311.patch'
  'llvm-39-move.patch'
  'lttng-uts-40.patch'
  'no-libstdcpp-wrappers-for-stdlib.patch'
  'fix-dtor-call.patch'
  'fix-readdir-on-glibc-2.24.patch')
  
sha256sums=('b49ba545fe632dfd5426669ca3300009a5ffd1ccf3c1cf82303dcf44044db33d'
            '4af6af035840072916c081976222a9f1780a0e797959a6478cefb4f7f837db5c'
            '4a59413a0b2ba8914ceecb4a505dae4f93ede10cae4246d714178b11cbe32a2f'
            '581d6484626bbae820feb19d0613955fea333c025fb06d43a731a3db776686f7'
            '84a0e56d00fd2f3f9f82b7d017652f03d4e7f80c6968d7fa1274f6e46af0ff3d'
            'd7c6bbc24e8464dcfb4fd86cb76fa3a55f4822f5e8196e41a2c39650432aa401'
            '8e97cb867f958170fe3613921965ef1c56d282e22c5ba8ff6687ed52b9fabf01'
            '987d68c4ca5c5839773df292c76e2e044bc628118b96f1c80fcca55122cea1cb'
            '48005c5afda97770db17265285348cc059d414fff58354b690a4827fa755fc73')

prepare() {
  cd "${srcdir}/coreclr-${pkgver}"
  patch -p1 < "${srcdir}/llvm-39-github-pull-8311.patch"
  patch -p1 < "${srcdir}/llvm-39-move.patch"
  patch -p0 < "${srcdir}/lttng-uts-40.patch"
  patch -p1 < "${srcdir}/no-libstdcpp-wrappers-for-stdlib.patch"
  patch -p1 < "${srcdir}/fix-dtor-call.patch"
  
  cd "${srcdir}/corefx-${pkgver}"
  patch -p1 < "${srcdir}/fix-readdir-on-glibc-2.24.patch"
}

build() {
  cd "${srcdir}/coreclr-${pkgver}"
  ./build.sh x64 release

  cd "${srcdir}/corefx-${pkgver}"
  ./build.sh native x64 release
}

_coreclr_files=(
  'libclrjit.so'
  'libcoreclr.so'
  'libcoreclrtraceptprovider.so'
  'libdbgshim.so'
  'libmscordaccore.so'
  'libmscordbi.so'
  'libsosplugin.so'
  'libsos.so'
  'System.Globalization.Native.so'
)

_corefx_files=(
  'System.IO.Compression.Native.so'
  'System.Native.so'
  'System.Native.a'
  'System.Net.Http.Native.so'
  'System.Net.Security.Native.so'
  'System.Security.Cryptography.Native.so'
)

package() {
  mkdir -p "${pkgdir}/opt/dotnet/shared/Microsoft.NETCore.App/"
  
  # copy the original files from the binary archive
  cp --force --preserve=mode --recursive "${srcdir}/shared/Microsoft.NETCore.App/${pkgver}" "${pkgdir}/opt/dotnet/shared/Microsoft.NETCore.App/${pkgver}"

  for file in "${_coreclr_files[@]}"; do
    cp --force --preserve=mode "${srcdir}/coreclr-${pkgver}/bin/Product/Linux.x64.Release/${file}" "${pkgdir}/opt/dotnet/shared/Microsoft.NETCore.App/${pkgver}/"
  done

  for file in "${_corefx_files[@]}"; do
    cp --force --preserve=mode "${srcdir}/corefx-${pkgver}/bin/Linux.x64.Release/Native/${file}" "${pkgdir}/opt/dotnet/shared/Microsoft.NETCore.App/${pkgver}/"
  done

  chown -R root:root "${pkgdir}/opt/dotnet"
  find "${pkgdir}/opt/dotnet" -name *.dll -exec chmod 644 {} \;
  find "${pkgdir}/opt/dotnet" -name *.exe -exec chmod 755 {} \;
  find "${pkgdir}/opt/dotnet" -name *.so -exec chmod 755 {} \; 
}

# vim:set ts=2 sw=2 et:
