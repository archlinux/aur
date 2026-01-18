# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thiago França da Silva <tfsthiagobr98@outlook.com>

_basename="powershell"
_pkgname="${_basename}-preview"
pkgname="${_pkgname}-bin"
pkgver=7.6.0preview6
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
sha256sums_aarch64=('292944b549d013a887a6a6ba289b88b3c2dc37368f8c8c4acff4576cdb221102')
sha256sums_armv7h=('7cdb4fae883b76f5a8c1d0696952ec0935d52ef1935225db34a6b0963769465c')
sha256sums_x86_64=('12d895f6451c4bc950562e34845c5a9c8b634783b74b04c1d7d555662eddeb6a')

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
