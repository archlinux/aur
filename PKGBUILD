# Maintainer: bartus <aur@bartus.33mail.com>

pkgname=awesomebump-git
pkgver=5.0.r9.g8ce9963
pkgrel=1
pkgdesc="A free program designed to generate normal, height, specular or ambient occlusion textures from a single image"
arch=('i686' 'x86_64')
url="http://awesomebump.besaba.com/"
license=('LGPL3')
depends=('qt5-base' 'qt5-location' 'qt5-script')
conflicts=('awesomebump')
makedepends=('imagemagick' 'git' 'wget' 'unzip')
source=("${pkgname}::git+https://github.com/kmkolasinski/AwesomeBump.git"
        "awesomeBump.sh"
        "awesomebump.desktop")
md5sums=('SKIP'
         '9371d46df5722a0667435209a1748755'
         'a798a1946042f5c06505043100a32e28')

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long --tags | sed 's/^Linuxv//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}
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
