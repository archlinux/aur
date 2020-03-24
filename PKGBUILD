# Maintainer: Sankhesh Jhaveri sankhesh aATt gmail dott com
# Category: system

_brinf=(
[MFC-J6710DW]
PRN_CUP_RPM=mfcj6925dwcupswrapper-3.0.0-1.i386.rpm
PRN_CUP_DEB=mfcj6925dwcupswrapper-3.0.0-1.i386.deb
PRN_LPD_RPM=mfcj6925dwlpr-3.0.0-1.i386.rpm
PRN_LPD_DEB=mfcj6925dwlpr-3.0.0-1.i386.deb
PRINTERNAME=MFCJ6925DW
SCANNER_DRV=brscan4
SCANKEY_DRV=brscan-skey
)
_brinf+=(
REQUIRE32LIB=yes
)

_opt_DEB=0

set -u
_brotheru='MFC-J6925DW'
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
_brotherxnd="${_brotherlnd}"   # upper or lower as required by scripts
pkgname="brother-${_brotherl}"
pkgver='3.0.0_1'
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='https://support.brother.com/g/s/id/linux/en/'
license=('GPL' 'custom')
depends=('cups' 'ghostscript' 'psutils' 'a2ps' 'sed' 'grep')
# We look at the scripts and find these programs from which we decide on the depends above.
# gs: lpr rendering
# pdf2ps: cups rendering
# a2ps: rendering ascii text files
# (no) pstops: pdf resizing
# psnup: printing n-up pages
# sed grep awk
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
# Printing a text file fails when Liberation is the only TrueType font available
depends+=('perl') # cupswrapper
optdepends=(
  'ttf-dejavu: printing text files from lpr'
)
options=('!strip')
#install="${pkgname}.install"
_brsource="${_brotherlnd}_cupswrapper_GPL_source_${pkgver//_/-}"
_dlf='http://www.brother.com/pub/bsc/linux'
_dlf1='https://download.brother.com/welcome'
_inf="${_brotherlnd}-${pkgver}.inf"
source=(
  "${_inf}::${_dlf}/infs/${_brotherund}"
  "${_dlf1}/dlf102068/${_brsource}.tar.gz"
  "lpr-license.txt"
)
md5sums=('952febfbd59fa12a37626266437f14e1'
         '116c33db3e030f30b98e62eba007f5fd'
         '5e87a3dc0f3e3438c088eda0f3565f0d'
         'c863b2eb58d33bab15930fe4651b9cf1'
         '9a7ea7a50153370592e00623aa8381e1')
sha256sums=('c8fc76f7e08d56b9d9d4800c7c35bc1e601215c854e82b877539ac6c48ea6cbe'
            'c146b1610bdbda8244e48a4255b9e5a622772b5fa07153adeaa380c64ccc59f8'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67'
            'ed067f8019712102b83385d45c82d80b2aabc7ed3f2b3af6bbead68514262872'
            '39a40ca452b57a67af152933d5a187b4e0b4a011d1aba3127772d4d9d0a6322b')

_mismatch=0
_brverchk() {
  local _ver="$1"
  _ver="${_ver%.*}"
  _ver="${_ver%.*}"
  local _vb="${_ver%-*}"
  _vb="${_vb%-*}-"
  _ver="${_ver#${_vb}}"
  local _pv="$2"
  if [ -z "${_pv}" ]; then
    _pv="$3"
  fi
  if [ -z "${_pv}" ]; then
    _pv="$4"
  fi
  if [ "${_ver}" != "${_pv//_/-}" ]; then
    echo "Version mismatch: ${_ver} ${_pv//_/-}" 1>&2
    _mismatch=$((_mismatch+1))
  fi
}

