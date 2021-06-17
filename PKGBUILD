# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=midieditor
pkgver=3.3.2
pkgrel=2
pkgdesc="Graphical interface to edit, play, and record Midi data"
arch=('i686' 'x86_64')
url="https://midieditor.org"
license=('GPL3')
depends=('qt5-multimedia')
makedepends=('qt5-tools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/markusschwenk/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver-fix-building.patch"
        "$pkgname.sh"
        "MidiEditor.desktop")
sha256sums=('5d6e65b336bbaa4a7fd1321c14ff8f3fd506231f392fbce5b605bf051d86816f'
            '01c0129ed24eea78971e48545bff43f23f046b9230ff8d1fb8d7f84206ce17ca'
            'f7b7668c2a0ead8eb837e0943d494644cc18199af91485bb41a550ac47cc8d73'
            '14fa01e93af2ab167d359c203457f73c3072da7aebea90a4e91cf502e1196ef4')

prepare() {
  patch -Np0 < $pkgname-$pkgver-fix-building.patch
}

build() {
  cd $pkgname-$pkgver

  qmake
  make
}

package() {
  cd $pkgname-$pkgver

  # launcher + binary
  install -Dm0755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm0755 MidiEditor "$pkgdir"/usr/lib/midieditor/MidiEditor

  # data
  install -d "$pkgdir"/usr/share/midieditor
  cp -rup packaging/metronome "$pkgdir"/usr/share/midieditor/

  # .desktop entry
  install -Dm0644 ../MidiEditor.desktop "$pkgdir"/usr/share/applications/MidiEditor.desktop
  install -Dm0644 packaging/unix/midieditor/logo48.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
