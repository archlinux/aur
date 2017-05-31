# Maintainer: Dmitry Kalinin <lwinch2006.rss@protonmail.ch>
pkgname=dotnet-cli-git
pkgver=2.0.0_preview2_006127
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
_coreclrOriginalVersion="latest"
_corefxOriginalVersion="latest"
_coreclrChangedVersion="${_coreclrOriginalVersion//-/_}"
_corefxChangedVersion="${_corefxOriginalVersion//-/_}"

source=(
  #"${_coreclrname}-${_coreclrChangedVersion}.zip::https://github.com/dotnet/coreclr/archive/master.zip"
  "${_corefxname}-${_corefxChangedVersion}.zip::https://github.com/dotnet/corefx/archive/master.zip"
  "${pkgname}-${pkgver}.tar.gz::https://dotnetcli.blob.core.windows.net/dotnet/Sdk/master/dotnet-dev-linux-x64.latest.tar.gz"
  "libcurl_openssl-1_0.patch"
)

noextract=("${pkgname}-${pkgver}.tar.gz")

sha256sums=(
  #'SKIP'
  'SKIP'
  'SKIP'
  '90bc8e1cc9c89fc94ec6a0264200e297e00371136f3b574eccfc077d40d3746d'
)

pkgver() {
  local _versionDetailsAsString=$(curl https://dotnetcli.blob.core.windows.net/dotnet/Sdk/master/latest.version);
  readarray -t _versionDetailsAsArray <<< "${_versionDetailsAsString}";
  local _version="${_versionDetailsAsArray[1]}";
  _version="${_version//[$'\t\r\n']}";
  _version="${_version//-/_}";

  if [ "${_version}" != "${pkgver}" ]; then
    mv "${srcdir}/${pkgname}-${pkgver}.tar.gz" "${srcdir}/${pkgname}-${_version}.tar.gz"
  fi

  echo "${_version}"
}

prepare() {
  local _extractedCoreclrFolder="$(ls -d ${srcdir}/*/ | grep coreclr | head -n 1 | tail -n 1)"
  local _extractedCorefxFolder="$(ls -d ${srcdir}/*/ | grep corefx | head -n 1 | tail -n 1)"

  if [ -n "${_extractedCoreclrFolder}" ]; then
    cd "${_extractedCoreclrFolder}"
    #patch -p1 < "${srcdir}/enable-build-with-clang-4.patch"
  fi

  if [ -n "${_extractedCorefxFolder}" ]; then
    cd "${_extractedCorefxFolder}"
    patch -p1 < "${srcdir}/libcurl_openssl-1_0.patch"
  fi
}

build() {
  local _extractedCoreclrFolder="$(ls -d ${srcdir}/*/ | grep coreclr | head -n 1 | tail -n 1)"
  local _extractedCorefxFolder="$(ls -d ${srcdir}/*/ | grep corefx | head -n 1 | tail -n 1)"

  if [ -n "${_extractedCoreclrFolder}" ]; then
    cd "${_extractedCoreclrFolder}"
    ./build.sh x64 release
  fi

  if [ -n "${_extractedCorefxFolder}" ]; then
    cd "${_extractedCorefxFolder}"
    #./src/Native/build-native.sh x64 release
    #CPLUS_INCLUDE_PATH=/usr/include/openssl-1.0 C_INCLUDE_PATH=/usr/include/openssl-1.0 ./src/Native/build-native.sh x64 release cmakeargs -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 cmakeargs -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so cmakeargs -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so cmakeargs -DCURL_LIBRARIES=/usr/lib/openssl-1.0/libcurl.so

    CPLUS_INCLUDE_PATH=/usr/include/openssl-1.0 C_INCLUDE_PATH=/usr/include/openssl-1.0 ./src/Native/build-native.sh x64 release cmakeargs -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 cmakeargs -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so cmakeargs -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so cmakeargs -DCURL_LIBRARIES=/usr/lib/libcurl-openssl-1.0.so

    #./src/Native/build-native.sh x64 release cmakeargs -DCURL_LIBRARIES=/usr/lib/openssl-1.0/libcurl.so
  fi
}

_coreclr_files=(

)

_corefx_files=(
  'System.IO.Compression.Native.so'
  'System.Native.a'
  'System.Native.so'
  'System.Net.Http.Native.so'
  'System.Net.Security.Native.so'
  'System.Security.Cryptography.Native.OpenSsl.so'
)

_copy_file() {
  local _netcoreappverdir1="$(ls -d $2/shared/Microsoft.NETCore.App/*/ | head -n 1 | tail -n 1)";
  local _netcoreappverdir2="$(ls -d $2/shared/Microsoft.NETCore.App/*/ | head -n 2 | tail -n 1)";
  local _netcoreappverdir3="$(ls -d $2/shared/Microsoft.NETCore.App/*/ | head -n 3 | tail -n 1)";
  local _netcoreappverdir4="$(ls -d $2/shared/Microsoft.NETCore.App/*/ | head -n 4 | tail -n 1)";

  if [ -n "${_netcoreappverdir1}" ]; then
    cp --force --preserve=mode $1 "${_netcoreappverdir1}"
  fi

  if [ -n "${_netcoreappverdir2}" ]; then
    cp --force --preserve=mode $1 "${_netcoreappverdir2}"
  fi

  if [ -n "${_netcoreappverdir3}" ]; then
    cp --force --preserve=mode $1 "${_netcoreappverdir3}"
  fi

  if [ -n "${_netcoreappverdir4}" ]; then
    cp --force --preserve=mode $1 "${_netcoreappverdir4}"
  fi
}

package() {
  local _outdir="${pkgdir}/opt/dotnet"
  mkdir -p "${_outdir}"

  tar -C "${_outdir}" -xzf "${srcdir}/${pkgname}-${pkgver}.tar.gz"

  local _extractedCoreclrFolder="$(ls -d ${srcdir}/*/ | grep coreclr | head -n 1 | tail -n 1)"

  if [ -n "${_extractedCoreclrFolder}" ]; then
    for file in "${_coreclr_files[@]}"; do
        _copy_file "${_extractedCoreclrFolder}bin/Product/Linux.x64.Release/${file}" "${_outdir}"
    done
  fi

  local _extractedCorefxFolder="$(ls -d ${srcdir}/*/ | grep corefx | head -n 1 | tail -n 1)"

  if [ -n "${_extractedCorefxFolder}" ]; then
    for file in "${_corefx_files[@]}"; do
        _copy_file "${_extractedCorefxFolder}bin/Linux.x64.Release/native/${file}" "${_outdir}"
    done
  fi

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/dotnet/dotnet" "${pkgdir}/usr/bin/dotnet"
  chmod -R go+r "${_outdir}"
  chown -R 0:0 "${_outdir}"
}

# vim:set ts=2 sw=2 et:
