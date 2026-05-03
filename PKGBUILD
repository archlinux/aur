# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="viper4linux-gui"
pkgname="${_pkgname}-bin"
pkgver=2.2_43
pkgrel=1
pkgdesc="Official UI for Viper4Linux"
arch=(
  'x86_64'
)
url="https://github.com/Audio4Linux/Viper4Linux-GUI"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
  'gst-plugins-bad-libs' # ?
  'gstreamer'
  'libgcc'
  'libstdc++'
  'mesa' # ?
  'qt5-base'
  'qt5-multimedia'
  'qt5-svg'
  'viper4linux'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver%%_*}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver%%_*}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver%%_*}/LICENSE"
)
source_x86_64=(
  # "${url}/releases/download/${pkgver%%_*}/${_pkgname}_${pkgver//_/-}.deb"
  "https://raw.githubusercontent.com/timschneeb/PPA-Repository/57cab600c37e16d7441747034e03c1058f7779e9/${_pkgname}_${pkgver//_/-}.deb"
)
noextract=(
  "${source_x86_64[@]##*/}"
)
sha256sums=('1486917f2584f3e94df0fec725b16515e1974f6699266d30e4a2a737bfcb0039'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('dbe29f9cfc0b59eb74b7351c0c9ed163952e39c36343b4dce8bd714f466d48ae')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.deb}"
  bsdtar -xf "${source_artifact}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${source_artifact%.deb}"
  rm -f data.tar.*
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  cp -vaT --no-preserve=ownership "${source_artifact%.deb}" "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
