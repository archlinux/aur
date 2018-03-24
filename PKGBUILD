# Maintainer: Benjamin Abel <bbig26 at gmail dot com>

# slightly modified version of https://aur.archlinux.org/packages/brother-mfc-j5320dw/

pkgname="brother-mfc-j5335dw"
pkgver="1.0.1.0.4"
# required because of unconventional package numbering for brother
_brother_pkgver="1.0.1-0"
pkgrel=3
pkgdesc="LPR and CUPS driver for the Brother MFC-J5335DW"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadtop.aspx?c=fr&lang=fr&prod=mfcj5335dw_eu"
license=('custom:Brother commercial license')
depends=('cups' 'ghostscript' 'poppler' 'a2ps' 'psutils')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=("http://download.brother.com/welcome/dlf103004/mfcj5335dwlpr-$_brother_pkgver.i386.rpm"
        "http://download.brother.com/welcome/dlf103028/mfcj5335dwcupswrapper-$_brother_pkgver.i386.rpm"
        'cupswrapper-license.txt'
        'lpr-license.txt'
        'brother_lpdwrapper_mfcj5335dw.patch')
md5sums=(bcf37fe0e9624ae9e3ce0554573d113f
         40c5de6899b0c319f6187e23626e7c42
         310f8424517f3df127d39393ceaebb6f
         bf894a1a51baf6055a6c58ecf43c9782
         a6ff0cd2d946f103b044eb6fdb31c669)

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

  # patch an error (?) in the perl script from brother
  patch -p1 "${srcdir}"/opt/brother/Printers/mfcj5335dw/cupswrapper/brother_lpdwrapper_mfcj5335dw < brother_lpdwrapper_mfcj5335dw.patch

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
  sed -i 's|pdf2ps|pdftocairo -q -ps|g' "${srcdir}"/opt/brother/Printers/mfcj5335dw/lpd/filter_mfcj5335dw
}

package() {
  cp -R "${srcdir}"/usr "${pkgdir}"
  cp -R "${srcdir}"/opt "${pkgdir}"

  install -Dm644 cupswrapper-license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/cupswrapper-licence.txt
  install -Dm644 lpr-license.txt         "${pkgdir}"/usr/share/licenses/"${pkgname}"/lpr-licence.txt
}
