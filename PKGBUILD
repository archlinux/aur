# Maintainer: Giorgio Gilestro <giorgio at gilest.ro>

pkgname=ethoscope-device
pkgver=r1702.g1c43fc3
pkgrel=3
pkgdesc="A platform from monitoring animal behaviour in real time from a raspberry pi - Device version"
arch=('any')
url="http://lab.gilest.ro/ethoscope"
license=('GPL3')
makedepends=('git' 'gcc-fortran' )
depends=('git' 'avahi' 'rsync' 'wget' 'fping' 'ntp' 'nss-mdns' 'openssh' 'mariadb' 'dnsmasq' 'f2fs-tools' 'i2c-tools' 'wpa_supplicant' 'ifplugd' 'qt5-base' 'python-opencv' 'hdf5' 'gtk3' 'python' 'python-pip' 'python-numpy' 'python-scipy' 'python-bottle' 'python-pyserial' 'python-mysql-connector' 'python-netifaces' 'python-cherrypy' 'python-eventlet' 'python-gitpython' 'python-dnspython' 'python-greenlet' 'python-monotonic' 'python-picamera' 'python-zeroconf')
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
  git checkout dev

  #cp node server and node updater
  cd "${srcdir}"
  cp -R --no-dereference --preserve=mode,links -v * "${pkgdir}/opt/${pkgname}"
  ln -s /opt/ethoscope-device/scripts/ethoscope_updater "${pkgdir}/opt/"

  #changing the remote GIT source to local BARE created during installation
  cd "${pkgdir}/opt/${pkgname}"
  git remote set-url origin git://node/ethoscope.git

  #install service files
  cd "${srcdir}"/"${pkgname}"/scripts/
  install -D --mode=0755 ethoscope_device.service ethoscope_listener.service ethoscope_GPIO_listener.service "${pkgdir}/usr/lib/systemd/system/"

  tee -a /usr/bin/ethoclient <<EOF
#!/bin/env bash
python /opt/ethoscope-device/src/scripts/ethoclient.py $@
EOF
  chmod +x /usr/bin/ethoclient

  tee -a /etc/issue <<EOF
Ethoscope Linux \r  (\n) (\l)
Ethernet IP: \4{eth0}
WIFI IP: \4{wlan0}
EOF

  cd "${srcdir}"/"${pkgname}"/scripts/ethoscope_updater/
  install -D --mode=0755 ethoscope_update.service "${pkgdir}/usr/lib/systemd/system/"

}


