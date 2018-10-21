# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Libernux <dutchman55@gmx.com>
# Contributor: Roland Singer <roland@manjaro.org>

# TODO: Add cupswrapper compile from source
# TODO: Check _rcfile A4 -> Letter fix
# TODO: Check printer autodetect

set -u
_brothern='7040'
_brotheru="DCP-${_brothern}"
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
pkgname="brother-${_brotherlnd}"
pkgver='2.0.2_1'
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='https://solutions.brother.com/linux/en_us/'
license=('GPL' 'custom')
depends=('cups' 'ghostscript' 'psutils' 'a2ps' 'sed' 'grep')
depends_x86_64=('lib32-glibc')
# We look at the scripts and find these programs from which we decide on the depends above.
# gs: lpr rendering
# pdf2ps: cups rendering
# a2ps: rendering ascii text files
# pstops: pdf resizing
# psnup: printing n-up pages
# sed grep awk
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
# Printing a text file fails when Liberation is the only TrueType font available
optdepends=(
  'ttf-dejavu: printing text files from lpr'
  'brscan3: Scanner support'
)
options=('!strip')
install="${pkgname}.install"
#_brsource="brother-laser2-cups-driver-${pkgver//_/-}"
_dlf="http://www.brother.com/pub/bsc/linux/dlf"
source=(
  "${_dlf}/brdcp7040lpr-${pkgver//_/-}.i386.rpm"
  "${_dlf}/cupswrapperDCP7040-${pkgver//_/-}.i386.rpm"
  #"${_dlf}/${_brsource}.tar.gz"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
md5sums=('418e58699d90a16e62059ba49fb51ad5'
         'ca4a32afe0a30b4edbe2b26a8330f5d9'
         '809c64563dbd89f89ca68f9218c59cf5'
         '4f14b328317aac0d22c7f7f73c581628')
sha256sums=('013958c343c3aa336138bab87a8b1b9c7266e5c59715636e2025b63815c216ce'
            '04a515ed2a1a35eaf01d158fd8a0149d45b0a6167713b3fe424ffeffddcd94f0'
            'c52eb0091a2854b031cc923bdd7c18e7fe09d2f26b679d804aec4e6c9567bb7d'
            'b604def129534d245fa576f8cd7d01df1d2856b9bff6c1d2002404f77f7d4bb3')

# Conflicts with MFC-7340
# Must be same length as
#         'Brother'
_conflict='bdc7040'

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckvar
  local _ckline
  local _pkgname="${pkgname}"
  for _ckvar in '_conflict'; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      msg "${install} must be fixed"
      echo "${_ckline}"
      set +u
      false
    fi
  done
}

prepare() {
  set -u

  _install_check

  # Do not Install in '/usr/local'. Does not apply to all Brother models.
  # This may modify binary blobs which only
  # works when the old and new strings are exactly the same length.
  if [ -d 'usr/local' ]; then
    install -d 'usr/share'
    mv 'usr/local/Brother' "usr/share/${_conflict}"
    rmdir 'usr/local'
    sed -e "s:/usr/local/Brother:/usr/share/${_conflict}:g" -i $(grep -lare '/usr/local/Brother' ./)
  fi

  # setup cups-directories, some installers create these for us
  #install -d 'usr/lib/cups/filter'
  install -d 'usr/share/cups/model'
  #install -dm755 "${srcdir}/usr/share/ppd" # For cups we don't need the ppd file here.

  # /etc/printcap is managed by cups
  find . -type 'f' -name 'setupPrintcap*' -delete

  # from archasaurusrex comment
  echo "${_brotherund}" > "usr/share/${_conflict}/inf/brPrintList"
  set +u
}

