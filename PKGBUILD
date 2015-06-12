# Maintainer: Michael Schubert <mschu.dev at google mail>

pkgname=copasi
pkgver=4.13.87
pkgrel=1
pkgdesc="COmplex PAthway SImulator for analysis of biochemical networks and their dynamics"
arch=('i686' 'x86_64')
url="http://www.copasi.org/"
license=('Artistic 2.0')
depends=('shared-mime-info' 'qtwebkit' 'glu')
source=('copasi-desktop.tar.gz')
md5sums=('9582e4e3d0d1d5433dea4c48f1f5f396')
install=copasi.install
noextract=($pkgname-$pkgver.tar.gz)

if [ "$CARCH" = "i686" ]; then
  source=("${source[@]}" $pkgname-$pkgver.tar.gz::http://www.copasi.org/static/packages/COPASI-$pkgver-Linux-32bit.tar.gz)
  md5sums=("${md5sums[@]}" '4b66ff9bfb02d7441db0031b7a22e722')
fi
if [ "$CARCH" = "x86_64" ]; then
  source=("${source[@]}" $pkgname-$pkgver.tar.gz::http://www.copasi.org/static/packages/COPASI-$pkgver-Linux-64bit.tar.gz)
  md5sums=("${md5sums[@]}" '95bf0c46c12bc241c729e708a771ec9f')  
fi

package() {
  cd "$srcdir"
  tar -xf $pkgname-$pkgver.tar.gz --strip=1

  # install program files
  install -d "$pkgdir"/usr/{bin,share}
  install -m755 bin/* "$pkgdir/usr/bin"
  cp -R share/$pkgname "$pkgdir/usr/share/"
  
  # desktop integration...
  cd "$srcdir/$pkgname-desktop"
  install -Dm755 copasi.sh "$pkgdir/etc/profile.d/copasi.sh"
  install -Dm644 copasi.desktop "$pkgdir/usr/share/applications/copasi.desktop"
  install -Dm644 copasi.xml "$pkgdir/usr/share/mime/packages/copasi.xml"
  install -d "$pkgdir/usr/share/icons/hicolor"
  cp -R icons/* "$pkgdir/usr/share/icons/hicolor/"
  # copasi starts CopasiUI after setting COPASIDIR environment variable
  # useful for launching COPASI using the menu entry
  install -Dm755 copasi "$pkgdir/usr/bin/copasi"
}
