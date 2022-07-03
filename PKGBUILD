# Maintainer: gandalf3 <zzyxpaw at gmail dot com>

pkgname=('enigma-dev-git')
pkgver=4771.c6d773671
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
source=('enigma' 'emake' 'enigma-dev.desktop' 'git+https://github.com/enigma-dev/enigma-dev.git' 'https://github.com/enigma-dev/enigma-dev/raw/master/Resources/logo.png')
sha256sums=('58ef885f3587ee9330926a975d3f1e71eb5c753ba192c91204c12f2bdb7e8548'
         '9a84e88a82569a9da5e017f52dcfad4334b0775631f7fb9b149c0bbe2ff09fdb'
         '29edd95e3ba543c85a68e073a0b07f5e59c533e174108f6ff07b832f48546b8d'
         'SKIP'
         '158c62f513d9c2da92bb3f31416256d9efdf9319a7b6b761ed39b0a5ac28fc90')

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
  install -D "${srcdir}/logo.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/enigma-dev.png"
  
  msg "Setting up binaries..."
  install -D "${srcdir}/enigma" "${pkgdir}/usr/bin/enigma-dev"
  install -D "${srcdir}/emake" "${pkgdir}/usr/bin/emake"
  chmod +x "${pkgdir}/usr/bin/enigma-dev"
  chmod +x "${pkgdir}/usr/bin/emake"

  msg "Adding menu shortcuts..."
  install -D "${srcdir}/enigma-dev.desktop" "${pkgdir}/usr/share/applications/enigma-dev.desktop"
  
  # remove some extra stuff to help reduce package size; more of this is may be possible.
  rm -rf "${pkgdir}/opt/${pkgname}/.git"
}
