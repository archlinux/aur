# Creator: Dimitris Panokostas
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry
pkgver=5.6.5
pkgrel=1
epoch=20231215
pkgdesc="Amiga Emulator for ARM Boards (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport')
makedepends=('glibc' 'git' 'cmake')
provides=("amiberry=${pkgver}")
conflicts=('amiberry')
source=(https://github.com/BlitterStudio/amiberry/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('7e9bbd68b840339654b541ccd577fa4f')
sha256sums=('cd925ea6d4e4dec4e2e9abd2280d8c14bb8e47dee777930472a0be3313037b4b')

build() {
  cd ${pkgname}-${pkgver}
  PLATFORM=x86-64 cmake .
  make
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${pkgname}/"

  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/share/${pkgname}/"

  # Create a wrapper script to set the CWD
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname}"
  echo "cd /usr/share/${pkgname}" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "./${pkgname} \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname}"
  
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  echo -e "\e[1;33mAmiberry has no .desktop entry, please run from \"amiberry\" on your terminal\e[0m"
}
