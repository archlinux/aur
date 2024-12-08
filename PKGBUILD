# Creator: Dimitris Panokostas
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry
pkgver=7.0.0.rc1
pkgrel=0
pkgdesc="Amiga Emulator for ARM Boards (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'enet')
makedepends=('glibc' 'git' 'cmake' 'ninja')
provides=("amiberry=${pkgver}")
conflicts=('amiberry')
source=(${pkgname%-git}::'git+https://github.com/BlitterStudio/amiberry.git#commit=95e54b5af72fec8dd8218acb0b41ac9312be233b')
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  cmake -B build -DCMAKE_BUILD_TYPE=Debug -G Ninja -DCMAKE_INSTALL_PREFIX=/opt/${pkgname}/ && cmake --build build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/usr/share/${pkgname}/"
  install -d "${pkgdir}/usr/share/applications/"
  # copying source and build dir to installation path
  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/opt/${pkgname}/"
  # copying AmigaTopaz TTF to amiberry binary folder
  cp "${srcdir}/${pkgname}/data/AmigaTopaz.ttf" "${pkgdir}/opt/${pkgname}/build"
  # create a wrapper script to set the CWD
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname}"
  echo "cd /opt/${pkgname}/build" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "./${pkgname} \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  # adding desktop entry
  echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Type=Application" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Name=Amiberry" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Comment=An Amiga emulator for Linux" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Categories=Game;Emulator;" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Icon=/opt/amiberry/data/amiberry.png" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Exec=/usr/bin/${pkgname}" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Terminal=false" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  chmod 744 "${pkgdir}/usr/share/applications/amiberry.desktop"  
}
