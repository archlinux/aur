# Creator: Dimitris Panokostas
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
pkgname=amiberry
pkgver=7.1.1
pkgrel=0
pkgdesc="Optimized Amiga emulator"
arch=('x86_64' 'armv7' 'aarch64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'enet' 'libpcap' 'tinyxml2')
makedepends=('glibc' 'git' 'cmake' 'ninja')
provides=("amiberry=${pkgver}")
conflicts=('amiberry-git' 'amiberry-lite')
source=(${pkgname%-git}::'git+https://github.com/BlitterStudio/amiberry.git#commit=c53d6db770a5580732a7f2bb48abcbfcd95fd0f4')
sha256sums=('SKIP')
options=('!lto')

build() {
  cd ${pkgname}
  cmake \
  -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  && cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install ${pkgname}/build
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications/"

# adding desktop entry
  echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Type=Application" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Name=Amiberry" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Comment=An Amiga emulator for Linux" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Categories=Game;Emulator;" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Icon=/usr/share/amiberry/data/amiberry.png" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Exec=/usr/bin/${pkgname}" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Terminal=false" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
