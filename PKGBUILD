# $Id$
# Maintainer: Alexander Konarev (avkonarev) <AVKonarev@gmail.com>

pkgname=aksusbd-bin
pkgver=8.31
pkgrel=1
pkgdesc="Sentinel AKSUSB daemon supporting Sentinel HASP, HASP HL, HASP4 and Hardlock keys."
arch=('i686' 'x86_64')
url="https://supportportal.thalesgroup.com"
license=('custom')

_pkgname=aksusbd
_ldk_filename="Sentinel_LDK_Linux_Run-time_Installer_script"

source=(
        "0001-patch.patch"
        "download.py")
sha256sums=('6fcb6c4fcba1d01c1b3e68258e95297c323b2cbe8ee75c0a14ac0e9006926312'
            'a3f8107436cb6242b040d2c761653685770bbbdb21e99f76daeb3629e2b95757')
makedepends=('libarchive'
            'python'
            'python-pip'
            'firefox'
            'geckodriver')

conflicts=('ehaspd' 'aksusbd')
options=('!strip')


prepare(){
  cd $srcdir
  python -m venv venv
  pip install selenium
  python download.py
  
  tar -xvzf ${_ldk_filename}.tar.gz
  tar -xvzf ${_ldk_filename}/aksusbd-${pkgver}.${pkgrel}.tar.gz

  # Extract RPM into $srcdir:
  bsdtar -xvf ${_pkgname}-${pkgver}.${pkgrel}/pkg/${_pkgname}-${pkgver}-${pkgrel}.${CARCH}.rpm

  patch -p1 < 0001-patch.patch
}

package() {
  cd $srcdir
  if [ "${CARCH}" == "x86_64" ]; then
    arch_suffix=_${CARCH}
  fi
  
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
  install -dm755 ${pkgdir}/usr/share/${_pkgname}/Readme
  cp -R ${_ldk_filename}/Readme_HTML5/* ${pkgdir}/usr/share/${_pkgname}/Readme/
  chmod -R 644 ${pkgdir}/usr/share/${_pkgname}/Readme/*

}
