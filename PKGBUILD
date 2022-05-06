# $Id$
# Maintainer: Alexander Konarev (avkonarev) <AVKonarev@gmail.com>

pkgname=aksusbd-bin
pkgver=8.41
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
            '955d038821b7deee240f98713b39d6aa8aae12b86b8a4cb8d2005e8e22b9cd79')
makedepends=('libarchive'
            'python'
            'python-pip'
            'firefox'
            'geckodriver'
            'tar')

conflicts=('ehaspd' 'aksusbd')
options=('!strip')
_nver=""
_nrel=""

pkgver() {
  #echo $_nver.$_nrel
  echo $_nver  
}

prepare(){
  cd $srcdir
  python -m venv venv
  source venv/bin/activate
  pip install selenium
  python download.py
  
  _nver=$(cat version.txt| cut -d' ' -f 1)
  _nrel=$(cat version.txt| cut -d' ' -f 2)
  tar -xvzf ${_ldk_filename}/aksusbd-${_nver}.${_nrel}.tar.gz

  bsdtar -xvf ${_pkgname}-${_nver}.${_nrel}/pkg/${_pkgname}-${_nver}-${_nrel}.${CARCH}.rpm

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
