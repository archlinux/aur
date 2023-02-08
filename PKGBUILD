# Maintainer: Robert Gonciarz <gonciarz@gmail.com> 
# all credits for LibreELEC team

pkgbase=libreelec-usb-sd-creator-git
pkgname=('libreelec-usb-sd-creator-git')
_gitname=('usb-sd-creator')
pkgver=r1.d5922e2
pkgrel=3
pkgdesc="A simple GUI for creating LibreELEC USB/SD card installation media"
arch=('i686' 'x86_64')
url="https://github.com/LibreELEC/usb-sd-creator"
license=('GPLv2')
makedepends=('git' 'dos2unix' 'qt6-tools' 'qt6-base')
source=("git+https://github.com/LibreELEC/usb-sd-creator")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname%-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
    cd "${_gitname%-git}"
    dos2unix creator.pro
    patch --forward --strip=1 --input="${srcdir}/../project.patch"
}

build() {
  cd "${_gitname%-git}"
  QT_PATH=/usr/lib/qt6
  export PATH=$QT_PATH/bin:$PATH
  lrelease creator.pro
  qmake creator.pro
  make -j4
}

package() {
  cd "${_gitname%-git}"
  install -Dm755 LibreELEC.USB-SD.Creator.Linux-bit.bin "${pkgdir}"/usr/bin/libreelec-usb-sd-creator
}

