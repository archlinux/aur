# Contributor: Stephen Checkley <scheckley at gmail dot com>
# Contributor: jrohwer
_base=COPASI
pkgname=${_base,,}-bin
pkgver=4.46.300
_pkgver=${pkgver##*.}
pkgrel=1
pkgdesc="COmplex PAthway SImulator for analysis of biochemical networks and their dynamics"
arch=(x86_64)
url="https://${_base,,}.org"
license=(Artistic-2.0)
depends=(shared-mime-info freetype2 glu)
source=(${_base,,}-desktop.tar.gz)
install=${_base,,}.install
noextract=($pkgname-$pkgver.tar.gz)
_source=https://github.com/${_base,,}/${_base}/releases/download/Build-${_pkgver}
source_x86_64=(${_base}-$pkgver-Linux-x86_64.sh::${_source}/${_base}-$pkgver-Linux-64bit.sh)
sha512sums=('cf7172b155885db8007298643499a57421e4890b72da86f8124bc35ec30c39f17c4167cd5d4603fc37c0cf72c6e4283c009339363da1cc5f44708c08d16a2b4e')
sha512sums_x86_64=('eee0affe040610bb7446bda2e1347ea2c18856e2bc00da49be600709834fa3c3374b7734d71c54d00333212af21004ad9463b68a717a8656a1fdb4f1d0b95491')

package() {
  cd "$srcdir"
  sh ${_base}-$pkgver-Linux-${CARCH}.sh -e $(pwd)

  cd "$srcdir"/COPASI-${pkgver}-Linux-64bit
  rm share/copasi/lib/libfreetype.so.6
  ln -s /usr/lib/libfreetype.so share/copasi/lib/
  ln -s /usr/lib/libfreetype.so.6 share/copasi/lib/

  # install program files
  install -d "$pkgdir"/usr/{bin,share}
  install -m755 bin/* "$pkgdir"/usr/bin
  cp -R share/copasi "$pkgdir"/usr/share/

  # desktop integration...
  cd "$srcdir"/copasi-desktop
  install -Dm755 copasi.sh "$pkgdir/etc/profile.d/copasi.sh"
  install -Dm644 copasi.desktop "$pkgdir/usr/share/applications/copasi.desktop"
  install -Dm644 copasi.xml "$pkgdir/usr/share/mime/packages/copasi.xml"
  install -d "$pkgdir/usr/share/icons/hicolor"
  cp -R icons/* "$pkgdir/usr/share/icons/hicolor/"
  # copasi starts CopasiUI after setting COPASIDIR environment variable
  # useful for launching COPASI using the menu entry
  install -Dm755 copasi "$pkgdir/usr/bin/copasi"
}
