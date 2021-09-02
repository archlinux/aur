# Maintainer: Martin Thierer <thierer@web.de>

pkgname=arrow-usb-blaster
pkgver=2.5.1
pkgrel=1
pkgdesc='Intel Quartus Driver for Arrow USB JTAG Programmer'
url='https://wiki.trenz-electronic.de/display/PD/Arrow+USB+Programmer'
license=('unknown')
arch=('x86_64')
backup=('etc/arrow_usb_blaster.conf')
depends=('quartus-free-quartus')
options=('!strip')
# Even https://github.com/ArrowElectronics/AnalogMAX/wiki/Arrow-USB-Programmer
# in what seems to be an official Arrow repository links to Trenz Electronic
# so that's apparently the standard download location.
_archive="Arrow_USB_Programmer_${pkgver}_linux64"
_majver=`echo ${pkgver} | cut -d '.' -f 1-2`
source=("https://shop.trenz-electronic.de/trenzdownloads/Trenz_Electronic/Software/Drivers/Arrow_USB_Programmer/Arrow_USB_Programmer_${_majver}/${_archive}.zip")
md5sums=('2d93ae613ff4ebb6a2d71fc3dbfad120')

prepare() {
  cd "${srcdir}/${_archive}"

  # extract udev rules from README
  if [[ $(csplit --suppress-matched README '/^===8</' '{1}' | wc -l) != 3 ]]
  then
    echo "Error extracting udev rules from README!"
    return 1
  fi

  # put the TckFrequency option behind a comment to keep the default
  sed -i 's/^\(TckFrequency.*\)/#\1/' arrow_usb_blaster.conf
}

package() {
  cd "${srcdir}/${_archive}"

  # find the directory where Quartus is installed
  _quartus=$(pacman -Qlq quartus-free-quartus | grep "quartus/linux64/$")
  if [[ ${_quartus} && -d ${_quartus} ]]
  then
    echo "Found Quartus install directory ${_quartus}"
  else
    echo "Quartus install directory not found."
    return 1
  fi

  install -D -m755 -t ${pkgdir}/${_quartus} libjtag_hw_arrow.so
  install -D -m644 -t ${pkgdir}/etc arrow_usb_blaster.conf
  install -D -m644 xx01 ${pkgdir}/usr/lib/udev/rules.d/51-arrow-usb-blaster.rules
}
