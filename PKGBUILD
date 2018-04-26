# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=thorspec
pkgver=2.8.0
pkgrel=2
pkgdesc="Driver for Thorlabs spectrometers"
arch=('any')
url="https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_id=3482&pn=CCS175/M"
license=('custom')
depends=('gnuplot')
makedepends=('innoextract' 'python2')
_dlver=${pkgver//./}
_dlver=V${_dlver::1}_${_dlver: -2}
_cver=0.1
source=(setupblob_${pkgver}.exe::"https://www.thorlabs.com/software/THO/OSA/${_dlver}/ThorlabsOSASW_Full_setup.exe" "cyusb-fw-extract-py2.py" "80-spectrometer.rules" "https://github.com/greyltc/thorspec/archive/${_cver}.tar.gz")
noextract=("setupblob_${pkgver}")
md5sums=('1301c516d4bd64aa348a9936ea8ee4ab'
         '793c35c7b9b08baa950a63564dfb782f'
         '7083e7b40cbd3095640d227190cdd08d'
         '33ced3a70111e0fcffea26b780df2a48')


_firmware_loc="app/CCS/inf/Loader"

prepare() {
  # extract the installer 
  innoextract setupblob_${pkgver}.exe
}

build() {
  # convert the firmwares
  _firmwares="$srcdir/${_firmware_loc}/*.spt"
  for firmware in $_firmwares
  do
    python2 cyusb-fw-extract-py2.py -o${firmware//.spt/} $firmware || true
  done

  cd thorspec-${_cver}/build
  make
}


package() {
  _firmwares="$srcdir/${_firmware_loc}/*_2.ihx"
  for firmware in $_firmwares
  do
    install -D -m644 "${firmware}" "$pkgdir/usr/lib/firmware/$(basename ${firmware})"
  done
  install -D -m644 80-spectrometer.rules "$pkgdir/etc/udev/rules.d/80-spectrometer.rules"

  install -D -m755 thorspec-${_cver}/build/thorspec "$pkgdir/usr/bin/thorspec"
}
