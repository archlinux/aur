# Contributor: Philipp Helo Rehs <P dot Rehs at gmx dot net>
# This uses modified code from package brother-mfc-l3710cw by kurtmc

pkgname=brother-mfc-l3730cdn
_upstreamver=1.0.2
_upstreamrelease=0
pkgver="${_upstreamver}+${_upstreamrelease}"
pkgrel=1
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3730CDN'
arch=(
  'i686'
  'x86_64'
)
url='https://www.brother.de/support/mfc-l3730cdn'
license=(
  'LicenseRef-proprietary:brother'
  'GPL-2.0-or-later'
)
depends=(
  'bash'
  'cups'
  'lib32-glibc'
  'perl'
)
makedepends=(
  'libarchive' # for bsdtar
  'perl'       # To patch files for Arch Linux usage
)
install='brother-mfc-l3730cdn.install'
source=("https://download.brother.com/welcome/dlf103931/mfcl3730cdnpdrv-${_upstreamver}-${_upstreamrelease}.i386.deb")
sha256sums=('55b6b737e32f5fee67cdebeafadce10b83062b885f9b126f4d4a112ea8f377ac')

prepare() {
  cd "${srcdir}"
  mkdir -p data
  mkdir -p control
  cd "${srcdir}/data"
  bsdtar xvf "${srcdir}/data.tar.gz"
  cd "${srcdir}/control"
  bsdtar xvf "${srcdir}/control.tar.gz"
}

package() {
  cd "${srcdir}"

  # Patch filenames to work on Arch
  cd "${srcdir}/data/opt/brother/Printers/mfcl3730cdn"
  #perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcl3730cdn
  perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij
  cd "${srcdir}"

  install -dvm755 "${pkgdir}/opt/brother/Printers/mfcl3730cdn"
  install -dvm755 "${pkgdir}/usr/bin"

  cp -rv "${srcdir}/data/opt/brother/Printers/mfcl3730cdn"/* "${pkgdir}/opt/brother/Printers/mfcl3730cdn"/
  install -Dvm755 -t "${pkgdir}/usr/bin" "${srcdir}/data/usr/bin/brprintconf_mfcl3730cdn"

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/data/opt/brother/Printers/mfcl3730cdn"/LICENSE_{ENG,JPN}.txt
}
