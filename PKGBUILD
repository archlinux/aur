# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
# Contributor: None

pkgname=limo-git
pkgdesc='A simple Qt based mod manager.'
pkgver=r57.6eda51d
pkgrel=1
epoch=0
url='https://github.com/limo-app/limo/'
arch=('x86_64')
license=('GPL3')
makedepends=('cmake' 'cpr' 'git' 'jsoncpp' 'imagemagick' 'libarchive' 'libloot'
             'openssl' 'pugixml' 'qt5-base' 'qt5-svg' 'qt5-tools')
depends=('cpr' 'jsoncpp' 'libarchive' 'libloot' 'openssl' 'pugixml'
         'qt5-base' 'qt5-svg' 'qt5-tools')
optdepends=('doxygen')
source=("${pkgname}::git+https://github.com/limo-app/limo.git"
        'unrar-git::git+https://github.com/aawc/unrar.git'
        'io.github.limo_app.limo.svg')
cksums=('SKIP'
        'SKIP'
        '777140566')

pkgver() {
  cd "${pkgname}" || return
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mv 'unrar-git' "${pkgname}/unrar"
  cd "${pkgname}/unrar" && make lib -j$(nproc) || return
}

build() {
  cd "${pkgname}" || return
  mkdir build
  cmake -DCMAKE_BUILD_TYPE=Release -S . -B build
  cmake --build build -j$(nproc)
  cd build && make || return
  which doxygen &>/dev/null
  DOXYGEN_FOUND=$?
  if [[ ${DOXYGEN_FOUND} -eq 0 ]]; then
    cd ..
    doxygen src/lmm_Doxyfile
  fi
}

package() {
  cd "${pkgname}" || return
  install -Dm 755 -t "${pkgdir}/usr/bin" 'build/Limo'
  install -Dm 644 -t "${pkgdir}/usr/share/applications" 'flatpak/io.github.limo_app.limo.desktop'
  install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" '../io.github.limo_app.limo.svg'
  for size in {16,22,24,32,48,64,128,256,512}
  do
    magick -background none '../io.github.limo_app.limo.svg' -resize ${size} "../io.github.limo_app.limo-${size}x${size}.png"
      install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps" "../io.github.limo_app.limo-${size}x${size}.png"
  done
}
