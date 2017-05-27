# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=open-sankore
pkgver=2.5.1
pkgrel=2
pkgdesc="An interactive white board that uses a free standard format"
arch=('i686' 'x86_64')
url="http://open-sankore.org/en/"
license=('GPL3')
depends=('python2' 'libpaper' 'phonon-qt4' 'gstreamer0.10-base' 'qtwebkit' 'libdbusmenu-qt' 'openssl-1.0')
source_i686=("http://www.cndp.fr/${pkgname}/OpenSankore/Releases/v${pkgver}/Open-Sankore_Ubuntu_12.04_${pkgver}_i386.zip")
source_x86_64=("http://www.cndp.fr/${pkgname}/OpenSankore/Releases/v${pkgver}/Open-Sankore_Ubuntu_12.04_${pkgver}_amd64.zip")
md5sums_i686=('3e71f9b72d6a96c2bce4bb59be039ee1')
md5sums_x86_64=('c63ef06ae00d99260084eaed51db94fe')

build() {
  # Extract open sankore
  if [ "$CARCH" = "x86_64" ]
  then
    ar -x "Open-Sankore_${pkgver}_amd64.deb" data.tar.gz
  else
    ar -x "Open-Sankore_${pkgver}_i386.deb" data.tar.gz
  fi
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

