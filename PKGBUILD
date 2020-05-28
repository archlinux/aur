# Maintainer: Charles Wise <charles [at] charlesbwise [dot] com>
# Contributor: Jeremy Sands <cto [at] jeremysands [dot] com>
# Contributor: Ryan Owens <ryanowens [at] linux [dot] com>
 
pkgname=canon-pixma-mx870-complete
pkgver=3.30
pkgrel=8
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX870"
url="https://www.usa.canon.com/internet/portal/us/home/support/details/printers/support-inkjet-printer/mx-series/pixma-mx870"
arch=('i686' 'x86_64')
license=('custom')
depends_i686=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2')
depends_x86_64=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2')
optdepends_i686=('gtk-engines: nicer ScanGear MP UI'
		 'libcanberra: nicer ScanGear MP UI'
		 'at-spi2-atk: nicer ScanGear MP UI')
optdepends_x86_64=('lib32-gtk-engines: nicer ScanGear MP UI'
		   'lib32-libcanberra: nicer ScanGear MP UI'
		   'lib32-at-spi2-atk: nicer ScanGear MP UI')
options=('!strip' '!emptydirs')
install="${pkgname}".install
source=("https://gdlp01.c-wss.com/gds/3/0100002723/01/cnijfilter-mx870series-${pkgver}-1-i386-deb.tar.gz"
        "https://gdlp01.c-wss.com/gds/0/0100002730/01/scangearmp-mx870series-1.50-1-i386-deb.tar.gz"
        "${pkgname}-scangearmp.desktop"
        "${pkgname}-scangearmp-icon.png")
sha256sums=('df3694f4cf60a63010a8a4fbefcb38195c895786a8edf3fc2dc452bea7b60a95'
            'ec70d28e830e927d7b05649e4102963dee08e579373cfab9e305f11399afa245'
            'b94e03193c2f78d26156f5e4c9bc7fb4451b708aded9ab46f9fc8faa3a40e406'
            '29dbc682d3f22d79f580bda54801d1f4ef261d857c756eaf4db29e1313406bcc')

package() { 
  # Extract and unpack data.tar.gz from the .deb files
  cd "${srcdir}"
  for _deb in $(find ./ -type f -name '*.deb'); do
  	bsdtar -O -xf "${_deb}" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
  done

  # Fix udev rules
  sed -i -e s/SYSFS/ATTR/g "${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules" 
  sed -i -e s/'MODE="666"'/'TAG+="uaccess", TAG+="udev-acl"'/g "${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules"

  # Clean up
  chmod 0644 "${pkgdir}/usr/lib/bjlib/canon_mfp_net.ini"
  chown root. "${pkgdir}/usr/lib/bjlib/cnnet.ini"

  # Install licenses
  cd "${pkgdir}/usr/share/doc"
  find ./ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/licenses/${pkgname}/""{}" \;

  # Install .desktop file and scanner icon
  cd "${srcdir}"
  install -Dm0644 "${pkgname}-scangearmp.desktop" "${pkgdir}/usr/share/applications/${pkgname}-scangearmp.desktop"
  install -Dm0644 "${pkgname}-scangearmp-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-scangearmp-icon.png"
}
