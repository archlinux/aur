# Creator and maintainer: Giorgio Gilestro <giorgio at gilest.ro>

pkgname=ethoscope-device
pkgver=r2231.gbf320832
pkgrel=1
pkgdesc="A platform for monitoring animal behaviour in real time from a raspberry pi - Device version"
arch=('any')
url="http://lab.gilest.ro/ethoscope"
license=('GPL3')
makedepends=('git' 'gcc-fortran' 'python' 'python-setuptools')
depends=('avahi' 'rsync' 'wget' 'fping' 'ntp' 'nss-mdns' 'openssh' 'mariadb' 'dnsmasq' 'f2fs-tools' 'i2c-tools' 'wpa_supplicant' 'ifplugd' 'qt5-base' 'python-opencv' 'hdf5' 'gtk3' 'python-pip' 'python-numpy' 'python-scipy' 'python-bottle' 'python-pyserial' 'python-mysql-connector' 'python-netifaces' 'python-cherrypy' 'python-eventlet' 'python-gitpython' 'python-dnspython' 'python-greenlet' 'python-monotonic' 'python-zeroconf' 'python-pyusb')
optdepends=('python-picamera: picamera support on raspberry pis')
provides=('ethoscope-device')
install="ethoscope-device.install"
source=("$pkgname::git+https://github.com/gilestrolab/ethoscope.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  #creating packaging directories
  install -dm0755 $pkgdir/opt
  install -dm0755 $pkgdir/etc
  install -dm0755 $pkgdir/ethoscope_data
  install -dm0755 $pkgdir/usr/lib/systemd/system/
  install -dm0755 $pkgdir/usr/bin

  #setting python3 branch
  cd "${srcdir}/${pkgname}"
  git checkout dev

  #copy ethoscope source to /opt/ethoscope
  cd "${srcdir}"
  cp -R --no-dereference --preserve=mode,links -v "${pkgname}" "${pkgdir}/opt/ethoscope"
  
  #changing the remote GIT source to local BARE created during installation
  cd "${pkgdir}/opt/ethoscope"
  git remote set-url origin git://node/ethoscope.git

  #install service files as symbolic links
  cd "${pkgdir}/usr/lib/systemd/system/"
  ln -s /opt/ethoscope/scripts/ethoscope_device.service ethoscope_device.service
  ln -s /opt/ethoscope/scripts/ethoscope_listener.service ethoscope_listener.service
  ln -s /opt/ethoscope/scripts/ethoscope_GPIO_listener.service ethoscope_GPIO_listener.service
  ln -s /opt/ethoscope/scripts/ethoscope_updater/ethoscope_update.service ethoscope_update.service
}


