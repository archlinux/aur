# Contributor: Stephen Checkley <scheckley at gmail dot com>
# Contributor: jrohwer
_base=COPASI
pkgname=${_base,,}-bin
pkgver=4.45.298
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
sha512sums_i686=('ffb960424c075fc9537c14a259ea84407072e8e0136cb2e5a4ec9faf1f649935c323d662d2c43c7b935fdf1330dba74fd5128eb8de227815c4bd74133827c327')
sha512sums_x86_64=('71dc8dc98ff9a8f7c8f99a004c4a2609be47336099651f174d36cf6ef957251acc4741b2306ef0ac89fbe61f56ab48b6a9cb2e19e8d391b9e8654ab760cc2f27')

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
