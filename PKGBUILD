# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thiago França da Silva <tfsthiagobr98@outlook.com>

_basename="powershell"
_pkgname="${_basename}-preview"
pkgname="${_pkgname}-bin"
pkgver=7.7.0
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
sha256sums_aarch64=('e59c89776eaa59790d44b3edd14277435225ab08b6e7603763101b89de83d935')
sha256sums_armv7h=('d05e2bbc7b165e4db1b7194f92ccb6951e09847d4013f9cc464ead1c8804a10a')
sha256sums_x86_64=('c89d9c682d2c403dfe726f3df948e359675235a5bd6fab535776de69729ca0cb')

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
