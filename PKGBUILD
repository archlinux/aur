# Maintainer: Andrew Krasichkov <buglloc _ at _ yandex _ dot _ru>

pkgname=brick
pkgver=0.2.4.31
pkgrel=1
pkgdesc="Bitrix24 messenger"
arch=('i686' 'x86_64')
url="https://github.com/buglloc/brick"
license=("MIT")
depends=("alsa-lib" "desktop-file-utils" "gconf" "libxtst" "libxss" "xdg-utils" "gtk2" "libnotify" "nss")
optdepends=("libappindicator-gtk2: modern system indicator support for KDE5, Cinnamon, Unity, etc")
conflicts=("brick-git" "mesa-demos")
makedepends=("p7zip" "cmake")
install=${pkgname}.install
source=("https://github.com/buglloc/brick/archive/v${pkgver}.tar.gz")
sha256sums=("8e14f23b07b2585bf95a072dc5b5d26a0ce92754badf263a7d088f75627c00f8")
source_x86_64=("https://github.com/buglloc/cef-builds/raw/68a8676091f1caa9acaf1f66531a272b99846367/libs/cef-x86_64.tar.gz")
sha256sums_x86_64=("707dbbcf036770cffb163d14d747e4edc4e769e8f813d3cd29c847426e2268ca")
source_i686=("https://github.com/buglloc/cef-builds/raw/2c8ddaf890b7b9cc9353f7bad745109c4fd2083e/libs/cef-i686.tar.gz")
sha256sums_i686=("fa20cb5e2dd47097861e90e7b0308bf3c4d01cc8d058ef2109b1109609181876")
noextract=("cef-i686.tar.gz" "cef-x86_64.tar.gz")

prepare() {
  mkdir -p "brick-${pkgver}/Release/"
  tar -xzf "cef-${CARCH}.tar.gz" --directory "brick-${pkgver}/Release"
}

build() {
  cd ${srcdir}
  mkdir -p out
  cd out
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} -DUNITY_DESKTOP=OFF "../brick-${pkgver}"
  make
}

package() {
  cd ${srcdir}/out
  make install
  install -dm755 "${pkgdir}/usr/bin"
  rm -f "${pkgdir}/usr/bin/brick"
  rm -f "${pkgdir}/usr/bin/brick-client"
  ln -s /opt/brick/brick "${pkgdir}/usr/bin/brick"
  ln -s /opt/brick/bin/brick-client "${pkgdir}/usr/bin/brick-client"
}
