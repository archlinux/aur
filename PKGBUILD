# Maintainer: Aaron Brodersen <aaron at abrodersen dot com>
pkgname=dotnet-cli
pkgver="1.0.0_preview2_003121"
pkgrel=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
groups=()
depends=('libunwind' 'icu' 'lttng-ust' 'openssl' 'curl')
makedepends=('cmake' 'make' 'clang' 'llvm' 'gettext')
provides=('dotnet')
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=

_coreclrver="1.0.0"
_corefxver="1.0.0"

_coreclr="coreclr-${_coreclrver}"
_corefx="corefx-${_corefxver}"

source=(
  "${_coreclr}.tar.gz::https://github.com/dotnet/coreclr/archive/v${_coreclrver}.tar.gz"
  "${_corefx}.tar.gz::https://github.com/dotnet/corefx/archive/v${_corefxver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://go.microsoft.com/fwlink/?LinkID=816869"
  'gcc6-github-pull-5304.patch'
  'segv-github-pull-6027.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=(
  'fad7bb05f78d90dfea6e8fec59f79ff12648fe95c0965cda5bc11beafabd0f27'
  '98f9475ea42e5d55ad9402424e342a6c0ea7351f3fb5805a602132969b44b774'
  'dde9f8326583f351a89e57095dc523ba92560896cd1d4b8e0ca5ac7fd8499138'
  '0905f9f8e6e33a7a6e5f4acf9ec54ec3796400dce28f0d71c1d1d8bcd9b7e068'
  'a039329f892c55a400537ea4da61de86af195d143d758b6019fbae76f17ef6f1')

prepare() {
  cd "${srcdir}/${_coreclr}"
  patch -p1 < "${srcdir}/gcc6-github-pull-5304.patch"
  patch -p1 < "${srcdir}/segv-github-pull-6027.patch"
}

build() {
  cd "${srcdir}/${_coreclr}"
  ./build.sh x64 release > /dev/null

  cd "${srcdir}/${_corefx}"
  ./build.sh native x64 release > /dev/null

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

_corefx_files=(
  'System.IO.Compression.Native.so'
  'System.Native.a'
  'System.Native.so'
  'System.Net.Http.Native.so'
  'System.Net.Security.Native.so'
  'System.Security.Cryptography.Native.so'
)
 
_copy_file() {
  cp --force --preserve=mode $1 "$2/shared/Microsoft.NETCore.App/${_corefxver}/"
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
}

# vim:set ts=2 sw=2 et:
