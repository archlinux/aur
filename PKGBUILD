# Maintainer: Dmitry Kalinin <lwinch2006.rss@protonmail.ch>
pkgname=dotnet-cli-git
pkgver=1.0.0_rc4_004823
pkgrel=1
pkgdesc="The .NET Core command-line (CLI) tools, used for building .NET Core apps and libraries through your development flow (compiling, NuGet package management, running, testing, ...)"
arch=(x86_64)
url="https://github.com/dotnet/cli"
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

_coreclrname="coreclr"
_corefxname="corefx"
_coreclrver="1.1.0"
_corefxver="1.1.0"

source=(
  "${_coreclrname}-${_coreclrver}.tar.gz::https://github.com/dotnet/coreclr/archive/v1.1.0.tar.gz"
  "${_corefxname}-${_corefxver}.tar.gz::https://github.com/dotnet/corefx/archive/v1.1.0.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://dotnetcli.blob.core.windows.net/dotnet/Sdk/rel-1.0.0/dotnet-dev-debian-x64.latest.tar.gz"
  'llvm-39-github-pull-8311.patch'
  'llvm-39-move.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('edc1e416f07a71e2b3f70c1f1412e45a7396b3f0daac5bcb267d5f779b9d7444'
            'ca48ad090c72129ef145ef9b414767408a8fc1249e94a14dc6d4255b1e0b8648'
            'SKIP'
            '581d6484626bbae820feb19d0613955fea333c025fb06d43a731a3db776686f7'
            '84a0e56d00fd2f3f9f82b7d017652f03d4e7f80c6968d7fa1274f6e46af0ff3d')

pkgver() {
  local _versionDetailsAsString=$(curl https://dotnetcli.blob.core.windows.net/dotnet/Sdk/rel-1.0.0/latest.version);
  readarray -t _versionDetailsAsArray <<< "${_versionDetailsAsString}";
  local _version="${_versionDetailsAsArray[1]}";
  _version="${_version//[$'\t\r\n']}";
  _version="${_version//-/_}";
  mv "${srcdir}/${pkgname}-${pkgver}.tar.gz" "${srcdir}/${pkgname}-${_version}.tar.gz"
  echo "${_version}"
}

prepare() {
  cd "${srcdir}/${_coreclrname}-${_coreclrver}"
  patch -p1 < "${srcdir}/llvm-39-github-pull-8311.patch"
  patch -p1 < "${srcdir}/llvm-39-move.patch"
}

build() {
  cd "${srcdir}/${_coreclrname}-${_coreclrver}"
  ./build.sh x64 release

  cd "${srcdir}/${_corefxname}-${_corefxver}"
  ./src/Native/build-native.sh x64 release
}

_coreclr_files=(
  'System.Globalization.Native.so'
)

_corefx_files=(
  'System.Security.Cryptography.Native.OpenSsl.so'
)

_copy_file() {
  local _netcoreappverdir1="$(ls -d $2/shared/Microsoft.NETCore.App/*/ | head -n 1 | tail -n 1)";
  local _netcoreappverdir2="$(ls -d $2/shared/Microsoft.NETCore.App/*/ | head -n 2 | tail -n 1)";

  cp --force --preserve=mode $1 "${_netcoreappverdir1}"
  cp --force --preserve=mode $1 "${_netcoreappverdir2}"
}

package() {
  local _outdir="${pkgdir}/opt/dotnet"
  mkdir -p "${_outdir}"

  tar -C "${_outdir}" -xzf "${srcdir}/${pkgname}-${pkgver}.tar.gz"

  local _clrdir="${srcdir}/${_coreclrname}-${_coreclrver}"

  for file in "${_coreclr_files[@]}"; do
      _copy_file "${_clrdir}/bin/Product/Linux.x64.Release/${file}" "${_outdir}"
  done

  local _fxdir="${srcdir}/${_corefxname}-${_corefxver}"

  for file in "${_corefx_files[@]}"; do
      _copy_file "${_fxdir}/bin/Linux.x64.Release/Native/${file}" "${_outdir}"
  done

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/dotnet/dotnet" "${pkgdir}/usr/bin/dotnet"
  chmod -R go+r "${_outdir}"
  chown -R 0:0 "${_outdir}"
}

# vim:set ts=2 sw=2 et:
