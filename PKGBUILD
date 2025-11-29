# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thiago França da Silva <tfsthiagobr98@outlook.com>

_basename="powershell"
_pkgname="${_basename}-preview"
pkgname="${_pkgname}-bin"
pkgver=7.6.0preview5
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
  'gcc-libs'
  'glibc'
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
options=(
  # '!strip'
)
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
sha256sums_aarch64=('1c6035915493cbbb862b9c672f87dbd08acd13e638c38ce393dec4e3bf99a51e')
sha256sums_armv7h=('1ecb77ec12170fa3f12e012f0c6a76a6027e8fcf31bcba6a148c9e65a55bbe52')
sha256sums_x86_64=('ec5ef3f98c2a63efcd38d93076c0f99c63700abe49839699c907491589997adc')

package() {
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"

  install -vd "${pkgdir}/usr/bin" \
              "${pkgdir}/usr/lib/${_basename}" \
              "${pkgdir}/usr/share/licenses/${_basename}"

  bsdtar -xf "${source_artifact}" -C "${pkgdir}/usr/lib/${_basename}" --no-same-owner
  chmod +x "${pkgdir}/usr/lib/${_basename}/pwsh"

  ln -vsf "/usr/lib/${_basename}/pwsh" "${pkgdir}/usr/bin/pwsh"
  ln -vsf "/usr/lib/${_basename}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_basename}/LICENSE.txt"
}
