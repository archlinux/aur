# Maintainer: invik
# Forked from canon-pixma-mx450-complete, mantained by r3ddr4gOn <r3ddr4gOn@gig-gaming.de>

pkgname=canon-pixma-mx410-complete
pkgver=3.50
pkgrel=2
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX410 series. Includes Greyscale patch."
arch=('i686' 'x86_64')
url='https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mx_series/pixma_mx410.aspx?type=drivers&language=EN'
license=('custom')
depends=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
install=canon_mx410.install
source=('http://gdlp01.c-wss.com/gds/6/0100003296/01/cnijfilter-mx410series-3.50-1-deb.tar.gz'
	    'http://gdlp01.c-wss.com/gds/6/0100003306/01/scangearmp-mx410series-1.70-1-deb.tar.gz')
md5sums=('e31980a7927c81f78af5c63f2e6880e9'
         '40fa7089790aac9379add59e44429dc0')

package(){

  if [ "${CARCH}" = "x86_64" ]; then
    _arch_str='amd64'
  elif [ "${CARCH}" = "i686" ]; then
    _arch_str='i386'
  fi

  echo -e "\nBuilding for ${CARCH} architecture (${_arch_str}).\n"

  cd ${srcdir}/cnijfilter-mx410series-3.50-1-deb/packages/
  install cnijfilter-common_3.50-1_${_arch_str}.deb ${pkgdir}
  install cnijfilter-mx410series_3.50-1_${_arch_str}.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx410series-1.70-1-deb/packages
  install scangearmp-common_1.70-1_${_arch_str}.deb ${pkgdir}
  install scangearmp-mx410series_1.70-1_${_arch_str}.deb ${pkgdir}

  cd ${pkgdir}

  for _deb in cnijfilter-common_3.50-1_${_arch_str}.deb \
    cnijfilter-mx410series_3.50-1_${_arch_str}.deb \
    scangearmp-common_1.70-1_${_arch_str}.deb \
    scangearmp-mx410series_1.70-1_${_arch_str}.deb; do

        bsdtar -xvf ${_deb} data.tar.gz 2> /dev/null
        bsdtar -xvf data.tar.gz 2> /dev/null
        rm -f ${_deb} data.tar.gz

  done

  # Apply patch to enable grayscale option (disabled by default)
  echo -e "\nApplying patch to enable grayscale-printing option...(disabled by default)."
  patch -uN ./usr/share/ppd/canonmx410.ppd ../../grayscale.patch || return 1

  # Fix license paths
  mkdir -p ./usr/share/licenses/${pkgname}
  mv ./usr/share/doc/* ./usr/share/licenses/${pkgname}
  rmdir ./usr/share/doc
}
