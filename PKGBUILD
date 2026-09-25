# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thiago França da Silva <tfsthiagobr98@outlook.com>

_basename="powershell"
_pkgname="${_basename}-preview"
pkgname="${_pkgname}-bin"
pkgver=7.7.0preview5
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
sha256sums_aarch64=('8351d5da4a6442fc941c6bcb62000989cacc812a47ccf26ea98af663ed51891f')
sha256sums_armv7h=('da9befd61313df1c2bec47f09c4ea5dcec170fd42c4b04ab7f4654ba0896a789')
sha256sums_x86_64=('8f7af867391fdc90b526c28a427f0babf643f489d76bd407907ce9e236a4d5cf')

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
