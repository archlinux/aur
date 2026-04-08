# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='arm64'
  ['x86_64']='x64'
)

_Name="YoutubeDownloader"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.16.3
pkgrel=1
pkgdesc="Downloads videos and playlists from YouTube"
arch=(
  "${!_arch[@]}"
)
url="https://github.com/Tyrrrz/${_Name}"
license=(
  'MIT'
)
depends=(
  'fontconfig'
  'glibc'
  'libgcc'
  'libstdc++'
  'sh'
)
makedepends=(
  'gendesk'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
options=(
  '!strip'
  '!debug'
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/Readme.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/License.txt"
  "${_pkgsrc}.png::${url}/raw/refs/tags/${pkgver}/favicon.png"
  "${_pkgname}.sh"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  '${_Name}.${pkgver}-linux-${_arch[${_carch}]}.zip::${url}/releases/download/${pkgver}/${_Name}.linux-${_arch[${_carch}]}.zip'
)
noextract+=(
  \"\${source_${_carch}[@]%%::*}\"
)"
done
sha256sums=('90eeec88473dc5d9609473c82edfde0bf5aedece6669c37a3ad30cc1a2b0597f'
            '06a2eca61c197a7922ba1c3ac8f3e4bef1e1e9012e4a8690a7ef09cdcee70a3e'
            'e837359283bb6d1298fb7794a59ca2cc0e221c8da988905133996f719ccb32fa'
            'be88ad49e24853d8eb4fbc025d5df985b3cb1d8694f903600c16e5ef7c5e267d')
sha256sums_aarch64=('0b4124d9e3a0c133b4f1e3b1aab824f93ee63c958d2fe729c6ccc51baadf1f98')
sha256sums_x86_64=('c4cb71d6998464a2d035900dbc17fd05d092f094b314d2d79ebf554764e2b7c0')

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${_pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "Youtube Downloader" \
    --exec "${_Name}" \
    --categories "AudioVideo;Network;Utility"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.png"       "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  bsdtar -xf "${_Name}.${pkgver}-linux-${_arch[${CARCH}]}.zip" -C "${pkgdir}/usr/lib/${_pkgname}" --no-same-owner
}
