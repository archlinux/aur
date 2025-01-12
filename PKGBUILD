# Creator: Dimitris Panokostas
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry
pkgver=7.0.0.rc3
pkgrel=0
pkgdesc="Amiga Emulator for various ARM, ARM64, AMD64 and RISC-V platforms (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'enet')
makedepends=('glibc' 'git' 'cmake' 'ninja')
provides=("amiberry=${pkgver}")
conflicts=('amiberry-git' 'amiberry-lite')
source=(${pkgname%-git}::'git+https://github.com/BlitterStudio/amiberry.git#commit=203c6cdf33ab3e825a537eea588fa3c2b52f02fb')
sha256sums=('SKIP')
options=('!lto')

build() {
  cd ${pkgname}
  cmake \
  -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/opt/${pkgname} \
  -G Ninja \
  && cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install ${pkgname}/build --prefix /opt/${pkgname}
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications/"
  # create a wrapper script to set the CWD
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname}"
  echo "cd /opt/${pkgname}/bin" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "./${pkgname} \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
  # adding desktop entry
  echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Type=Application" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Name=Amiberry" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Comment=An Amiga emulator for Linux" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Categories=Game;Emulator;" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Icon=/opt/amiberry/share/amiberry/data/amiberry.png" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Exec=/usr/bin/${pkgname}" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  echo "Terminal=false" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop" 
}