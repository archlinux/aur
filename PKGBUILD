# Maintainer: Juan Diego Tascon
# Maintainer: Swift Geek
pkgname=bluez-git
pkgver=20130324
pkgrel=1
pkgdesc="Libraries and tools for the Bluetooth protocol stack"

url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dbus-core')
makedepends=('gstreamer0.10-base' 'libusb-compat' 'libnl' 'libsndfile')
optdepends=("gstreamer0.10-base: bluetooth GStreamer support"
	"alsa-lib: Audio bluetooth devices support"
	"dbus-python: to run bluez-simple-agent"
	"pygobject: to run bluez-simple-agent"
	"libusb-compat: USB adapters support"
	"cups: CUPS backend"
	"libnl: netlink plugin")

conflicts=('bluez' 'bluez-libs' 'bluez-utils')
provides=('bluez=4.97' 'bluez-libs' 'bluez-utils')
replaces=('bluez' 'bluez-libs' 'bluez-utils')

options=('!libtool' 'emptydirs')
backup=(etc/bluetooth/{proximity,input,network,audio,main,bluetooth}.conf
        'etc/conf.d/bluetooth' 'etc/dbus-1/system.d/bluetooth.conf')
source=('bluetooth.conf.d'
        'rc.bluetooth')
md5sums=('7412982b440f29fa7f76a41a87fef985'
         '8f9498707f809506928b2e480d3b6789')

_gitroot="git://git.kernel.org/pub/scm/bluetooth/bluez.git"
_gitname="bluez"

if type awk 2>/dev/null >&2;
then
	make_parallel_instances=$((`awk '/^processor/ { N++} END { print N }' /proc/cpuinfo`*4))
else
	make_parallel_instances=4
fi

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."


  cd ${srcdir}/${_gitname}
  
  ./bootstrap || return 1 
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/lib \
    --enable-gstreamer \
    --enable-alsa \
    --enable-usb \
    --enable-tools \
    --enable-bccmd \
    --enable-dfutool \
    --enable-hid2hci \
    --enable-hidd \
    --enable-pand \
    --enable-dund \
    --enable-cups \
    --enable-library \
    --enable-wiimote
  make -j"${make_parallel_instances}"
}
  
package() {
  cd "${srcdir}/${_gitname}"
  make -j"${make_parallel_instances}" DESTDIR="${pkgdir}" install || return 1

  install -vDm755 "${srcdir}/rc.bluetooth" "${pkgdir}/etc/rc.d/bluetooth"
  
  install -vd "${pkgdir}/etc/bluetooth"
  install -vm644 profiles/*/*.conf "${pkgdir}/etc/bluetooth/"
  install -vm644 src/*.conf        "${pkgdir}/etc/bluetooth/"
  
  install -vDm644 "${srcdir}/bluetooth.conf.d" "${pkgdir}/etc/conf.d/bluetooth"

#  # FS#27630
#  cd test
#    # Python bindings
#    install -vd "${pkgdir}/usr/lib/python2.7/site-packages"
#    install -vDm755 *.py         "${pkgdir}/usr/lib/python2.7/site-packages"
#    
#    # Python untilities
#    install -vDm755 simple-agent "${pkgdir}/usr/bin/bluez-simple-agent"
#    for filename in test-*;
#    do
#      install -vDm755 "${filename}" "${pkgdir}/usr/bin/bluez-${filename}"
#    done
#  cd ..
#  sed -i 's#/usr/bin/python#/usr/bin/python2#' "${pkgdir}/usr/bin/bluez"-*
}
