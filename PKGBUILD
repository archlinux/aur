# Contributor: Michael Schubert <mschu.dev at google mail>
pkgname=copasi
pkgver=4.30.240
pkgrel=1
pkgdesc="COmplex PAthway SImulator for analysis of biochemical networks and their dynamics"
arch=('i686' 'x86_64')
url="http://${pkgname}.org"
license=('custom:Artistic 2.0')
depends=('shared-mime-info' 'qwt' 'glu')
# cppunit expat libsbml libnuml libsedml raptor libzipper-git
source=(${pkgname}-desktop.tar.gz)
install=${pkgname}.install
noextract=(${pkgname}-${pkgver}.tar.gz)
_source=https://github.com/${pkgname}/COPASI/releases/download/Build-${pkgver:5}
source_i686=(${pkgname}-${pkgver}.tar.gz::${_source}/COPASI-${pkgver}-Linux-32bit.tar.gz)
source_x86_64=(${pkgname}-${pkgver}.tar.gz::${_source}/COPASI-${pkgver}-Linux-64bit.tar.gz)
sha512sums=('cf7172b155885db8007298643499a57421e4890b72da86f8124bc35ec30c39f17c4167cd5d4603fc37c0cf72c6e4283c009339363da1cc5f44708c08d16a2b4e')
sha512sums_i686=('31cd4b137c6dd42d2ef0db7902250973ee1ff1354f1acdd253b7553b1724b4eb0384fd1309f83bf793753918c3fee66064a023e2d2221ea5db205c6896211a23')
sha512sums_x86_64=('d784a707691f1f21c64143574107d740657f089b0304ddc01e49cf253b61cb24b1c3dbb652f07dc16534b778607db5a717fd4715e881fb87fcea02bac2e56595')

# https://src.fedoraproject.org/rpms/COPASI/blob/rawhide/f/COPASI.spec#_47

package() {
  cd "${srcdir}"
  tar -xf ${pkgname}-${pkgver}.tar.gz --strip=1

  # install program files
  install -d "${pkgdir}"/usr/{bin,share}
  install -m755 bin/* "${pkgdir}"/usr/bin
  cp -R share/${pkgname} "${pkgdir}"/usr/share/

  # desktop integration...
  cd "${srcdir}"/${pkgname}-desktop
  install -Dm755 ${pkgname}.sh "${pkgdir}/etc/profile.d/copasi.sh"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/copasi.desktop"
  install -Dm644 ${pkgname}.xml "${pkgdir}/usr/share/mime/packages/copasi.xml"
  install -d "${pkgdir}/usr/share/icons/hicolor"
  cp -R icons/* "${pkgdir}/usr/share/icons/hicolor/"
  # copasi starts CopasiUI after setting COPASIDIR environment variable
  # useful for launching COPASI using the menu entry
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/copasi"
}
