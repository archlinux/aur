# Contributor: Stephen Checkley <scheckley at gmail dot com>
# Contributor: jrohwer
_base=COPASI
pkgname=${_base,,}-bin
pkgver=4.43.288
_pkgver=${pkgver##*.}
pkgrel=1
pkgdesc="COmplex PAthway SImulator for analysis of biochemical networks and their dynamics"
arch=(i686 x86_64)
url="https://${_base,,}.org"
license=(Artistic-2.0)
depends=(shared-mime-info freetype2 glu)
source=(${_base,,}-desktop.tar.gz)
install=${_base,,}.install
noextract=($pkgname-$pkgver.tar.gz)
_source=https://github.com/${_base,,}/${_base}/releases/download/Build-${_pkgver}
source_i686=(${_base}-$pkgver-Linux-i686.sh::$_source/${_base}-$pkgver-Linux-32bit.sh)
source_x86_64=(${_base}-$pkgver-Linux-x86_64.sh::$_source/${_base}-$pkgver-Linux-64bit.sh)
sha512sums=('cf7172b155885db8007298643499a57421e4890b72da86f8124bc35ec30c39f17c4167cd5d4603fc37c0cf72c6e4283c009339363da1cc5f44708c08d16a2b4e')
sha512sums_i686=('8f14d024e028881e7443cb8cd9253f808b18f04c8ec6e28a1388612e9f7deb02516f91e3d31af9ee654a4c451771cd39f9169bd7b1e147ef5591bfd085b1e12a')
sha512sums_x86_64=('974378997c348d942ec3dc78a201d4fbfcf6c95923514353c4d069c61c42c9695596c8aa9803c49cd8e029cd88ebaac4b3eb2a0001875a059025933a9f3499c2')

package() {
  MACHINE_TYPE=$(uname -m)
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    arch_flag=64bit
  else
    arch_flag=32bit
  fi

  cd "$srcdir"
  sh ${_base}-$pkgver-Linux-${CARCH}.sh -e $(pwd)

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
