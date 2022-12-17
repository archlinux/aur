# Contributor: Stephen Checkley <scheckley at gmail dot com>
# Contributor: jrohwer
pkgname=copasi-bin
pkgver=4.38.268
_pkgver=${pkgver##*.}
pkgrel=2
pkgdesc="COmplex PAthway SImulator for analysis of biochemical networks and their dynamics"
arch=('i686' 'x86_64')
url="https://copasi.org"
license=('Artistic 2.0')
depends=(shared-mime-info freetype2 glu)
source=(copasi-desktop.tar.gz)
install=copasi.install
noextract=($pkgname-$pkgver.tar.gz)
_source=https://github.com/copasi/COPASI/releases/download/Build-$_pkgver
source_i686=($pkgname-$pkgver.sh::$_source/COPASI-$pkgver-Linux-32bit.sh)
source_x86_64=($pkgname-$pkgver.sh::$_source/COPASI-$pkgver-Linux-64bit.sh)
sha512sums=('cf7172b155885db8007298643499a57421e4890b72da86f8124bc35ec30c39f17c4167cd5d4603fc37c0cf72c6e4283c009339363da1cc5f44708c08d16a2b4e')
sha512sums_i686=('36ceeb8c6b34812a7bf32a35d7a7f17c2224f94f7b4399eacf510a2ddfed6dcf662a2a3aefc9f55fec9a18e13dcc5b412ef78c813747708f86b101b257821658')
sha512sums_x86_64=('2ade625cc628c18b97786c2edbb5484771b55fb0b9c7a7af4312b5b78740fabd5ad2271e842bde83429dec6d37bf92e90a3fe73b813159e689128d78aefc3250')

package() {
  MACHINE_TYPE=$(uname -m)
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    arch_flag=64bit
  else
    arch_flag=32bit
  fi

  cd "$srcdir"
  sh $pkgname-$pkgver.sh -e $(pwd)

  cd "$srcdir"/COPASI-${pkgver}-Linux-${arch_flag}
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
