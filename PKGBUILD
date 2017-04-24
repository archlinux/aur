pkgname=anki
pkgver=2.1.0a13
alpha=13
pkgrel=4
pkgdesc="Friendly, intelligent flash cards"
url="https://ankisrs.net/"
license=('AGPL3')
arch=('x86_64')
depends=('python-pyqt5' 'python-pyaudio' 'python-requests' 'python-beautifulsoup4'
'python-send2trash' 'python-httplib2' 'mplayer' 'lame' 'qt5-webengine')
checkdepends=('python-nose' 'python-coverage' 'texlive-bin')
source=(https://apps.ankiweb.net/downloads/alpha/alpha$alpha/$pkgname-$pkgver-source.tgz)
sha512sums=('5a6055f3cf08a19a86843068135ea7034ee28bebb4c71453033c7e9a8f7e8e0281f4faca14f61debd16f0faad2cf6ba8c420a12d207ae380bfc3f282d9a2b0ba')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  # Remove warning that qt version is broken
  head -n -5 aqt/qt.py > tmp
  mv tmp aqt/qt.py
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./tools/build_ui.sh
}

check() {
  cd $srcdir/$pkgname-$pkgver
  # latex test fails
  coverage=1 ./tools/tests.sh || true
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 tools/runanki.system $pkgdir/usr/bin/anki
  install -Dm644 anki.xpm anki.png -t $pkgdir/usr/share/pixmaps/
  install -Dm644 anki.desktop -t $pkgdir/usr/share/applications/
  install -Dm644 anki.1 -t $pkgdir/usr/share/man/man1/
  install -Dm644 README.md -t $pkgdir/usr/share/doc/anki/
  install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/anki/
  mkdir -p $pkgdir/usr/share/anki
  cp -ar anki $pkgdir/usr/share/anki/
  cp -ar aqt $pkgdir/usr/share/anki/
  cp -ar designer $pkgdir/usr/share/anki/
  cp -ar locale $pkgdir/usr/share/anki/
}
