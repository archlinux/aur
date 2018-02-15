# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# The cups binary is 64 bit. Until Brother releases source for the 32 bit lpr
# binary blobs, 64 bit users must enable multilib.

# This has not been tested with non cups lprng.

# NOTE 1: Remember to add user to lp group using
# gpasswd -a USER lp
# NOTE 2: Remember to logout after adding groups
# NOTE 3: Set each printer default Media Size to Letter with
# lpadmin -p BR7360 -o media=Letter

set -u
_brotheru='MFC-J6935DW'
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
pkgname="brother-${_brotherl}"
pkgver='1.0.1_0'
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='http://www.brother.com/'
license=('GPL' 'custom')
depends=('cups' 'ghostscript' 'psutils' 'sed' 'grep' 'perl' 'file')
depends_x86_64=('lib32-glibc' 'lib32-gcc-libs')
# We look at the scripts and find these programs from which we decide on the depends above.
# gs: lpr rendering
# pdf2ps: cups rendering
# (not) a2ps: rendering ascii text files
# (not) pstops: pdf resizing
# (not) psnup: printing n-up pages
# sed grep awk
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
# Printing a text file fails when Liberation is the only TrueType font available
# perl: cupswrapper
optdepends=(
  'ttf-dejavu: printing text files from lpr'
  'brscan4: Scanner support'
)
_brsource="brother_${_brotherlnd}_GPL_source_${pkgver//_/-}"
#_dlf='http://www.brother.com/pub/bsc/linux/dlf'
source=(
  "http://download.brother.com/welcome/dlf103034/${_brotherlnd}cupswrapper-${pkgver//_/-}.i386.rpm"
  "http://download.brother.com/welcome/dlf103010/${_brotherlnd}lpr-${pkgver//_/-}.i386.rpm"
  'lpr-license.txt' # Obtained from web download page
)
sha256sums=('9fedc880605dd9be74669f815468fc9d71b26fb8ff9f57291f9642e5e6e1afa6'
            '8f2321e529a6c8474f888a77bd2921cc16b19eae538c9752692316221a0600c5'
            'b604def129534d245fa576f8cd7d01df1d2856b9bff6c1d2002404f77f7d4bb3')

prepare() {
  set -u
  # setup cups-directories
  install -dm755 "${srcdir}/usr/lib/cups/filter"
  install -dm755 "${srcdir}/usr/share/cups/model"
  #install -dm755 "${srcdir}/usr/share/ppd" # For cups we don't need the ppd file here.

  # Some Brother installers create files here
  mkdir -p "${srcdir}/var/tmp"

  local _wrapper_source="${srcdir}/opt/brother/Printers/${_brotherlnd}/cupswrapper/cupswrapper${_brotherlnd}"
  #cp -p "${_wrapper_source}" "${_wrapper_source}.Arch" # debug: diff compare with Total Commander
  sed -e '# Install to _srcdir. Some folders may not apply to this model.' \
      -e 's:/usr:"${_srcdir}"&:g' \
      -e 's:/opt:"${_srcdir}"&:g' \
      -e 's:/var:"${_srcdir}"&:g' \
      -e 's:/etc:"${_srcdir}"&:g' \
      -e 's:""${_srcdir}":"${_srcdir}:g' \
      -e "# Stop the Install script after the files are generated. cups doesn't require a reload to see the printer driver." \
      -e 's:^sleep.*$:exit 0 # & #Arch Linux Compatible:g' \
      -e '# not using set -u allows bugs like this to slip by' \
      -e '#/Nup=/ s:`:\\`:g' \
      -e 's: $errorcode: \\$errorcode:g' \
      -e '# This printer requires the permissions fix that isnt multi user compatible.' \
      -e 's:/usr/local/Brother:/usr/share/brother:g' \
      -e '# Fix symlinks' \
      -e 's:brotherlpdwrapper="\${_srcdir}":brotherlpdwrapper=:g' \
    -i "${_wrapper_source}"
  grep -lq "#Arch Linux Compatible$" "${_wrapper_source}" || echo "${}"
  test -f "${_wrapper_source}.Arch" && echo "${}" # Halt for debugging
  # Generate PPD and wrapper. Use sh -x to debug
  # Possible bug: copying to /usr/share/ppd is disabled.
  _srcdir="${srcdir}" \
  sh -u -e "${_wrapper_source}" -i
  find "${srcdir}" -type 'f' -name '*.ppd' -exec chmod 644 '{}' '+' # Some installers make ppd executable
  rm -rf "${srcdir}/var"

  # We did everything in the installer so we can get rid of it.
  rm "${_wrapper_source}"

  cd "${srcdir}"
  # Misnamed printer does not sort or autodetect properly
  #sed -e "s:Brother ${_brotherund} :Brother ${_brotheru} :g" -i 'usr/share/cups/model'/*.ppd
  set  +u
}

package() {
  set -u
  local _dir
  # /var/spool is not used anywhere in this package. Maybe it's needed for non cups lprng.
  for _dir in 'usr' 'opt'; do # 'var'
    if [ -d "${srcdir}/${_dir}" ]; then
      cp -pR "${srcdir}/${_dir}" "${pkgdir}"
    fi
  done

  # /etc/printcap is managed by cups. This eliminates any need for a printcap helper.
  find "${pkgdir}" -type 'f' -name 'setupPrintcap*' -exec rm '{}' '+'

  # Ensure we got a ppd and a filter for CUPS
  test "$(find "${pkgdir}/usr/share/cups/model" -type f -name '*.ppd')"
  test "$(find "${pkgdir}/usr/lib/cups/filter/" '(' -type f -o -type l ')')"

  # Ensure there are no forbidden paths
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

  #install -Dpm644 <(sed -e 's:\r::g' "${_brsource}/Copying") "${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
  install -Dpm644 'lpr-license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/lpr-licence.txt"
  set +u
}
set +u
