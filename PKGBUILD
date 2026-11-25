# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgbase='cse2-git'
pkgname=('cse2-english-git' 'cse2-japanese-git')
pkgver=2.2.portable.r44.gf957b05
pkgrel=1
pkgdesc='Decompilation of Cave Story'
arch=('i686' 'x86_64')
url='https://github.com/gameblabla/CSE2'
license=('MIT')
depends=(
  'freetype2'
  'glfw'
  'hicolor-icon-theme'
  'sdl2-compat'
)
makedepends=(
  'cmake'
  'git'
  'ttf-dejavu'
)
source=(
  "${pkgbase}::git+${url}.git"
  'cse2-english-config.desktop'
  'cse2-english.desktop'
  'cse2-japanese-config.desktop'
  'cse2-japanese.desktop'
  'cse2-use-pref-path.patch'
)
sha256sums=(
  'SKIP'
  '1116039b58de5dc1408baa9cb03954ada49bf998effc1878e18226e84259a60c'
  'ef673a2fa3fb49efa4f891ac2a56aff99091a08da814db3a8f4561e07592cff5'
  '0b89785327c2a3246672cd8030963488d35b24463c1429cf6a376fe77d79fd81'
  '8d5807af588dbc24548b150ef90d1ec6d9e0bc69c294ae7a10d931507de995c5'
  'e166fb79db11ad3d71c96ff8975fdebc5f6add96c8a292ed38ce0e7c5ac08477'
)

pkgver() {
  git -C "${pkgbase}" describe --abbrev=7 --long --tags \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch --directory="${pkgbase}" --strip=1 --input="${srcdir}/cse2-use-pref-path.patch"
}

build() {
  local _common_cmake_args=(
    -D CMAKE_BUILD_TYPE:STRING=None
    -D CMAKE_INSTALL_PREFIX:PATH=/usr
    -D FIX_BUGS:BOOL=ON
    -D FREETYPE_FONTS:BOOL=ON
    -D LANCZOS_RESAMPLER:BOOL=ON
  )

  # English
  cmake -B build-en -S "${pkgbase}" \
    "${_common_cmake_args[@]}"
  cmake --build build-en

  # Japanese
  cmake -B build-jp -S "${pkgbase}" \
    -D JAPANESE:BOOL=ON \
    "${_common_cmake_args[@]}"
  cmake --build build-jp
}

package_cse2-english-git() {
  pkgdesc='Decompilation of Cave Story (English)'
  provides=('cse2-english')
  conflicts=('cse2-english')
  depends+=('ttf-dejavu')

  cd "${srcdir}/${pkgbase}/game_english"
  find data -type f -exec install -D --mode=644 {} "${pkgdir}/usr/share/cse2/english/{}" \;
  rm --recursive --force "${pkgdir}/usr/share/cse2/english/data/Font/"*
  ln --symbolic /usr/share/fonts/TTF/DejaVuSansMono.ttf "${pkgdir}/usr/share/cse2/english/data/Font/font"

  install -D --mode=755 CSE2 "${pkgdir}/usr/bin/cse2-english"
  install -D --mode=755 DoConfig "${pkgdir}/usr/bin/cse2-english-config"

  # Desktop files
  install -D --mode=644 "${srcdir}/cse2-english.desktop" "${pkgdir}/usr/share/applications/cse2-english.desktop"
  install -D --mode=644 "${srcdir}/cse2-english-config.desktop" "${pkgdir}/usr/share/applications/cse2-english-config.desktop"

  # Icon
  install -D --mode=644 "${srcdir}/${pkgbase}/assets/resources/ICON/ICON_MINI.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/cse2-english.png"

  # License
  install -D --mode=644 "${srcdir}/${pkgbase}/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_cse2-japanese-git() {
  pkgdesc='Decompilation of Cave Story (Japanese)'
  license+=('IPA')
  provides=('cse2-japanese')
  conflicts=('cse2-japanese')

  cd "${srcdir}/${pkgbase}/game_japanese"
  find data -type f -exec install -D --mode=644 {} "${pkgdir}/usr/share/cse2/japanese/{}" \;
  rm --force "${pkgdir}/usr/share/cse2/japanese/data/Font/font_bitmap_"*
  rm --force "${pkgdir}/usr/share/cse2/japanese/data/Font/LICENSE-Migu1M.txt"

  install -D --mode=755 CSE2 "${pkgdir}/usr/bin/cse2-japanese"
  install -D --mode=755 DoConfig "${pkgdir}/usr/bin/cse2-japanese-config"

  # Desktop files
  install -D --mode=644 "${srcdir}/cse2-japanese.desktop" "${pkgdir}/usr/share/applications/cse2-japanese.desktop"
  install -D --mode=644 "${srcdir}/cse2-japanese-config.desktop" "${pkgdir}/usr/share/applications/cse2-japanese-config.desktop"

  # Icon
  install -D --mode=644 "${srcdir}/${pkgbase}/assets/resources/ICON/ICON_MINI.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/cse2-japanese.png"

  # Licenses
  install -D --mode=644 "${srcdir}/${pkgbase}/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D --mode=644 data/Font/LICENSE-Migu1M.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Migu1M.txt"
}