build() {
  set -u
  # Get the dirs and the name of the wrapper. Either in /opt or /usr.
  # This is set up to adapt or crash. Unlike false, ${} shows the line number.
  cd 'opt' 2>/dev/null || cd 'usr'
  local _rcfile
  _rcfile="$(find "`pwd`" -type 'f' -ipath "*inf/br${_brotherund}rc")"
  test -f "${_rcfile}" || echo "${}"

  # go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
  local _wrapdir="$(find . -type 'd' -name 'cupswrapper')"
  test -d "${_wrapdir}" || echo "${}"
  cd "${_wrapdir}"
  echo "Wrapper dir: ${_wrapdir#./}"
  local _wrapper_source
  _wrapper_source=(cupswrapper*)
  test "${#_wrapper_source[@]}" -eq 1 || echo "${}"
  _wrapper_source="${_wrapper_source[0]}"
  test -x "${_wrapper_source}" || echo "${}"
  echo "Wrapper source: ${_wrapper_source}"

  # Some Brother installers create files here
  #mkdir -p "${srcdir}/var/tmp"

  # Fix lpr driver.
  sed -e '# Fix sbin reference' \
      -e 's:/sbin/:/bin/:g' \
      -e '#Fix hash bang' \
      -e 's:#/bin/sh:#!/bin/sh:g' \
    -i $(find "${srcdir}/usr" -type f -name 'psconvert2')

  # Fix page shifted off center that affects some printers
  # Letter prints off center shifted down and right with PaperType=A4
  # I can only test printing A4 on Letter paper. A4 appears to print correctly with PaperType=Letter
  sed -e 's:^\(PaperType\)=.\+$:\1=Letter:g' -i "${_rcfile}"

  # Modify the installer so we can finish the install here in PKGBUILD.
  #cp -p "${_wrapper_source}" "${_wrapper_source}.Arch" # debug: diff compare with Total Commander
  sed -e '# Install to _srcdir. Some folders may not apply to this model.' \
      -e '# quick fix for path that needs to be double quoted' \
      -e "s:'/usr/share/ppd':"'"/usr/share/ppd":g' \
      -e 's:/usr:"${_srcdir}"&:g' \
      -e 's:/opt:"${_srcdir}"&:g' \
      -e 's:/var:"${_srcdir}"&:g' \
      -e 's:/etc:"${_srcdir}"&:g' \
      -e '# Remove unwanted srcdir from the generated files' \
      -e '/^cat <<ENDOFPPDFILE/,/^ENDOFPPDFILE/ s:"${_srcdir}"::g' \
      -e '/^cat <<!ENDOFWFILTER/,/^!ENDOFWFILTER!/ s:"${_srcdir}"::g' \
      -e '# Remove extra quotes where path was already quoted' \
      -e 's:""\${_srcdir}":"${_srcdir}:g' \
      -e '#s:/model/Brother:/model:g' \
      -e "# Stop the Install script after the files are generated. cups doesn't require a reload to see the printer driver." \
      -e 's:^sleep.*$:exit 0 # & #Arch Linux Compatible:g' \
      -e '# not using set -u allows bugs like this to slip by' \
      -e '#/Nup=/ s:`:\\`:g' \
      -e '# Fix a forgotten escape script error' \
      -e 's: \$errorcode: \\$errorcode:g' \
    -i "${_wrapper_source}"
  grep -lq "#Arch Linux Compatible$" "${_wrapper_source}" || echo "${}"
  test -f "${_wrapper_source}.Arch" && echo "${}" # Halt for debugging
  # Generate PPD and wrapper. Use sh -x to debug
  # Possible bug: copying to /usr/share/ppd is disabled.
  _srcdir="${srcdir}" \
  sh -u -e "${_wrapper_source}" -i
  chmod 644 "${srcdir}/usr/share/cups/model"/*.ppd # Some installers make ppd executable
  rm -rf "${srcdir}/var"

  # Remove srcdir from the generated wrapper file.
  sed -e '# Remove the /home/... variety' \
      -e "s:${srcdir}::" \
    -i "${srcdir}/usr/lib/cups/filter"/*lpdwrapper*

  # We did everything in the installer so we can get rid of it.
  rm "${_wrapper_source}"

  cd "${srcdir}"
  # Misnamed printer does not sort or autodetect properly
  sed -e "s:Brother ${_brotherund} :Brother ${_brotheru} :g" -i 'usr/share/cups/model'/*.ppd

  # Check to see if the lpd wrapper is referenced by the ppd
  # Check to see if our compiled code is referenced by the lpd wrapper
  local _nppdfound=0
  #local _ncodefound=0
  local _lwrapper
  for _lwrapper in 'usr/lib/cups/filter'/*; do
    if grep -q "$(basename "${_lwrapper}")" 'usr/share/cups/model'/*.ppd; then
      _nppdfound=$((_nppdfound+1))
    fi
    #if grep -q "${_brcupsconf}" "${_lwrapper}"; then
    #  _ncodefound=$((_ncodefound+1))
    #fi
  done
  test "${_nppdfound}" -ne 0 || echo "${}"
  #test "${_ncodefound}" -ne 0 || echo "${}"
  set +u
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

  # Ensure we got a ppd and a filter for CUPS
  test ! -z "$(find "${pkgdir}/usr/share/cups/model" -type f -name '*.ppd')"
  test ! -z "$(find "${pkgdir}/usr/lib/cups/filter/" -type f)"

  # Ensure there are no forbidden paths
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

  install -Dpm644 'cupswrapper-license.txt' 'lpr-license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
