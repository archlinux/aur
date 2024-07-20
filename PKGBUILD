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
            'd55e0eef39c78ebb9d34bc7312b7bcf77761d4477c905a1505f8f9f970621801'
            '0b89785327c2a3246672cd8030963488d35b24463c1429cf6a376fe77d79fd81'
            '3f8cea49e04d2cd4f3dc5db48258db194da814437f3aa1edec997542727b60aa'
            '838d2180c0ba3b45172bffcce029dd95977d084dd7e9c04e25c5b65b313998b9'
)

pkgver() {
  cd "${pkgbase}" || exit
  git describe --abbrev=7 --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -d "${pkgbase}" -Np1 < path_fix.patch

  export LDFLAGS
  cmake -B build -S "${pkgbase}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wno-error=format-security" \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DFIX_BUGS:BOOL=ON \
    -DFREETYPE_FONTS:BOOL=ON \
    -Wno-dev
}

build() {
  cmake --build build

  export LDFLAGS
  cmake -B build -S "${pkgbase}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wno-error=format-security" \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DFIX_BUGS:BOOL=ON \
    -DFREETYPE_FONTS:BOOL=ON \
    -DJAPANESE:BOOL=ON \
    -Wno-dev
  cmake --build build
}

package_cse2-english-git() {
  conflicts=('cse2-english')
  provides=('cse2-english')

  pushd "${srcdir}"/"${pkgbase}"/game_english || return
  find data -type f -exec install -Dm644 {} "${pkgdir}"/usr/share/cse2/english/{} \;

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

  pushd "${srcdir}"/"${pkgbase}"/game_japanese || return
  find data -type f -exec install -Dm644 {} "${pkgdir}"/usr/share/cse2/japanese/{} \;

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
