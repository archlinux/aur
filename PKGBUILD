#Maintainer: AwesomeHaircut <jesusbalbastro@gmail.com>
#Previous Maintainer: ente <mail@ck76.de>
#Previous Maintainer: Christoph Seitz <seitz.christop@gmail.com>
#Previous Maintainer: Gianluca Boiano (aka M0Rf30)

pkgname=me-tv-bzr
pkgver=1.4.0
pkgrel=60
pkgdesc="A digital television (DVB) viewer for GNOME."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/me-tv"
license=('GPL')
depends=('gtkmm' 'gconfmm' 'libxml++' 'libunique' 'vlc' 'gstreamer0.10-base' 'libxml++2.6')
optdepends=('linuxtv-dvb-apps: dvb tools'
'w_scan: generation of channels.conf')
makedepends=('intltool' 'gnome-common' 'bzr')
provides=('me-tv-bzr')
conflicts=('me-tv')
install='me-tv.install'
options=('!emptydirs')

build() {
  msg "Connecting to the server..."
  bzr co lp:me-tv
  
  msg "Applying PACKAGE_DATA_DIR fix..."
  cd "${srcdir}/me-tv/client"
  sed -i -- 's/PACKAGE_DATA_DIR"/"\/usr\/share/g' me-tv-client.cc
  
  cd "${srcdir}/me-tv/server"
  sed -i 's/abs(transponder.frontend_parameters.frequency/abs((int)transponder.frontend_parameters.frequency/g' dvb_frontend.cc
  
  msg "Starting make..."

  cd ..
  NOCONFIGURE=1 ./autogen.sh 
  ./configure CXXFLAGS="$CXXFLAGS -D__KERNEL_STRICT_NAMES" --prefix=/usr
  make
}
 
package() {
  msg "building package..."     
  cd "${srcdir}/me-tv"

  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" \
  --domain gtv "${pkgdir}/usr/etc/gconf/schemas/${pkgname}.schemas"
 
}

