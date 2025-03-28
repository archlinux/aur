# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgbase='cse2-git'
pkgname=('cse2-english-git' 'cse2-japanese-git')
pkgver=2.2.portable.r42.gb9d9d33
pkgrel=1
pkgdesc="Decompilation of Cave Story"
arch=('i686' 'x86_64')
url='https://github.com/gameblabla/CSE2'
license=('MIT')
makedepends=(
  'cmake'
  'git'
  'ttf-dejavu'
  'ttf-hanazono'
)
depends=(
  'freetype2'
  'glfw'
  'hicolor-icon-theme'
  'sdl2'
)
source=("${pkgbase}::git+https://github.com/gameblabla/CSE2.git"
        'cse2-english-config.desktop'
        'cse2-english.desktop'
        'cse2-japanese-config.desktop'
        'cse2-japanese.desktop'
        'path_fix.patch'
)
sha256sums=('SKIP'
            '1116039b58de5dc1408baa9cb03954ada49bf998effc1878e18226e84259a60c'
            'ef673a2fa3fb49efa4f891ac2a56aff99091a08da814db3a8f4561e07592cff5'
            '0b89785327c2a3246672cd8030963488d35b24463c1429cf6a376fe77d79fd81'
            '8d5807af588dbc24548b150ef90d1ec6d9e0bc69c294ae7a10d931507de995c5'
            'b62db7630f2b22ea6d1933985e5b188d32d2d3ac997e26f2f6313311e483ac85'
)

pkgver() {
  cd "${pkgbase}" || exit
  git describe --abbrev=7 --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -d "${pkgbase}" -Np1 < path_fix.patch
}

build() {
  export LDFLAGS

  # English
  cmake -B build -S "${pkgbase}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wno-error=format-security" \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DFIX_BUGS:BOOLEAN=ON \
    -DFREETYPE_FONTS:BOOLEAN=ON \
    -DLANCZOS_RESAMPLER:BOOLEAN=ON \
    -Wno-dev
  cmake --build build

  # Japanese
  cmake -B build -S "${pkgbase}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wno-error=format-security" \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DFIX_BUGS:BOOLEAN=ON \
    -DFREETYPE_FONTS:BOOLEAN=ON \
    -DJAPANESE:BOOLEAN=ON \
    -DLANCZOS_RESAMPLER:BOOLEAN=ON \
    -Wno-dev
  cmake --build build
}

package_cse2-english-git() {
  conflicts=('cse2-english')
  provides=('cse2-english')
  depends+=('ttf-dejavu')

  pushd "${srcdir}"/"${pkgbase}"/game_english || return
  find data -type f -exec install -Dm644 {} "${pkgdir}"/usr/share/cse2/english/{} \;
  rm -rf "${pkgdir}"/usr/share/cse2/english/data/Font/*
  ln -s /usr/share/fonts/TTF/DejaVuSansMono.ttf "${pkgdir}"/usr/share/cse2/english/data/Font/font

  install -Dm755 "${srcdir}"/"${pkgbase}"/game_english/CSE2 "${pkgdir}"/usr/bin/cse2-english
  install -Dm755 "${srcdir}"/"${pkgbase}"/game_english/DoConfig "${pkgdir}"/usr/bin/cse2-english-config

  # Desktop files
  install -Dm755 "${srcdir}"/cse2-english.desktop "${pkgdir}"/usr/share/applications/cse2-english.desktop
  install -Dm755 "${srcdir}"/cse2-english-config.desktop "${pkgdir}"/usr/share/applications/cse2-english-config.desktop

  # Icon
  install -Dm644 "${srcdir}"/"${pkgbase}"/assets/resources/ICON/ICON_MINI.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/cse2-english.png

  # License
  install -Dm644 "${srcdir}"/"${pkgbase}"/LICENCE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_cse2-japanese-git() {
  conflicts=('cse2-japanese')
  provides=('cse2-japanese')
  depends+=('ttf-hanazono')

  pushd "${srcdir}"/"${pkgbase}"/game_japanese || return
  find data -type f -exec install -Dm644 {} "${pkgdir}"/usr/share/cse2/japanese/{} \;
  rm -rf "${pkgdir}"/usr/share/cse2/japanese/data/Font/*
  ln -s /usr/share/fonts/TTF/HanaMinA.ttf "${pkgdir}"/usr/share/cse2/japanese/data/Font/font

  install -Dm755 "${srcdir}"/"${pkgbase}"/game_japanese/CSE2 "${pkgdir}"/usr/bin/cse2-japanese
  install -Dm755 "${srcdir}"/"${pkgbase}"/game_japanese/DoConfig "${pkgdir}"/usr/bin/cse2-japanese-config

  # Desktop files
  install -Dm755 "${srcdir}"/cse2-japanese.desktop "${pkgdir}"/usr/share/applications/cse2-japanese.desktop
  install -Dm755 "${srcdir}"/cse2-japanese-config.desktop "${pkgdir}"/usr/share/applications/cse2-japanese-config.desktop

  # Icon
  install -Dm644 "${srcdir}"/"${pkgbase}"/assets/resources/ICON/ICON_MINI.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/cse2-japanese.png

  # License
  install -Dm644 "${srcdir}"/"${pkgbase}"/LICENCE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
