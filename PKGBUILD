# Contributor: Stephen Checkley <scheckley at gmail dot com>
# Contributor: jrohwer
_base=COPASI
pkgname=${_base,,}-bin
pkgver=4.44.295
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
source_i686=(${_base}-$pkgver-Linux-i686.sh::${_source}/${_base}-$pkgver-Linux-32bit.sh)
source_x86_64=(${_base}-$pkgver-Linux-x86_64.sh::${_source}/${_base}-$pkgver-Linux-64bit.sh)
sha512sums=('cf7172b155885db8007298643499a57421e4890b72da86f8124bc35ec30c39f17c4167cd5d4603fc37c0cf72c6e4283c009339363da1cc5f44708c08d16a2b4e')
sha512sums_i686=('5b7ee758f95e6d32f49e887596e0eb0b0f22f00789797b7df7faf48c54f907dba9ec4b7d5b56f4c02e3c78292f4b6444e4234dc8d7371045e2cd13139ffaa7b7')
sha512sums_x86_64=('4827a0ccbdb5dca2520eb1aaf58d405daff22d1a68f279867850aa54349fe0fc2807494916c4c77fd57390d127f2e84a6a4964069ef00661e20f8f857ea61c18')

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
