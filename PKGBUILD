# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=midieditor
pkgver=3.0.0
pkgrel=1
pkgdesc="Graphical interface to edit, play, and record Midi data"
arch=('i686' 'x86_64')
url="http://midieditor.sourceforge.net/"
license=('GPL3')
depends=('qt4' 'sfml')
makedepends=('subversion' 'imagemagick')
source=($pkgname-$pkgver::'svn+https://svn.code.sf.net/p/midieditor/code/trunk#revision=66' # 3.0.0 is not tagged
        "$pkgname.sh"
        "MidiEditor.desktop")
sha256sums=('SKIP'
            'f7b7668c2a0ead8eb837e0943d494644cc18199af91485bb41a550ac47cc8d73'
            '14fa01e93af2ab167d359c203457f73c3072da7aebea90a4e91cf502e1196ef4')

prepare() {
  cd $pkgname-$pkgver

  # convert icon
  convert -resize 48x48 run_environment/graphics/$pkgname.png ../$pkgname.png
}

build() {
  cd $pkgname-$pkgver

  qmake-qt4
  make
}

package() {
  cd $pkgname-$pkgver

  # launcher + binary
  install -Dm0755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm0755 MidiEditor "$pkgdir"/usr/lib/midieditor/MidiEditor

  # data
  cd run_environment
  install -d "$pkgdir"/usr/share/midieditor/assistant
  install -m0644 assistant/$pkgname-*.q* "$pkgdir"/usr/share/midieditor/assistant/
  cp -rup graphics metronome $pkgname.ico version_info.xml "$pkgdir"/usr/share/midieditor/

  # .desktop entry
  install -Dm0644 "$srcdir"/MidiEditor.desktop "$pkgdir"/usr/share/applications/MidiEditor.desktop
  install -Dm0644 "$srcdir"/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
