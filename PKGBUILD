# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry
pkgver=873103af0df5044044501d5807f119bcce582da8
pkgrel=1
epoch=20231118
pkgdesc="Amiga Emulator for ARM Boards (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport')
makedepends=('glibc' 'git' 'cmake')
provides=("amiberry=${pkgver}")
conflicts=('amiberry')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  make PLATFORM=x86-64 -j$(nproc)
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${pkgname}/"

  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/usr/share/${pkgname}/"

  # Create a wrapper script to set the CWD
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname}"
  echo "cd /usr/share/${pkgname}" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "./${pkgname} \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname}"
  
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