_procinf() {
  local _fd _fvar _fval
  for _fd in "${_brinf[@]}"; do
    _fvar="${_fd%%=*}="
    _fval="${_fd##*=}"
    if [ ! -z "${_fval}" ]; then
      case "${_fvar}" in
      '['*);;
      PRN_CUP_RPM=)
        _brverchk "${_fval}" "${_cuprpmver:-}" "${_cupver:-}" "${pkgver}"
        if [ "${_opt_DEB}" -eq 0 ]; then
          source+=("${_dlf}/packages/${_fval}")
        fi
      ;;
      PRN_CUP_DEB=)
        _brverchk "${_fval}" "${_cupdebver:-}" "${_cupver:-}" "${pkgver}"
        if [ "${_opt_DEB}" -ne 0 ]; then
          source+=("${_dlf}/packages/${_fval}")
        fi
      ;;
      PRN_LPD_RPM=)
        _brverchk "${_fval}" "${_lprrpmver:-}" "${_lprver:-}" "${pkgver}"
        if [ "${_opt_DEB}" -eq 0 ]; then
          source+=("${_dlf}/packages/${_fval}")
        fi
      ;;
      PRN_LPD_DEB=)
        _brverchk "${_fval}" "${_lprdebver:-}" "${_lprver:-}" "${pkgver}"
        if [ "${_opt_DEB}" -ne 0 ]; then
          source+=("${_dlf}/packages/${_fval}")
        fi
      ;;
      PRN_DRV_RPM=)
        _brverchk "${_fval}" "" "" "${pkgver}"
        if [ "${_opt_DEB}" -eq 0 ]; then
          source+=("${_dlf}/packages/${_fval}")
        fi
      ;;
      PRN_DRV_DEB=)
        _brverchk "${_fval}" "" "" "${pkgver}"
        if [ "${_opt_DEB}" -ne 0 ]; then
          source+=("${_dlf}/packages/${_fval}")
        fi
      ;;
      REQUIRE32LIB=)
        if [ "${_fval}" = 'yes' ]; then
          depends_x86_64+=('lib32-glibc')
        fi
      ;;
      PRINTERNAME=);;
      SCANNER_DRV=)optdepends+=("${_fval}: Scanner support");;
      SCANKEY_DRV=)optdepends+=("${_fval}: Scanner button support");;
      *) echo "Unrecognized line: ${_fd}" 1>&2; exit 1;;
      esac
    fi
  done
  test "${_mismatch}" -eq 0 || exit 1
}
_procinf
unset -f _procinf _brverchk
unset _mismatch _brinf

# Must be same length as
#         'Brother'
_conflict='brother'

