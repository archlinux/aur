# Maintainer: Aaron Brodersen <aaron at abrodersen dot com>
pkgname=dotnet-cli
pkgver="1.0.0_preview2_1_003177"
pkgrel=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
groups=()
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'openssl' 'curl')
makedepends=('cmake' 'make' 'clang' 'llvm' 'gettext')
provides=('dotnet')
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=

_coreclrver="1.1.0"
_runtimever="1.1.0"
_sdkver=${pkgver//_/-}

_coreclr="coreclr-${_coreclrver}"

source=(
  "${_coreclr}.tar.gz::https://github.com/dotnet/coreclr/archive/v${_coreclrver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://dotnetcli.blob.core.windows.net/dotnet/preview/Binaries/${_sdkver}/dotnet-dev-fedora.23-x64.${_sdkver}.tar.gz"
  'llvm-39-github-pull-8311.patch'
  'llvm-39-move.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('edc1e416f07a71e2b3f70c1f1412e45a7396b3f0daac5bcb267d5f779b9d7444'
            '9802a59b2e68c1fd2c91648503302066bf0ab09b1d286dd6264e2ccc75f50b09'
            '581d6484626bbae820feb19d0613955fea333c025fb06d43a731a3db776686f7'
            '84a0e56d00fd2f3f9f82b7d017652f03d4e7f80c6968d7fa1274f6e46af0ff3d')

prepare() {
  cd "${srcdir}/${_coreclr}"
  patch -p1 < "${srcdir}/llvm-39-github-pull-8311.patch"
  patch -p1 < "${srcdir}/llvm-39-move.patch"
}

build() {
  cd "${srcdir}/${_coreclr}"
  ./build.sh x64 release
}

_coreclr_files=(
  'System.Globalization.Native.so'
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

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/dotnet/dotnet" "${pkgdir}/usr/bin/dotnet"
  chown -R 0:0 "${_outdir}"
}

# vim:set ts=2 sw=2 et:
