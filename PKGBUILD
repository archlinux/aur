# Maintainer: Ignas Anikevicius <anikevicius at gmail dot com>
# Based on dotnet-cli PKGBUILD by Aaron Brodersen <aaron at abrodersen dot com>

pkgname=dotnet-coreclr-git
pkgdesc=".NET Core CLR"
pkgver=r8267.817c839
pkgrel=1
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
groups=()
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'openssl' 'curl')
makedepends=('cmake' 'make' 'clang' 'llvm' 'gettext')
provides=('dotnet-coreclr')
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=

_gitbranch="master"
_runtimever="1.0.1"

source=("${pkgname}::git+http://github.com/dotnet/coreclr.git#branch=${_gitbranch}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  ./build.sh x64 release
}

_coreclr_files=(
  'libclrjit.so'
  'libcoreclr.so'
  'libcoreclrtraceptprovider.so'
  'libdbgshim.so'
  'libmscordaccore.so'
  'libmscordbi.so'
  'libsos.so'
  'libsosplugin.so'
  'System.Globalization.Native.so'
)

_copy_file() {
  mkdir -p "$2/shared/Microsoft.NETCore.App/${_runtimever}/"
  cp --force --preserve=mode $1 "$2/shared/Microsoft.NETCore.App/${_runtimever}/"
}

package() {
  cd ${pkgname}
  local _outdir="${pkgdir}/opt/dotnet"
  for file in "${_coreclr_files[@]}"; do
    _copy_file "bin/Product/Linux.x64.Release/${file}" "${_outdir}"
  done
}

# vim:set ts=4 sw=4 et:
