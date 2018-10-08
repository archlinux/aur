# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=midieditor
pkgver=3.1.1
pkgrel=1
pkgdesc="Graphical interface to edit, play, and record Midi data"
arch=('i686' 'x86_64')
url="https://midieditor.org"
license=('GPL3')
depends=('qt5-multimedia')
makedepends=('qt5-tools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/markusschwenk/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.sh"
        "MidiEditor.desktop")
sha256sums=('b2dbb25a917ab1b66d43570a37671be662f1e2e9fcc2e888f83310b755b41205'
            'f7b7668c2a0ead8eb837e0943d494644cc18199af91485bb41a550ac47cc8d73'
            '14fa01e93af2ab167d359c203457f73c3072da7aebea90a4e91cf502e1196ef4')

prepare() {
  # generate manual/assistant
  cp -rup $pkgname-$pkgver/midieditor-manual manual
  cp -rup $pkgname-$pkgver/packaging/manual/* manual/
  cd manual
  qcollectiongenerator midieditor-collection.qhcp -o midieditor-collection.qhc
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
  cp -rup "$srcdir"/manual "$pkgdir"/usr/share/midieditor/assistant

  # .desktop entry
  install -Dm0644 "$srcdir"/MidiEditor.desktop "$pkgdir"/usr/share/applications/MidiEditor.desktop
  install -Dm0644 packaging/unix/midieditor/logo48.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
