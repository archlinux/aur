# Maintainer: Yurii Kolesnykov
# Credit: g00d
# Credit: Aaron Brodersen <aaron at abrodersen dot com>

pkgname=dotnet-cli
pkgver="1.0.0_rc4_004771"
pkgrel=3
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
groups=()
depends=('lldb' 'libunwind' 'icu52' 'lttng-ust' 'openssl' 'curl' 'libcurl-compat')
makedepends=('cmake' 'make' 'clang' 'llvm' 'gettext')
provides=('dotnet')
conflicts=('dotnet-bin')
replaces=()
backup=()
options=(staticlibs)
install=

_coreclrver="1.1.0"
_corefxver="1.1.0"
_runtimever="1.1.0"
_sdkver=${pkgver//_/-}

_coreclr="coreclr-${_coreclrver}"
_corefx="corefx-${_corefxver}"

source=(
  "${_coreclr}.tar.gz::https://github.com/dotnet/coreclr/archive/v${_coreclrver}.tar.gz"
  "${_corefx}.tar.gz::https://github.com/dotnet/corefx/archive/v${_corefxver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://go.microsoft.com/fwlink/?linkid=841687"
  'llvm-39-github-pull-8311.patch'
  'llvm-39-move.patch'
  'lttng-uts-40.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('edc1e416f07a71e2b3f70c1f1412e45a7396b3f0daac5bcb267d5f779b9d7444'
            'ca48ad090c72129ef145ef9b414767408a8fc1249e94a14dc6d4255b1e0b8648'
            '28d26193730257861b2577b0d7855b02772229c356440a9a2e1ccd78769b303e'
            '581d6484626bbae820feb19d0613955fea333c025fb06d43a731a3db776686f7'
            '84a0e56d00fd2f3f9f82b7d017652f03d4e7f80c6968d7fa1274f6e46af0ff3d'
            'd7c6bbc24e8464dcfb4fd86cb76fa3a55f4822f5e8196e41a2c39650432aa401')

prepare() {
  cd "${srcdir}/${_coreclr}"
  patch -p1 < "${srcdir}/llvm-39-github-pull-8311.patch"
  patch -p1 < "${srcdir}/llvm-39-move.patch"
  patch -p0 < "${srcdir}/lttng-uts-40.patch"
}

build() {
  cd "${srcdir}/${_coreclr}"
  ./build.sh x64 release

  cd "${srcdir}/${_corefx}"
  ./src/Native/build-native.sh x64 release
}

_coreclr_files=(
  'System.Globalization.Native.so'
)

_corefx_files=(
  'System.Security.Cryptography.Native.OpenSsl.so'
  'System.Net.Http.Native.so'
)

_copy_file() {
  cp --force --preserve=mode $1 "$2/shared/Microsoft.NETCore.App/${_runtimever}/"
}

package() {
  local _outdir="${pkgdir}/opt/dotnet"
  mkdir -p "${_outdir}"

  tar -C "${_outdir}" -xzf "${srcdir}/${pkgname}-${pkgver}.tar.gz"

  local _clrdir="${srcdir}/${_coreclr}"

  for file in "${_coreclr_files[@]}"; do
      _copy_file "${_clrdir}/bin/Product/Linux.x64.Release/${file}" "${_outdir}"
  done

  local _fxdir="${srcdir}/${_corefx}"

  for file in "${_corefx_files[@]}"; do
      _copy_file "${_fxdir}/bin/Linux.x64.Release/Native/${file}" "${_outdir}"
  done

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/dotnet/dotnet" "${pkgdir}/usr/bin/dotnet"
  chown -R 0:0 "${_outdir}"
  find "${_outdir}" -name *.dll -exec chmod 644 {} \;
  find "${_outdir}" -name *.exe -exec chmod 755 {} \; 
}

# vim:set ts=2 sw=2 et:
