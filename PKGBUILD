# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-runtime-1.1
pkgver=1.1.2
pkgrel=4
pkgdesc="Provides the .NET core shared framework, i.e. coreclr and corefx."
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
groups=()
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'libcurl-openssl-1.0' 'dotnet-host')
makedepends=('cmake' 'make' 'clang' 'llvm' 'gettext')
provides=('dotnet=1.1.2')
conflicts=('dotnet-bin')
replaces=()
backup=()
options=(staticlibs)
install=

source=(
  "coreclr-${pkgver}.tar.gz::https://github.com/dotnet/coreclr/archive/v${pkgver}.tar.gz"
  "corefx-${pkgver}.tar.gz::https://github.com/dotnet/corefx/archive/v${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://download.microsoft.com/download/D/7/A/D7A9E4E9-5D25-4F0C-B071-210CB8267943/dotnet-ubuntu.16.10-x64.1.1.2.tar.gz"
  'llvm-39-github-pull-8311.patch'
  'llvm-39-move.patch'
  'lttng-uts-40.patch'
  'clang-4-patchset.patch'
  'libcurl.patch')

sha256sums=('efbb9f237615722085188077371d525fb094d9add9942b2e4d6fd56a8694240f'
            '29d4632e17734fc241e0f6cd28e5f4c6339ee7bd9efd969d9a2ae55ea2c17789'
            '0a4d4061931e0154c9186446dbc8d4c3e69ba49537699be98185d55fc24a1b56'
            '581d6484626bbae820feb19d0613955fea333c025fb06d43a731a3db776686f7'
            '84a0e56d00fd2f3f9f82b7d017652f03d4e7f80c6968d7fa1274f6e46af0ff3d'
            'd7c6bbc24e8464dcfb4fd86cb76fa3a55f4822f5e8196e41a2c39650432aa401'
            '2b884b4cd850027f95cba5deda32226e27ceaa962f0ab2879adc5180cf37c32a'
            'a32dea005f5379ae59d31e579f4ea13bad03228a8ca39b439b94767541c44450')

prepare() {
  cd "${srcdir}/coreclr-${pkgver}"
  patch -p1 < "${srcdir}/llvm-39-github-pull-8311.patch"
  patch -p1 < "${srcdir}/llvm-39-move.patch"
  patch -p0 < "${srcdir}/lttng-uts-40.patch"
  patch -p1 < "${srcdir}/clang-4-patchset.patch"
  
  cd "${srcdir}/corefx-${pkgver}"
  patch -p0 < "${srcdir}/libcurl.patch"
}

build() {
  cd "${srcdir}/coreclr-${pkgver}"
  ./build.sh x64 release skiptests

  cd "${srcdir}/corefx-${pkgver}"
  CPLUS_INCLUDE_PATH=/usr/include/openssl-1.0 C_INCLUDE_PATH=/usr/include/openssl-1.0 ./src/Native/build-native.sh x64 release cmakeargs -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 cmakeargs -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so cmakeargs -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so cmakeargs -DCURL_LIBRARIES=/usr/lib/libcurl-openssl-1.0/libcurl.so
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
  'System.Security.Cryptography.Native.OpenSsl.so'
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
