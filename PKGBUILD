# Maintainer: James Cherti (Github: https://github.com/jamescherti/archlinux-brother-ql1110nwb )

pkgname='brother-ql1110nwb'
pkgver=2.1.4
pkgrel=1
pkgdesc='LPR and CUPS printer driver for the Brother QL-1110NWB'
url='http://solutions.brother.com/linux/en_us/'
arch=('i686' 'x86_64')
license=('2003-2017 Brother Industries, Ltd. All Rights Reserved')
depends='cups'
if [ "$CARCH" = 'x86_64' ]; then
  depends+=('lib32-glibc')
fi
install="$pkgname.install"
source=("https://download.brother.com/welcome/dlfp100575/ql1110nwbpdrv-${pkgver}-0.i386.deb")
sha256sums=('93670aa9b11a8a4090777ca61648d32d6bd6c087d2a1998a4b5ac93b0b6b4a0a')

package() {
  tar -xf "data.tar.gz" -C "${pkgdir}"

  install -d "${pkgdir}/usr/share/cups/model"
  install -d "${pkgdir}/usr/lib/cups/filter"

  _cupswrapper_script="${pkgdir}/opt/brother/PTouch/ql1110nwb/cupswrapper/cupswrapperql1110nwb"
  sed -i '/lpadmin/d' "${_cupswrapper_script}"
  sed -i 's|/usr/share/cups/model/Brother|/usr/share/cups/model|g' "${_cupswrapper_script}"
  sed -i 's|/usr|$pkgdir/usr|g' "${_cupswrapper_script}"
  sed -i 's|/opt|$pkgdir/opt|g' "${_cupswrapper_script}"
  sed -i 's|lpinfo -v|echo|g' "${_cupswrapper_script}"
  sed -i '/^sleep/d' "${_cupswrapper_script}"
  sed -i 's|brotherlpdwrapper=$pkgdir|brotherlpdwrapper=|g' "${_cupswrapper_script}"
  export pkgdir; "${_cupswrapper_script}"
  rm -f "${_cupswrapper_script}"
}
