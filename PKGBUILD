# Maintainer: James Bunton <jamesbunton@delx.net.au>

# The latest version can be found like this:
# $ curl -s https://bluejeans.com/downloads | grep 'desktop/linux'

pkgname=bluejeans
pkgver=1.18.15
pkgrel=1
pkgdesc="BlueJeans app"
arch=('x86_64')
url="https://www.bluejeans.com"
license=('Proprietary')
groups=()
depends=()
makedepends=('rpmextract')
install=bluejeans.install
source=(http://swdl.bluejeans.com/desktop/linux/${pkgver%.*}/${pkgver}/bluejeans-${pkgver}.x86_64.rpm)
sha256sums=('fb87b6e20c0893485dc3bb79cb03161d7e79a087467fd51e86dfbd3250ad71ef')

package() {
  # extract rpm
  rpmextract.sh "bluejeans-${pkgver}.x86_64.rpm"

  # add bluejeans wrapper to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x "opt/bluejeans/bluejeans"
  ln -nsf "/opt/bluejeans/bluejeans" "${pkgdir}/usr/bin/bluejeans"

  # install desktop file and icons
  mkdir -p "${pkgdir}/usr/share/applications/"
  mv "opt/bluejeans/bluejeans.desktop" "${pkgdir}/usr/share/applications/"
  mv "opt/bluejeans/icons" "${pkgdir}/usr/share/"

  # hack for libudev.so.0
  ln -nsf "/usr/lib/libudev.so.1" "opt/bluejeans/libudev.so.0"

  # put the rest in /opt
  mv "opt" "${pkgdir}"
}
