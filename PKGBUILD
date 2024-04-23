# Creator: Dimitris Panokostas
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry
pkgver=5.7.0
pkgrel=1
epoch=20240423
pkgdesc="Amiga Emulator for ARM Boards (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi')
makedepends=('glibc' 'git' 'cmake')
provides=("amiberry=${pkgver}")
conflicts=('amiberry')
source=(https://github.com/BlitterStudio/amiberry/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('7510b9467e05a3af43096fa752dd0188')
sha256sums=('c1ad8e98d9cbb00ca9572923a0757a2c934b06a795fb49d599781ea8ae4a82e6')

build() {
  cd ${pkgname}-${pkgver}
  PLATFORM=x86-64 cmake .
  make
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${pkgname}/"
  install -d "${pkgdir}/usr/share/applications/"

  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/share/${pkgname}/"

  # Create a wrapper script to set the CWD
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname}"
  echo "cd /usr/share/${pkgname}" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "./${pkgname} \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname}"

  # adding desktop entry
  echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Type=Application" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Name=Amiberry" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Comment=An Amiga emulator for Linux" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Categories=Game;Emulator;" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Icon=/usr/share/amiberry/flatpak/256x256.png" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Exec=amiberry" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  echo "Terminal=false" >> "${pkgdir}/usr/share/applications/amiberry.desktop"
  
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
