# $Id$
# Maintainer: Alexander Konarev (avkonarev) <AVKonarev@gmail.com>

pkgname=aksusbd-bin
pkgver=9.13
pkgrel=1
pkgdesc="Sentinel AKSUSB daemon supporting Sentinel HASP, HASP HL, HASP4 and Hardlock keys."
arch=('i686' 'x86_64')
url="https://supportportal.thalesgroup.com"
license=('custom')
arch=('x86_64')
source=(
        "0001-patch.patch"
        "download.py")
sha256sums=('6fcb6c4fcba1d01c1b3e68258e95297c323b2cbe8ee75c0a14ac0e9006926312'
            'b3984568b7b9a30601882cc8994c978fa408f380d29f00b802e6344610b4ea4e')
makedepends=('libarchive'
            'python'
            'python-pip'
            'firefox'
            'geckodriver'
            'tar'
            'patch')

conflicts=('ehaspd' 'aksusbd')
options=('!strip')
install=package.install

pkgver() {
  cd $srcdir  
  cat version.txt| cut -d' ' -f 1
}

prepare(){
  cd $srcdir 
  python -m venv venv
  source venv/bin/activate
  pip install selenium
  python download.py
  _nver=$(cat version.txt| cut -d' ' -f 1)
  _nrel=$(cat version.txt| cut -d' ' -f 2)
  
  tar -xvzf aksusbd-${_nver}.${_nrel}.tar.gz
  bsdtar -xvf aksusbd-${_nver}.${_nrel}/pkg/aksusbd-${_nver}-${_nrel}.${CARCH}.rpm
  patch -p1 < 0001-patch.patch
}

package() {
  cd $srcdir
  arch_suffix=_${CARCH}
  
  # Binaries:
  install -dm755 ${pkgdir}/usr/bin
  install -Dm755 usr/sbin/{aksusbd,hasplmd}${arch_suffix} ${pkgdir}/usr/bin/

  # udev rules:
  install -dm755 ${pkgdir}/usr/lib/udev/rules.d
  install -m644 etc/udev/rules.d/* ${pkgdir}/usr/lib/udev/rules.d/

  # systemd service
  install -dm755 ${pkgdir}/usr/lib/systemd/system/
  install -m644 var/hasplm/init/aksusbd${arch_suffix}.service ${pkgdir}/usr/lib/systemd/system/aksusbd.service
  install -m644 var/hasplm/init/hasplmd${arch_suffix}.service ${pkgdir}/usr/lib/systemd/system/hasplmd.service

  # Readme.html:
  install -dm755 ${pkgdir}/usr/share/aksusbd/Readme
  cp -R Readme_HTML5/* ${pkgdir}/usr/share/aksusbd/Readme/
  chmod -R 644 ${pkgdir}/usr/share/aksusbd/Readme/*

}
