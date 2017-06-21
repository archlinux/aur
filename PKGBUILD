# Maintainer: bartus <aur@bartus.33mail.com>

pkgname=awesomebump-git
pkgver=5.0.r13.g521bafb
pkgrel=3
pkgdesc="A free program designed to generate normal, height, specular or ambient occlusion textures from a single image"
arch=('i686' 'x86_64')
url="http://awesomebump.besaba.com/"
license=('LGPL3')
depends=('qt5-base' 'qt5-location' 'qt5-script')
conflicts=('awesomebump')
makedepends=('imagemagick' 'git' 'wget' 'unzip' 'mesa-demos')
source=("${pkgname}::git+https://github.com/kmkolasinski/AwesomeBump.git#commit=521bafb"
        "awesomebump.log.file.moved.to.tmp.patch"
        "awesomeBump.sh"
        "awesomebump.desktop")
md5sums=('SKIP'
         'ef914dfd9c801fc0e74ebc3d4ced7dca'
         '9371d46df5722a0667435209a1748755'
         '8ec11bf7486fa4a3c0291efe86d79696')

vergte() {
    [  "$2" = "`echo -e \"$1\n$2\" | sort -V | head -n1`" ]
}

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long --tags | sed 's/^Linuxv//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
  patch -Np1 -i ../awesomebump.log.file.moved.to.tmp.patch
  glver=$(LIBGL_ALWAYS_INDIRECT=1 glxinfo |sed -n '/OpenGL version string:/s/^.*: \([0-9.]*\).*$/\1/p')
  #glver=3.3 # uncomment for headles system to build opengl330 version
  if (vergte $glver 3.3) ; then
    sed -i 's:qmake:qmake "CONFIG+=gl330":' unixBuildScript.sh
  fi
}

build() {
  cd ${srcdir}/${pkgname}
  #sed -i 's:MY_QT_PATH=/Qt/5.6:MY_QT_PATH=/usr/bin:' unixBuildScript.sh
  sed -i 's:MY_QT_PATH=:MY_QT_PATH=/usr/bin:' unixBuildScript.sh
  sed -i "s: make: make ${MAKEFLAGS}:" unixBuildScript.sh
  ./unixBuildScript.sh
}

package() {
  cd ${srcdir}
  install -dm755 "${pkgdir}/opt"

  cp --preserve=mode -r ${pkgname}/Bin "${pkgdir}/opt/awesomebump"

  convert ${pkgname}/Sources/resources/icons/icon.ico awesomebump.png
  install -Dm644 "awesomebump.png" "${pkgdir}/usr/share/pixmaps/awesomebump.png"
  install -Dm644 "awesomebump.desktop" "${pkgdir}/usr/share/applications/awesomebump.desktop"
  install -Dm755 "awesomeBump.sh" "${pkgdir}/usr/bin/awesomeBump"

}