prepare() {
  set -u

  shopt -s nullglob
  local _deb
  local _debn=1
  for _deb in *.deb; do
    local _dx="debextract.${_debn}"
    mkdir "${_dx}"
    bsdtar -C "${_dx}" -xf "${_deb}"
    bsdtar -C "${_dx}" -xf "${_dx}"/control.tar.?z
    bsdtar -xf "${_dx}"/data.tar.?z
    rm "${_dx}"/*.tar.?z
    _debn=$((_debn+1))
  done
  shopt -u nullglob

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
  install -d 'usr/lib/cups/filter'
  install -d 'usr/share/cups/model'
  #install -d 'usr/share/ppd' # For cups we don't need the ppd file here.

  # /etc/printcap is managed by cups
  find . -type 'f' -name 'setupPrintcap*' -delete

  set +u
}

build() {
  set -u

  local _basedir="opt/brother/Printers/${_brotherxnd}"
  #local _basedir="usr/share/${_conflict}"
  #local _basedir="usr/share/${_conflict}/Printer/${_brotherxnd}"
  shopt -s nullglob
  local _wrapper_source=("${_basedir}/cupswrapper/cupswrapper${_brotherxnd}"*)
  shopt -u nullglob
  test "${#_wrapper_source[@]}" -eq 1 || echo "${}"
  _wrapper_source="${_wrapper_source[0]}"
  test -x "${_wrapper_source}" || echo "${}"
  echo "Wrapper source: ${_wrapper_source}"

  shopt -s nullglob
  local _brcupsconf=("${_basedir}/cupswrapper"/brcupscon*); test "${#_brcupsconf[@]}" -eq 1 || echo "${}"
  shopt -u nullglob
  _brcupsconf="${_brcupsconf[0]}"
  if [ ! -z "${_brsource:-}" ]; then
    shopt -s nullglob
    local _makedir=("${_brsource}/brcupsconf"*)
    shopt -u nullglob
    test "${#_makedir[@]}" -eq 1 || echo "${}"
    _makedir="${_makedir[0]}"
    test -d "${_makedir}" || echo "${}"

    # Source is available for the cups binary, not the lpr binaries so we can't
    # get away from multilib. Any usage of /opt is hardcoded into some binaries
    # for which we can't find an equal length replacement so we can't easily get
    # rid of that either.
    pushd "${_makedir}" > /dev/null
    if [ -s 'Makefile' ]; then
      'ma''ke' -s
      cp -p "${_brcupsconf##*/}" "${srcdir}/${_brcupsconf}"
    else
      # gcc options are pulled from other Brother makefiles.
      gcc -pipe -Wall -W -O2 -s -o "${srcdir}/${_brcupsconf}" "brcupsconfig.c"
    fi
    popd > /dev/null

    # Use the wrapper from the source file if available
    pushd "${_brsource}" > /dev/null
    [ -d 'scripts' ] && cd 'scripts'
    [ -d 'SCRIPT' ] && cd 'SCRIPT'
    [ -d 'cupswrapper' ] && cd 'cupswrapper'
    shopt -s nullglob
    local _wr2=("cupswrapper${_brotherxnd}"*)
    shopt -u nullglob
    if [ "${#_wr2[@]}" -eq 1 ]; then
      rm "${srcdir}/${_wrapper_source}"
      _wrapper_source="${_brsource}/${PWD#*/${_brsource}/}/${_wr2[0]}"
      unset _wr2
      set +u; msg2 "Alternate wrapper ${_wrapper_source}"; set -u
    fi
    popd >/dev/null

    # Use the ppd supplied in the source
    shopt -s nullglob
    local _altppd=("${_brsource}"/[Pp][Pp][Dd]/)
    shopt -u nullglob
    if [ "${#_altppd[@]}" -eq 1 ]; then
      _altppd="${_altppd[0]}"
      local _altppdn="brother_${_brotherxnd}_printer_en.ppd"
      mv "${_altppd}/${_altppdn}" "${_basedir}/cupswrapper/"
      chmod 644 "${_basedir}/cupswrapper"/*.ppd
      set +u; msg2 "Alternate ppd ${_altppdn}"; set -u
    fi
  fi

  # Some Brother installers create files here
  mkdir -p 'var/tmp'

  # Fix lpr driver.
  true sed -e '# Fix sbin reference' \
      -e 's:/sbin/:/bin/:g' \
      -e '#Fix hash bang' \
      -e 's:#/bin/sh:#!/bin/sh:g' \
    -i "${_basedir}/lpd/psconvertij2"

  # Fix page shifted off center that affects some printers
  # Letter prints off center shifted down and right with PaperType=A4
  # I can only test printing A4 on Letter paper. A4 appears to print correctly with PaperType=Letter
  sed -e 's:^\(PaperType\)=.\+$:\1=Letter:g' -i "${_basedir}/inf/br${_brotherxnd}rc"

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
      -e '# This printer requires the permissions fix that isnt multi user compatible.' \
      -e "s:/usr/local/Brother:/usr/share/${_conflict}:g" \
    -i "${_wrapper_source}"
  grep -lqe '#Arch Linux Compatible$' "${_wrapper_source}" || echo "${}"
  test -f "${_wrapper_source}.Arch" && echo "${}" # Halt for debugging
  # Generate PPD and wrapper. Use sh -x to debug
  # Possible bug: copying to /usr/share/ppd is disabled.
  _srcdir="${srcdir}" \
  sh -u -e "${_wrapper_source}" -i
  local _ppdir='usr/share/cups/model/Brother'
  chmod 644 "${_ppdir}"/*.ppd # Some installers make ppd executable
  rm -rf 'var'

  #local _wrapgen="${_basedir}/cupswrapper/brother_lpdwrapper_${_brotherxnd}"
  #local _wrapgen="usr/lib/cups/filter/brlpdwrapper${_brotherxnd}"
  local _wrapgen="usr/lib/cups/filter/brother_lpdwrapper_${_brotherxnd}"
  test -s "${_wrapgen}" || echo "${}"

  # Remove srcdir from the generated wrapper file.
  # No paths in the generated ppd.
  sed -e '# Remove the /home/... variety' \
      -e "s:${srcdir}::" \
    -i "${_wrapgen}"

  # Ensure all paths were removed
  grep -qFe $'${_srcdir}\n'"${srcdir}" "${_wrapgen}" && echo "${}"

  # We did everything in the installer so we can get rid of it.
  rm "${_wrapper_source}"

  # Misnamed printer does not sort or autodetect properly
  # sed -e "s:Brother ${_brotherund} :Brother ${_brotheru} :g" -i "${_ppdir}"/*.ppd

  # Check to see if the lpd wrapper is referenced by the ppd
  # Check to see if our compiled code is referenced by the lpd wrapper
  local _nppdfound=0
  local _ncodefound=0
  local _lwrapper
  for _lwrapper in 'usr/lib/cups/filter'/*; do
    if grep -q "$(basename "${_lwrapper}")" "${_ppdir}"/*.ppd; then
      _nppdfound=$((_nppdfound+1))
    fi
    if grep -q "${_brcupsconf##*/}" "${_lwrapper}"; then
      _ncodefound=$((_ncodefound+1))
    fi
  done
  test "${_nppdfound}" -ne 0 || echo "${}"
  test "${_ncodefound}" -ne 0 || echo "${}"

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

  # Ensure we got a ppd and a filter for CUPS
  test ! -z "$(find "${pkgdir}/usr/share/cups/model" -type 'f' -name '*.ppd')" || echo "${}"
  test ! -z "$(find "${pkgdir}/usr/lib/cups/filter/" '(' -type 'f' -o -type 'l' ')')" || echo "${}"

  # Ensure there are no forbidden paths
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

  install -Dpm644 <(sed -e 's:\r::g' "${_brsource}/Copying") "${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
  install -Dpm644 'lpr-license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/lpr-licence.txt"
  set +u
}
set +u
