# Maintainer: Max Liebkies <mail at maxliebkies dot de>
# Credit: Yurii Kolesnykov
# Credit: g00d
# Credit: Aaron Brodersen <aaron at abrodersen dot com>

pkgname=dotnet-cli
pkgver="1.0.0_rc4_004771"
pkgrel=1
epoch=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'openssl' 'curl')
makedepends=('cmake' 'clang' 'llvm')
provides=('dotnet')
conflicts=('dotnet-bin')
options=('staticlibs')
install=

_coreclrver11="1.1.0"
_coreclrver10="1.0.5"

_corefxver11="1.1.0"
_corefxver10="1.0.3"

source=(
  "coreclr-${_coreclrver11}.tar.gz::https://github.com/dotnet/coreclr/archive/v${_coreclrver11}.tar.gz"
  "coreclr-${_coreclrver10}.tar.gz::https://github.com/dotnet/coreclr/archive/v${_coreclrver10}.tar.gz"
  "corefx-${_corefxver11}.tar.gz::https://github.com/dotnet/corefx/archive/v${_corefxver11}.tar.gz"
  "corefx-${_corefxver10}.tar.gz::https://github.com/dotnet/corefx/archive/v${_corefxver10}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://go.microsoft.com/fwlink/?linkid=841687"
  'llvm-39-github-pull-8311.patch'
  'llvm-39-move.patch'
  'lttng-uts-40.patch'
  'no-libstdcpp-wrappers-for-stdlib.patch'
  'fix-dtor-call.patch'
  'fix-readdir-on-glibc-2.24.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('edc1e416f07a71e2b3f70c1f1412e45a7396b3f0daac5bcb267d5f779b9d7444'
            '8a097a99cc50d08bd601d523b6d8f4cf5b68047b360ce3800f80b90e9a276bcd'
            'ca48ad090c72129ef145ef9b414767408a8fc1249e94a14dc6d4255b1e0b8648'
            'b6f08b11cb6186f499a7e5e8cb5ad978daef8e64f4ebbd544ff4b05db9627612'
            '28d26193730257861b2577b0d7855b02772229c356440a9a2e1ccd78769b303e'
            '581d6484626bbae820feb19d0613955fea333c025fb06d43a731a3db776686f7'
            '84a0e56d00fd2f3f9f82b7d017652f03d4e7f80c6968d7fa1274f6e46af0ff3d'
            'd7c6bbc24e8464dcfb4fd86cb76fa3a55f4822f5e8196e41a2c39650432aa401'
            '8e97cb867f958170fe3613921965ef1c56d282e22c5ba8ff6687ed52b9fabf01'
            '987d68c4ca5c5839773df292c76e2e044bc628118b96f1c80fcca55122cea1cb'
            '48005c5afda97770db17265285348cc059d414fff58354b690a4827fa755fc73')

prepare() {
  cd "${srcdir}/coreclr-${_coreclrver11}"
  patch -p1 < "${srcdir}/llvm-39-github-pull-8311.patch"
  patch -p1 < "${srcdir}/llvm-39-move.patch"
  patch -p0 < "${srcdir}/lttng-uts-40.patch"

  cd "${srcdir}/coreclr-${_coreclrver10}"
  patch -p1 < "${srcdir}/llvm-39-github-pull-8311.patch"
  patch -p1 < "${srcdir}/llvm-39-move.patch"
  patch -p0 < "${srcdir}/lttng-uts-40.patch"
  patch -p1 < "${srcdir}/no-libstdcpp-wrappers-for-stdlib.patch"
  patch -p1 < "${srcdir}/fix-dtor-call.patch"

  cd "${srcdir}/corefx-${_corefxver10}"
  patch -p1 < "${srcdir}/fix-readdir-on-glibc-2.24.patch"
}

build() {
  cd "${srcdir}/coreclr-${_coreclrver10}"
  ./build.sh x64 release

  cd "${srcdir}/coreclr-${_coreclrver11}"
  ./build.sh x64 release

  cd "${srcdir}/corefx-${_corefxver10}"
  ./build.sh native x64 release

  cd "${srcdir}/corefx-${_corefxver11}"
  ./src/Native/build-native.sh x64 release
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
  'System.Net.Http.Native.so'
  'System.Net.Security.Native.so'
  'System.Security.Cryptography.Native*.so'
)

_copy_file() {
  cp --force --preserve=mode $1 "$2/shared/Microsoft.NETCore.App/$3/"
}

package() {
  local _outdir="${pkgdir}/opt/dotnet"
  mkdir -p "${_outdir}"

  tar -C "${_outdir}" -xzf "${srcdir}/${pkgname}-${pkgver}.tar.gz"

  for file in "${_coreclr_files[@]}"; do
      _copy_file "${srcdir}/coreclr-${_coreclrver11}/bin/Product/Linux.x64.Release/${file}" "${_outdir}" "${_coreclrver11}"
      # last argument is ${corefxver10} on purpose!
      _copy_file "${srcdir}/coreclr-${_coreclrver10}/bin/Product/Linux.x64.Release/${file}" "${_outdir}" "${_corefxver10}"
  done

  for file in "${_corefx_files[@]}"; do
      _copy_file "${srcdir}/corefx-${_corefxver11}/bin/Linux.x64.Release/Native/${file}" "${_outdir}" "${_corefxver11}"
      _copy_file "${srcdir}/corefx-${_corefxver10}/bin/Linux.x64.Release/Native/${file}" "${_outdir}" "${_corefxver10}"
  done

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/dotnet/dotnet" "${pkgdir}/usr/bin/dotnet"
  chown -R 0:0 "${_outdir}"
  find "${_outdir}" -name *.dll -exec chmod 644 {} \;
  find "${_outdir}" -name *.exe -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
