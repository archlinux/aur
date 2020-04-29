# Maintainer: Giorgio Gilestro <giorgio at gilest.ro>

pkgname=ethoscope-device
pkgver=r1702.g1c43fc3
pkgrel=1
pkgdesc="A platform from monitoring animal behaviour in real time from a raspberry pi - Device version"
arch=('any')
url="http://lab.gilest.ro/ethoscope"
license=('GPL3')
makedepends=('git' 'gcc-fortran' )
depends=('git' 'avahi' 'rsync' 'wget' 'fping' 'ntp' 'fake-hwclock-git' 'openssh' 'mariadb' 'dnsmasq' 'f2fs-tools' 'wpa_supplicant' 'ifplugd' 'wpa_actiond' 'qt5-base' 'opencv' 'hdf5' 'gtk3' 'python=3.8.0' 'python-pip' 'python-numpy' 'python-scipy' 'python-bottle' 'python-pyserial' 'python-mysql-connector' 'python-netifaces' 'python-cherrypy' 'python-eventlet' 'python-gitpython' 'python-dnspython' 'python-greenlet' 'python-monotonic' 'python-picamera' 'python-zeroconf')
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
  install -dm0755 $pkgdir/ethoscope_data
  install -dm0755 $pkgdir/usr/lib/systemd/system/
  
  #setting python3 branch
  cd "${srcdir}/${pkgname}"
  git checkout python3.7

  #cp node server and node updater
  cd "${srcdir}"
  cp -R --no-dereference --preserve=mode,links -v * "${pkgdir}/opt/${pkgname}"
  ln -s /opt/ethoscope-device/scripts/ethoscope_updater "${pkgdir}/opt/"
  
  #install python package
  #cd "${srcdir}/${pkgname}/src"
  #PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps -e .
  #install is not upgrade friendly and develop won't accept the option "root"
  #python setup.py install --root="$pkgdir/"

  #install service files
  cd "${srcdir}"/"${pkgname}"/scripts/
  install -D --mode=0755 ethoscope_device.service "${pkgdir}/usr/lib/systemd/system/"
  cd "${srcdir}"/"${pkgname}"/scripts/ethoscope_updater/
  install -D --mode=0755 ethoscope_update.service "${pkgdir}/usr/lib/systemd/system/"

}


