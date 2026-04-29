# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thiago França da Silva <tfsthiagobr98@outlook.com>

_basename="powershell"
_pkgname="${_basename}-preview"
pkgname="${_pkgname}-bin"
pkgver=7.7.0preview1
_pkgver="${pkgver//preview/-preview.}"
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://microsoft.com/PowerShell"
_url="https://github.com/PowerShell/PowerShell"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
optdepends=(
  'lttng-ust2.12: CoreCLR tracing'
)
provides=(
  "${_basename}=${pkgver}"
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_basename}"
)
# options=(
#   '!strip'
# )
install="${_basename}.install"
source_aarch64=(
  "${_url}/releases/download/v${_pkgver}/${_basename}-${_pkgver}-linux-arm64.tar.gz"
)
source_armv7h=(
  "${_url}/releases/download/v${_pkgver}/${_basename}-${_pkgver}-linux-arm32.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${_pkgver}/${_basename}-${_pkgver}-linux-x64.tar.gz"
)
noextract=(
  "${source_aarch64[@]##*/}"
  "${source_armv7h[@]##*/}"
  "${source_x86_64[@]##*/}"
)
sha256sums_aarch64=('b9015da801882d4477c8dc83e636b0988eeaa8a7b196385f3b1cd5e6c266bd53')
sha256sums_armv7h=('0128664e1666eb19a6081ab59991e280ad77568c64233f35e49f68a540ccd3ee')
sha256sums_x86_64=('dff99ac38f66a8a8a755aa573300a7b2b11efbcdbcb140742000b68752c19fda')

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  install -vd "${pkgdir}/usr/bin" \
              "${pkgdir}/usr/lib/${_basename}" \
              "${pkgdir}/usr/share/licenses/${_basename}"

  bsdtar -xf "${source_artifact}" -C "${pkgdir}/usr/lib/${_basename}" --no-same-owner
  chmod +x "${pkgdir}/usr/lib/${_basename}/pwsh"

  ln -vsf "/usr/lib/${_basename}/pwsh" "${pkgdir}/usr/bin/pwsh"
  ln -vsf "/usr/lib/${_basename}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_basename}/LICENSE.txt"
}
