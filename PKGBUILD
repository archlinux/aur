# Maintainer: ChTBoner
pkgname=qusb2snes-git
pkgver=r11.792adc3
pkgrel=1
pkgdesc="A Qt based webserver for usb2snes"
license=("GPL3")
arch=("x86_64")
install=.install
provides=("QUsb2Snes"
  "QFile2Snes")
makedepends=("git" "qt6-base")
depends=("qt6-websockets"
  "qt6-serialport"
)
url="https://github.com/Skarsnik/QUsb2snes"
source=("git+https://github.com/Skarsnik/QUsb2snes"
  "git+https://github.com/black-sliver/EmuNWAccess-qt"
  "QUsb2Snes.desktop"
  "QFile2Snes.desktop")
md5sums=("SKIP"
  "SKIP"
  "06da7b32748cdb5792bf8be2a9a77d42"
  "5d87882c2fe47386e2c51b0eee67a24c")
_projname="QUsb2snes"

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_projname"
  git submodule init
  git config submodule.EmuNWAccess-qt $srcdir/EmuNWaccess-qt
  git submodule update
}

build() {
  cd "$srcdir/$_projname"
  qmake6 QUsb2snes.pro CONFIG+='release'
  make
  cd "QFile2Snes"
  qmake6 QFile2Snes.pro CONFIG+='release'
  make
}

package() {
  cd "$srcdir/$_projname"
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/pixmaps"
  install -dm 755 "$pkgdir/usr/share/applications"
  install -m 644 ui/icons/cheer128x128.png "$pkgdir/usr/share/pixmaps/QUsb2snes.png"
  install -m 755 "QUsb2Snes" "$pkgdir/usr/bin/QUsb2Snes"
  cd "QFile2Snes"
  install -m 755 "QFile2Snes" "$pkgdir/usr/bin/QFile2Snes"
  install -m 644 "icon50x50.png" "$pkgdir/usr/share/pixmaps/QFile2Snes.png"
  cd "$srcdir"
  install -m 644 "QUsb2Snes.desktop" "$pkgdir/usr/share/applications/QUsb2Snes.desktop"
  install -m 644 "QFile2Snes.desktop" "$pkgdir/usr/share/applications/QFile2Snes.desktop"
}
