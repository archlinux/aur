# Maintainer: swyter <swyterzone+aur@gmail.com>

# Based on      canon-pixma-mp237-complete by cidtux <cidtux@gmail.com>, which was
# modified from canon-pixma-mx520-complete by Jeremy Sands <cto@jeremysands.com>

# Only tested with x86_64 architecture


# the combination of sane and simple-scan is better than the built-in scan utility, disabled by default (scangearmp)
# switch to 1 to include it in the package
enable_scangear=0

pkgname=canon-pixma-mp240-complete
pkgver=3.0
pkgrel=3
pkgdesc="Complete standalone driver set (printing and scanning) for Canon Pixma MP240 series"
url='https://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MP_series/PIXMA_MP240.aspx'
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-gtk2')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
fi

if [ ${enable_scangear} = 1 ]; then

makedepends=('sed' 'libarchive')

  if [ "${CARCH}" = 'x86_64' ]; then
    depends+=('lib32-gimp')
  elif [ "${CARCH}" = 'i686' ]; then
    depends+=('gimp')
  fi
fi



source=('https://web.archive.org/web/20191204161011if_/https://files.canon-europe.com/files/soft31325/Software/MP240_debian_drivers.tar'
        'canon-pixma-mp240-complete.license'
        'canon-pixma-mp240-complete-scangear.desktop'
        'canon-pixma-mp240-complete-scangear-icon.svg')

md5sums=('22ab0e74e6917009d2eecf8c229091d7'
         'da88f987611a24e5a7cc55f9aa551a7a'
         'dceb78d5f33dd207bdce53ae8c90e38d'
         'dff9e4454eaa608292732582cb25842f')


extract_deb()
{
  bsdtar -xf $1 --include data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz
}

build()
{
  cd ${srcdir}

  # 1- unpack driver source files

  mkdir printer scangear

  tar -xf MP240_debian_printer.tar  -C printer  --wildcards '*.deb'
  if [ ${enable_scangear} = 1 ]; then
    tar -xf MP240_debian_scangear.tar -C scangear --wildcards '*.deb'
  fi

  # 2- extract the printer-related stuff from the debian package

  cd printer

  extract_deb cnijfilter-common_3.00-1_i386.deb
  extract_deb cnijfilter-mp240series_3.00-1_i386.deb 

  rm *.deb

  cd ..

  # 3- extract the scanner-related stuff from the debian package
  
  if [ ${enable_scangear} = 1 ]; then
    cd scangear

    extract_deb scangearmp-common_1.20-1_i386.deb
    extract_deb scangearmp-mp240series_1.20-1_i386.deb

    rm *.deb

    cd ..
  fi


  # 4- remove the intermediate packages
  rm -v *.tar
}

package()
{
   cd ${pkgdir}

   # 1- copy recursively both package roots into the pkg dir, merging them nicely

   cp -r ${srcdir}/printer/* .

   if [ ${enable_scangear} = 1 ]; then
     cp -r ${srcdir}/scangear/* .
   fi

   rm -rf ${srcdir}/printer
   rm -rf ${srcdir}/scangear

   # 2- move ppd file to where cups expects it to be

   install -vDm 644 "${pkgdir}/usr/share/ppd/canonmp240.ppd" "${pkgdir}/usr/share/cups/model/canonmp240.ppd"

   rm -vrf ${pkgdir}/usr/share/ppd

   # 3- symbolic links for all the versioned libs, `printuimp240` needs `libcnbpcnclui341.so` and `libcnbpcmcm341.so` to work

   #mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32
   ln -s /usr/lib/libcnbpcmcm341.so.7.03.1      ${pkgdir}/usr/lib/libcnbpcmcm341.so
   ln -s /usr/lib/libcnbpcnclapi341.so.3.3.2    ${pkgdir}/usr/lib/libcnbpcnclapi341.so
   ln -s /usr/lib/libcnbpcnclbjcmd341.so.3.3.0  ${pkgdir}/usr/lib/libcnbpcnclbjcmd341.so
   ln -s /usr/lib/libcnbpcnclui341.so.3.4.0     ${pkgdir}/usr/lib/libcnbpcnclui341.so
   ln -s /usr/lib/libcnbpess341.so.3.1.1        ${pkgdir}/usr/lib/libcnbpess341.so
   ln -s /usr/lib/libcnbpo341.so.1.0.3          ${pkgdir}/usr/lib/libcnbpo341.so

   # 4- fix udev rules for the scanner, they're optional, just needed for scangear

   if [ ${enable_scangear} = 1 ]; then
     sed -i -e "s/SYSFS/ATTR/g" "${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules"
   fi

   # 5- install custom license file

   install -vDm 644 "${srcdir}/${pkgname}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

   # 6- install entry in application menu, including icon
   if [ ${enable_scangear} = 1 ]; then
     install -vDm 644 "${srcdir}/${pkgname}-scangear.desktop"  "${pkgdir}/usr/share/applications/${pkgname}-scangear.desktop"
     install -vDm 644 "${srcdir}/${pkgname}-scangear-icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}-scangear-icon.svg"
   fi

   # 7- append this to the ppd to add a grayscale-only option to the printer settings

  cat <<'EOF' >> "${pkgdir}/usr/share/cups/model/canonmp240.ppd"

*OpenUI *CNGrayscale/Grayscale: Boolean
*DefaultCNGrayscale: True
*CNGrayscale True/Yes: True
*CNGrayscale False/No: False
*CloseUI: *CNGrayscale
EOF
}


