# Creator: Dimitris Panokostas
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry-lite
pkgver=274c6c95b362a28fada2d7e8055f1484a0b0eff6
pkgrel=1
epoch=20240924
pkgdesc="Optimized Amiga Emulator for ARM Boards (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry-lite"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi')
makedepends=('glibc' 'git' 'cmake')
provides=("amiberry-lite=${pkgver}")
conflicts=('amiberry-lite')
source=(${pkgname%-git}::'git+https://github.com/BlitterStudio/amiberry-lite.git')
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  PLATFORM=x86-64 cmake .
  make
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${pkgname}/"
  install -d "${pkgdir}/usr/share/applications/"

  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/usr/share/${pkgname}/"

  # Create a wrapper script to set the CWD
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname}"
  echo "cd /usr/share/${pkgname}" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "./${pkgname} \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname}"

  # adding desktop entry
  echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/amiberry-lite.desktop"
  echo "Type=Application" >> "${pkgdir}/usr/share/applications/amiberry-lite.desktop"
  echo "Name=Amiberry Lite" >> "${pkgdir}/usr/share/applications/amiberry-lite.desktop"
  echo "Comment=Optimized Amiga emulator for Linux" >> "${pkgdir}/usr/share/applications/amiberry-lite.desktop"
  echo "Categories=Game;Emulator;" >> "${pkgdir}/usr/share/applications/amiberry-lite.desktop"
  echo "Icon=/usr/share/amiberry-lite/flatpak/256x256.png" >> "${pkgdir}/usr/share/applications/amiberry-lite.desktop"
  echo "Exec=amiberry-lite" >> "${pkgdir}/usr/share/applications/amiberry-lite.desktop"
  echo "Terminal=false" >> "${pkgdir}/usr/share/applications/amiberry-lite.desktop"
  
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
