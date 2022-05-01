# Maintainer: gandalf3 <zzyxpaw at gmail dot com>

pkgname=('enigma-dev-git')
pkgver=4768.d4771fde1
pkgrel=1
pkgdesc="ENIGMA, the Extensible Non-Interpreted Game Maker Augmentation."
url="http://enigma-dev.org"
arch=('x86_64' 'i686')
license=('GPL')
depends=('wget' 'gcc' 'gdb' 'pkg-config' 'protobuf' 'protobuf-c' 'zlib' 'glew' 'glm' 'libpng' 'glu' \
         'mesa' 'openal' 'libogg' 'alure' 'mpg123' 'fluidsynth' 'libvorbis' 'vorbis-tools' 'box2d' 'dumb' 'sdl2' \
         'freetype2' 'libffi' 'libx11' 'libxrandr' 'libxinerama' 'jre-openjdk' 'jdk-openjdk' 'pkg-config' \
         'rapidjson' 'yaml-cpp' 'boost' 'grpc' 'pugixml' 'zenity' 'kdialog')

makedepends=('git' 'make')
conflicts=('lateralgm')
provides=('lateralgm')
install='enigma-dev-git.install'
source=('lateralgm' 'emake' 'lateralgm.desktop' 'git+https://github.com/enigma-dev/enigma-dev.git' 'http://enigma-dev.org/docs/wiki/images/4/47/Lateralgmlogo.png')
sha256sums=('465270e7d8042b6022936509e3e59563f38c5df94827979aca3d4429919b20b3'
         '0e3965d44fba153ed78cc9b33701397b951291a7cc23c2cbc1ead17a67a131d7'
         '967f3d6f315a4568dc081ec55664998d68e0556eb5e25c87506179dc41db8008'
         'SKIP'
         '775377940f41bec376cf4656312341efa034315e61130b6c5748bff9752b4d01')

build() {
  # install lateralgm
  cd "${srcdir}/enigma-dev"
  msg "Installing LateralGM..."
  bash install.sh
  
  # compile enigma
  cd "${srcdir}/enigma-dev"
  msg "Compiling Enigma..."
  make clean
  make

  msg "Compiling emake..."
  make emake

  msg "Done building!"
  }
  
pkgver () {
  cd "${srcdir}/enigma-dev"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  # only mkdir if doesn't exist!
  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/share"
  mkdir -p "${pkgdir}/usr/bin"

  msg "Installing files..."
  cp -r -a "${srcdir}/enigma-dev" "${pkgdir}/opt/${pkgname}"
  chmod -R 755 "${pkgdir}/opt/${pkgname}"
  install -D "${srcdir}/Lateralgmlogo.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lateralgm.png"
  
  msg "Setting up binaries..."
  install -D "${srcdir}/lateralgm" "${pkgdir}/usr/bin/lateralgm"
  install -D "${srcdir}/emake" "${pkgdir}/usr/bin/emake"
  chmod +x "${pkgdir}/usr/bin/lateralgm"
  chmod +x "${pkgdir}/usr/bin/emake"

  msg "Adding menu shortcuts..."
  install -D "${srcdir}/lateralgm.desktop" "${pkgdir}/usr/share/applications/lateralgm.desktop"
  
  # remove some extra stuff to help reduce package size; more of this is may be possible.
  rm -rf "${pkgdir}/opt/${pkgname}/.git"
}
