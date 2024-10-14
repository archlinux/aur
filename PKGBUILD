# Creator: Dimitris Panokostas
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry
pkgver=8c65d69057c12d6826ac8df300902f3cfb7df233
pkgrel=1
epoch=20241010
pkgdesc="Amiga Emulator for ARM Boards (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi')
makedepends=('glibc' 'git' 'cmake')
provides=("amiberry=${pkgver}")
conflicts=('amiberry')
source=(${pkgname%-git}::'git+https://github.com/BlitterStudio/amiberry.git#branch=preview')
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  mkdir build && cd build
  PLATFORM=x86-64 cmake -S ../ -B .
  make -j12
}

package() {
  install -d "${pkgdir}/$HOME/.local/bin/"
  install -d "${pkgdir}/$HOME/.local/share/${pkgname}/"
  install -d "${pkgdir}/$HOME/.local/share/applications/"

  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/$HOME/.local/share/${pkgname}/"
  cp "${srcdir}/${pkgname}/data/AmigaTopaz.ttf" "${pkgdir}/$HOME/.local/share/${pkgname}/build"

  # Create a wrapper script to set the CWD
  echo "#!/bin/sh" > "${pkgdir}/$HOME/.local/bin/${pkgname}"
  echo "cd $HOME/.local/share/${pkgname}/build" >> "${pkgdir}/$HOME/.local/bin/${pkgname}"
  echo "./${pkgname} \"\$@\"" >> "${pkgdir}/$HOME/.local/bin/${pkgname}"

  # adding desktop entry
  echo "[Desktop Entry]" > "${pkgdir}/$HOME/.local/share/applications/amiberry.desktop"
  echo "Type=Application" >> "${pkgdir}/$HOME/.local/share/applications/amiberry.desktop"
  echo "Name=Amiberry" >> "${pkgdir}/$HOME/.local/share/applications/amiberry.desktop"
  echo "Comment=An Amiga emulator for Linux" >> "${pkgdir}/$HOME/.local/share/applications/amiberry.desktop"
  echo "Categories=Game;Emulator;" >> "${pkgdir}/$HOME/.local/share/applications/amiberry.desktop"
  echo "Icon=$HOME/.local/share/amiberry/flatpak/256x256.png" >> "${pkgdir}/$HOME/.local/share/applications/amiberry.desktop"
  echo "Exec=amiberry" >> "${pkgdir}/$HOME/.local/share/applications/amiberry.desktop"
  echo "Terminal=false" >> "${pkgdir}/$HOME/.local/share/applications/amiberry.desktop"
  
  chmod 755 "${pkgdir}/$HOME/.local/bin/${pkgname}"
}
