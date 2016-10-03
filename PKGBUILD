# Copied from brother-mfc-9970cdw, libernux <dutchman55 [at] gmx [dot] com>
# Maintainer: shieldwed <shieldwed [at] outlook [dot] com>
pkgname="brother-mfc-6890cdw"
pkgver="1.1.2"
pkgrel=1
_pkgrel=4
pkgdesc="LPR and CUPS driver for the Brother MFC-6890CDW"
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfc6890cdw_all"
arch=("i686" "x86_64")
license=('custom:brother commercial license')
depends=("cups")
install="${pkgname}.install"
source=(
  "http://www.brother.com/pub/bsc/linux/dlf/mfc6890cdwlpr-${pkgver}-${_pkgrel}.i386.rpm"
  "http://www.brother.com/pub/bsc/linux/dlf/mfc6890cdwcupswrapper-${pkgver}-${_pkgrel}.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
sha256sums=(
  '03be7d462d6353b77f4abb39769fe880f47c6c1bce8f5ae7ea99fd3b7b15435b'
  '244c6a0d0ab2cda7696635680f8494b8491abcee8cffdb2a90dfc17c2fc65b9b'
  '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
  '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67'
)
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi
prepare() {
#  do not install in '/usr/local'
  if [ -d "${srcdir}/usr/local/Brother" ]; then
    install -d "${srcdir}/usr/share"
    mv "${srcdir}/usr/local/Brother/" "${srcdir}/usr/share/brother"
    rm -rf "${srcdir}/usr/local"
          sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
        fi
# setup cups-directories
  install -d "${srcdir}/usr/share/cups/model"
  install -d "${srcdir}/usr/lib/cups/filter"
#  go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
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
    export srcdir=$srcdir
    ./$_wrapper_source
    sed -i 's|$srcdir||' "${srcdir}"/usr/lib/cups/filter/*lpdwrapper*
    sed -i "s|${srcdir}||" "${srcdir}"/usr/lib/cups/filter/*lpdwrapper*
    rm $_wrapper_source
  fi
#  /etc/printcap is managed by cups
  rm `find ${srcdir} -type f -name 'setupPrintcap*'`
}
package() {
  cp -R "${srcdir}/usr" "${pkgdir}"
  if [ -d "${srcdir}/opt" ]; then cp -R "${srcdir}/opt" "${pkgdir}"; fi
  install -m 644 -D cupswrapper-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
  install -m 644 -D lpr-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/lpr-licence.txt"
}
# vim:set ts=2 sw=2 et:
