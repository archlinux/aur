# Maintainer: Charles Wise <charles [at] charlesbwise [dot] com>
# Contributor: Jeremy Sands <cto [at] jeremysands [dot] com>
# Contributor: Ryan Owens <ryanowens [at] linux [dot] com>
 
pkgname=canon-pixma-mx870-complete
pkgver=3.30
pkgrel=6
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX870"
url="https://www.usa.canon.com/internet/portal/us/home/support/details/printers/support-inkjet-printer/mx-series/pixma-mx870"
arch=('i686' 'x86_64')
license=('custom')
depends_i686=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2')
depends_x86_64=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=('http://gdlp01.c-wss.com/gds/3/0100002723/01/cnijfilter-mx870series-3.30-1-i386-deb.tar.gz'
        'http://gdlp01.c-wss.com/gds/0/0100002730/01/scangearmp-mx870series-1.50-1-i386-deb.tar.gz'
        "${pkgname}-scangearmp.desktop"
        "${pkgname}-scangearmp-icon.png")
sha256sums=('df3694f4cf60a63010a8a4fbefcb38195c895786a8edf3fc2dc452bea7b60a95'
            'ec70d28e830e927d7b05649e4102963dee08e579373cfab9e305f11399afa245'
            'b94e03193c2f78d26156f5e4c9bc7fb4451b708aded9ab46f9fc8faa3a40e406'
            '29dbc682d3f22d79f580bda54801d1f4ef261d857c756eaf4db29e1313406bcc')

_canondir='cnijfilter-mx870series-3.30-1-i386-deb'
_scangearmpdir='scangearmp-mx870series-1.50-1-i386-deb'

package() { 
  # Get the .deb files
  cd ${srcdir}/${_canondir}/packages
  find ./ -type f -iname '*.deb*' -exec install -m644 "{}" "${pkgdir}/{}" \;
  cd ${srcdir}/${_scangearmpdir}/packages
  find ./ -type f -iname '*.deb*' -exec install -m644 "{}" "${pkgdir}/{}" \;

  # Extract data from .deb archives
  cd ${pkgdir}
  for debfile in $(find ./ -type f -iname '*.deb*'); do
	ar x $debfile data.tar.gz
	tar -xvzf data.tar.gz
	rm $debfile
	rm data.tar.gz
  done

  # Fix udev rules
  sed -i -e s/SYSFS/ATTR/g ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules 
  sed -i -e s/'MODE="666"'/'TAG+="uaccess", TAG+="udev-acl"'/g ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules

  # Licenses
  cd ${pkgdir}/usr/share/doc
  find ./ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/licenses/$pkgname/{}" \;

  # Clean up
  chmod 644 ${pkgdir}/usr/lib/bjlib/canon_mfp_net.ini
  chown root. ${pkgdir}/usr/lib/bjlib/cnnet.ini

  # Install .desktop file and icon for scanner
  install -Dm644 "${srcdir}/${pkgname}-scangearmp.desktop" "${pkgdir}/usr/share/applications/${pkgname}-scangearmp.desktop"
  install -Dm644 "${srcdir}/${pkgname}-scangearmp-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-scangearmp-icon.png"
}
