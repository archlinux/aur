# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=open-sankore
pkgver=2.5.1
pkgrel=1
pkgdesc="An interactive white board that uses a free standard format"
arch=('i686' 'x86_64')
url="http://open-sankore.org/en/"
license=(GPL3)
depends=('python2' 'libpaper' 'phonon' 'gstreamer0.10-base' 'qtwebkit' 'libdbusmenu-qt')

if [ "$CARCH" = "x86_64" ]
then
  source=("http://www.cndp.fr/${pkgname}/OpenSankore/Releases/v${pkgver}/Open-Sankore_Ubuntu_12.04_${pkgver}_amd64.zip")
  sha256sums=('0cdb5114ca7da1973d2bfc0b53f71009f0a49409f60dbfd9085e177868bbebbf')
  _debarchive="Open-Sankore_${pkgver}_amd64.deb"
else
  source=("http://www.cndp.fr/${pkgname}/OpenSankore/Releases/v${pkgver}/Open-Sankore_Ubuntu_12.04_${pkgver}_i386.zip")
  sha256sums=('ab061305e1de21ebf8af02a3cb26bc0327f7fcd06fa42977013e98e286dbc213')
  _debarchive="Open-Sankore_${pkgver}_i386.deb"
fi

build() {
  ar -x ${_debarchive} data.tar.gz
  tar xzf data.tar.gz
  # Fix paths from usr/local to usr/lib
  sed -i "s#/usr/local/Open-Sankore-${pkgver}#/usr/lib/open-sankore#g" usr/share/applications/Open-Sankore.desktop
  sed -i "s#/usr/local/Open-Sankore-${pkgver}#/usr/lib/open-sankore#g" usr/local/Open-Sankore-${pkgver}/run.sh
}

package() {
  cd "usr/local/Open-Sankore-${pkgver}"
  # Fix invalid permissions
  chmod a+rx library/pictures

  # Install files
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r * "${pkgdir}/usr/lib/${pkgname}"

  # Create a link to the executable
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/${pkgname}/run.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install desktop file
  install -d "${pkgdir}/usr/share/applications"
  install -t "${pkgdir}/usr/share/applications" "${srcdir}/usr/share/applications/Open-Sankore.desktop"

  # Install release notes files
  install -d "${pkgdir}/usr/share/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}" "${srcdir}/JournalDesModifications.pdf"
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}" "${srcdir}/ReleaseNotes.pdf"
}

