# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname="brother-mfc-j5320dw"
pkgver="3.0.1"
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother MFC-J5320DW"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=mfcj5320dw_eu_as"
license=('custom:Brother commercial license')
depends=('cups' 'ghostscript' 'poppler' 'a2ps' 'psutils')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=("http://download.brother.com/welcome/dlf101593/mfcj5320dwlpr-3.0.1-1.i386.rpm"
        "http://download.brother.com/welcome/dlf101594/mfcj5320dwcupswrapper-3.0.1-1.i386.rpm"
        'cupswrapper-license.txt'
        'lpr-license.txt')
md5sums=('d5c16819345214479c903478cdac96a5'
         'cf72635ca318b06c3c580b7c645e5a12'
         '310f8424517f3df127d39393ceaebb6f'
         'bf894a1a51baf6055a6c58ecf43c9782')

prepare() {
  # do not install in /usr/local
  if [ -d "${srcdir}"/usr/local/Brother ]; then
    install -d "${srcdir}"/usr/share
    mv "${srcdir}"/usr/local/Brother/ "${srcdir}"/usr/share/Brother
    rm -rf "${srcdir}"/usr/local
    sed -i 's|/usr/local/Brother|/usr/share/Brother|g' `grep -lr '/usr/local/Brother' ./`
  fi

  # setup cups directories
  install -d "${srcdir}"/usr/share/cups/model
  install -d "${srcdir}"/usr/lib/cups/filter

  # go to the cupswrapper directory and find the source file from which to generate a ppd and wrapperfile
  cd `find . -type d -name 'cupswrapper'`

  if [ -f cupswrapper* ]; then
    _wrapper_source=`ls cupswrapper*`

    sed -i '/^\/etc\/init.d\/cups/d' $_wrapper_source
    sed -i '/^sleep/d' $_wrapper_source
    sed -i '/^lpadmin/d' $_wrapper_source
    sed -i 's|/usr|$srcdir/usr|g' $_wrapper_source
    sed -i 's|/opt|$srcdir/opt|g' $_wrapper_source
    sed -i 's|/model/Brother|/model|g' $_wrapper_source
    sed -i 's|lpinfo|echo|g' $_wrapper_source

    export srcdir="${srcdir}"
    ./$_wrapper_source

    sed -i 's|$srcdir||' "${srcdir}"/usr/lib/cups/filter/*lpdwrapper*
    sed -i "s|$srcdir||" "${srcdir}"/usr/lib/cups/filter/*lpdwrapper*

    rm $_wrapper_source
  fi

  # /etc/printcap is managed by cups
  rm `find "${srcdir}" -type f -name 'setupPrintcap*'`

  # patch filter for PDF printing to avoid error:
  # ERROR: typecheck
  # OFFENDING COMMAND: resourcestatus
  sed -i 's|pdf2ps|pdftocairo -q -ps|g' "${srcdir}"/opt/brother/Printers/mfcj5320dw/lpd/filtermfcj5320dw
}

package() {
  cp -R "${srcdir}"/usr "${pkgdir}"
  cp -R "${srcdir}"/opt "${pkgdir}"

  install -Dm644 cupswrapper-license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/cupswrapper-licence.txt
  install -Dm644 lpr-license.txt         "${pkgdir}"/usr/share/licenses/"${pkgname}"/lpr-licence.txt
}
