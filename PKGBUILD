# Maintainer: Andrew Krasichkov <buglloc _ at _ yandex _ dot _ru>

pkgname=brick
pkgver=0.2.5.31
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
sha256sums=("6492c88d7f8799bb02067d572de94b5469045aeda18b5a254a8e1f4c5df90d2f")
source_x86_64=("https://github.com/buglloc/cef-builds/raw/a719238c09e3ff3b341650b5f5ca115799560edd/libs/cef-x86_64.tar.gz")
sha256sums_x86_64=("2d826a502b576da18d5d31f7028d3a2d10d1969b6450175c4ec596cec02d38e7")
source_i686=("https://github.com/buglloc/cef-builds/raw/f9bef61268792ac8b37bd1f45bbe62840b2682a1/libs/cef-i686.tar.gz")
sha256sums_i686=("bc8e3338ef6ea73c961a138f325ad613abbb8632fb34d4219fe58c8708c6e2fe")
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
