# Maintainer: MartianReunion <martianreunion@zohomail.cn>
# reference: https://aur.archlinux.org/packages/brother-hl2240d

_brinf=(
# from https://download.brother.com/pub/com/linux/linux/infs/DCP7057
[DCP-7057]
PRN_CUP_RPM=cupswrapperDCP7057-2.0.4-2.i386.rpm
PRN_CUP_DEB=cupswrapperDCP7057-2.0.4-2.i386.deb
PRN_LPD_RPM=dcp7057lpr-2.1.0-1.i386.rpm
PRN_LPD_DEB=dcp7057lpr-2.1.0-1.i386.deb
PRINTERNAME=DCP7057
SCANNER_DRV=brscan4
SCANKEY_DRV=brscan-skey
)

_brinf+=(
REQUIRE32LIB=yes
)


_opt_DEB=0

set -u
_brotheru='DCP-7057'
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
_brotherxnd="${_brotherund}"   # upper or lower as required by scripts

_cupver='2.0.4_2'
_lprver='2.1.0_1'

pkgname="brother-${_brotherlnd}"
pkgver="${_cupver}"
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='https://support.brother.com/g/b/producttop.aspx?c=cn&lang=zh&prod=dcp7057_cn'
license=('GPL' 'custom')
depends=('cups' 'ghostscript' 'psutils' 'a2ps' 'sed' 'grep')
optdepends=(
  'ttf-dejavu: printing text files from lpr'
)
depends+=('perl') # cupswrapper
options=('!strip')

_brsource="br${_brotherlnd}cups_src-${_cupver//_/-}"
_dlf='http://www.brother.com/pub/bsc/linux'
_inf="${_brotherlnd}-${pkgver}.inf"
source=(
  "${_inf}::${_dlf}/infs/${_brotherund}"
  "${_dlf}/dlf/${_brsource}.tar.gz"
  'lpr-license.txt'
)
sha256sums=('259ed41e95e5ccfbbde98fc679e3db12fb88e13374db9196f7a1e49a2e39947c'
            '0ecf1ed8b3e125ac284889b4d29c35ce190567df40f2add88fcf163f1e6a865a'
            '576f8d52351b450f417322885106490cdf7b97b45c7f6262f5eafaddf63adf29'
            '493b160689006893c925c08a2c624d340b792e540d2d4ee383cb57f906696f26'
            '3315e9ec4c1a34b8f44c8a09eb3a5cda774560ab55b5319d7c7e03c2109e1e3c')

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

  #local _basedir="opt/brother/Printers/${_brotherxnd}"
  #local _basedir="usr/share/${_conflict}"
  local _basedir="usr/share/${_conflict}/Printer/${_brotherxnd}"
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
      make -s
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
      _wrapper_source="${_brsource}/${PWD#*/${_brsource}}/${_wr2[0]}"
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
  #mkdir -p 'var/tmp'

  # Fix lpr driver.
  sed -e '# Fix sbin reference' \
      -e 's:/sbin/:/bin/:g' \
      -e '#Fix hash bang' \
      -e 's:#/bin/sh:#!/bin/sh:g' \
    -i "${_basedir}/lpd/psconvert2"

  # Fix page shifted off center that affects some printers
  # Letter prints off center shifted down and right with PaperType=A4
  # I can only test printing A4 on Letter paper. A4 appears to print correctly with PaperType=Letter
  sed -e 's:^\(PaperType\)=.\+$:\1=Letter:g' -i "${_basedir}/inf/br${_brotherxnd}rc"

  # Modify the installer so we can finish the install here in PKGBUILD.
  # cp -p "${_wrapper_source}" "${_wrapper_source}.Arch" # debug: diff compare with Total Commander
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
  grep -lqe '#Arch Linux Compatible$' "${_wrapper_source}" || echo "${}"
  test -f "${_wrapper_source}.Arch" && echo "${}" # Halt for debugging
  # Generate PPD and wrapper. Use sh -x to debug
  # Possible bug: copying to /usr/share/ppd is disabled.
  _srcdir="${srcdir}" \
  sh -u -e "${_wrapper_source}" -i
  local _ppdir='usr/share/cups/model'
  chmod 644 "${_ppdir}"/*.ppd # Some installers make ppd executable
  rm -rf 'var'

  #local _wrapgen="${_basedir}/cupswrapper/brother_lpdwrapper_${_brotherxnd}"
  local _wrapgen="usr/lib/cups/filter/brlpdwrapper${_brotherxnd}"
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
  sed -e "s:Brother ${_brotherund} :Brother ${_brotheru} :g" -i "${_ppdir}"/*.ppd

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