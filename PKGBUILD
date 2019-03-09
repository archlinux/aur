# Maintainer: Luca P <meti at lplab.net>
# Contributor: Chakib Benziane chakib.benz+aur aATt gmail dott com
# Category: system

# The cups binary is 64 bit. Until Brother releases source for the 32 bit lpr
# binary blobs, 64 bit users must enable multilib.

# This has not been tested with non cups lprng.

# NOTE 1: Remember to add user to lp group using
# gpasswd -a USER lp
# NOTE 2: Remember to logout after adding groups
# NOTE 3: Set each printer default Media Size to Letter with
# lpadmin -p BR5910 -o media=Letter

_brotheru='MFC-J5930DW'
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
pkgname="brother-${_brotherl}"
pkgver='1.0.1'
_brpkgrel='0'
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='http://solutions.brother.com/linux/en_us/'
license=('custom:Brother Industries')
depends=('cups' 'ghostscript' 'psutils' 'a2ps' 'sed' 'grep')
depends_x86_64=('lib32-glibc')
# We look at the scripts and find these programs from which we decide on the depends above.
# gs: lpr rendering
# pdf2ps: cups rendering
# a2ps: rendering ascii text files
# (not) pstops: pdf resizing
# psnup: printing n-up pages
# sed grep awk
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
# Printing a text file fails when Liberation is the only TrueType font available
optdepends=('ttf-dejavu: printing text files from lpr'
            'brscan4: Scanner support')
#install="${pkgname}.install"
# The cups wrapper uses the lpr driver.
source=(
  "http://download.brother.com/welcome/dlf103006/${_brotherlnd}lpr-${pkgver}-${_brpkgrel}.i386.rpm"
  "http://download.brother.com/welcome/dlf103030/${_brotherlnd}cupswrapper-${pkgver}-${_brpkgrel}.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
sha256sums=('e4fb55da5f3b2acf81498b9629fb96f97fb7dcf6b677b15e547c9cb8557e136b'
            'a5719c502c236961f08cb26b43ea727f8962153afeb717ca996d631b81015521'
            '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')

build() {
  set -u
  # setup cups-directories
  install -dm755 "${srcdir}/usr/lib/cups/filter"
  install -dm755 "${srcdir}/usr/share/cups/model"
  install -dm755 "${srcdir}/usr/share/cups/model/Brother"
  #install -dm755 "${srcdir}/usr/share/ppd" # For cups we don't need the ppd file here.


  set +u
}

package() {
  local _dir
  # /var/spool is not used anywhere in this package. Maybe it's needed for non cups lprng.
  for _dir in 'usr' 'opt'; do # 'var'
    if [ -d "${srcdir}/${_dir}" ]; then
      cp -pR "${srcdir}/${_dir}" "${pkgdir}"
    fi
  done
  cp "${srcdir}/opt/brother/Printers/mfcj5930dw/cupswrapper/brother_mfcj5930dw_printer_en.ppd" "${pkgdir}/usr/share/cups/model/Brother/brother_mfcj5930dw_printer_en.ppd"
  chmod 644 "${pkgdir}/usr/share/cups/model/Brother/brother_mfcj5930dw_printer_en.ppd"
  ln -s "/opt/brother/Printers/mfcj5930dw/cupswrapper/brother_lpdwrapper_mfcj5930dw" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcj5930dw"

  # /etc/printcap is managed by cups. This eliminates any need for a printcap helper.
  rm -f "`find "${pkgdir}" -type f -name 'setupPrintcap*'`"
  # Ensure we got a ppd and a filter for CUPS
  test "$(find "${pkgdir}/usr/share/cups/model" -type f -name '*.ppd')"
  #test "$(find "${pkgdir}/usr/lib/cups/filter/" -type f)"

  # Ensure there are no forbidden paths
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

}
