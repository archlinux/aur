# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
# Contributor: None

pkgname=limo-git
pkgdesc='A simple Qt based mod manager.'
pkgver=r138.662e695
pkgrel=1
epoch=0
url='https://github.com/limo-app/limo/'
arch=('x86_64')
license=('GPL3')
makedepends=('boost' 'cbindgen' 'cmake' 'cpr' 'git' 'jsoncpp' 'imagemagick'
             'libarchive' 'libloot' 'librsvg' 'libunrar' 'openssl' 'pugixml'
             'spdlog' 'qt5-base' 'qt5-svg' 'qt5-tools')
depends=('boost-libs' 'cpr' 'jsoncpp' 'libarchive' 'libloot' 'librsvg'
         'libunrar' 'openssl' 'pugixml' 'spdlog' 'qt5-base' 'qt5-svg'
         'qt5-tools')

optdepends=('doxygen')
source=("${pkgname}::git+https://github.com/limo-app/limo.git"
        'io.github.limo_app.limo.svg')
cksums=('SKIP'
        '777140566')

pkgver() {
  cd "${pkgname}" || return
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}" || return
  mkdir build
  # Weird way of using unrar if not using system, just use system
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DUSE_SYSTEM_LIBUNRAR=true \
    -DLIMO_INSTALL_PREFIX=/usr \
    -S . -B build
  cmake --build build -j$(nproc)
  cd build && make || return
  # They appear not have made up their minds about renaming it to limo
  mv 'Limo' 'limo' 2>/dev/null || true
  DOXYGEN_DETECTED=$(which doxygen 2>/dev/null || true)
  if [[ -n ${DOXYGEN_DETECTED} ]]; then
    cd ..  # Doxygen doesn't like a relative path below
    doxygen 'src/lmm_Doxyfile'
  fi
}

package() {
  cd "${pkgname}" || return
  install -Dm 755 -t "${pkgdir}/usr/bin" 'build/limo'
  install -Dm 644 -t "${pkgdir}/usr/share/applications" 'flatpak/io.github.limo_app.limo.desktop'
  install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" '../io.github.limo_app.limo.svg'
  install -Dm 644 -t "${pkgdir}/usr/share/limo" 'install_files/changelogs.json'
  install -dm 755 "${pkgdir}/usr/share/limo/steam_app_configs"
  # "Install" is stupid and doesn't handle files recursively and 
  # we're not "supposed to use cp -r" so this is the alternative...
  find steam_app_configs/* -type f -exec install -Dm 644 \
    -t "${pkgdir}/usr/share/limo/steam_app_configs" '{}' \;
  for size in {16,22,24,32,48,64,128,256,512}
  do
    magick -background none '../io.github.limo_app.limo.svg' -resize ${size} "../io.github.limo_app.limo-${size}x${size}.png"
      install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps" "../io.github.limo_app.limo-${size}x${size}.png"
  done
}
