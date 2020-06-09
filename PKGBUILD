# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: electricprism
# Contributor: mrshannon Michael R. Shannon

_brinf=(
[MFC-L8610CDW]
PRN_CUP_RPM=mfcl8610cdwcupswrapper-1.5.0-0.i386.rpm
PRN_CUP_DEB=mfcl8610cdwcupswrapper-1.5.0-0.i386.deb
PRN_LPD_RPM=mfcl8610cdwlpr-1.5.0-0.i386.rpm
PRN_LPD_DEB=mfcl8610cdwlpr-1.5.0-0.i386.deb
REQUIRE32LIB=no
PRINTERNAME=MFCL8610CDW
SCANNER_DRV=brscan4
SCANKEY_DRV=brscan-skey
)

_opt_DEB=0

set -u
_brotheru='MFC-L8610CDW'
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
_brotherxnd="${_brotherlnd}"   # upper or lower as required by scripts
pkgname="brother-${_brotherl}"
_lprver='1.5.0_0'
_cupver='1.5.0_0'
pkgver="${_cupver}"
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='https://support.brother.com/'
license=('GPL' 'custom')
depends=('cups' 'ghostscript' 'sed' 'grep')
# We look at the scripts and find these programs from which we decide on the depends above.
# gs: lpr rendering
# pdf2ps: cups rendering
# (no) a2ps: rendering ascii text files
# (no) pstops: pdf resizing
# (no) psnup: printing n-up pages
# sed grep awk
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
# Printing a text file fails when Liberation is the only TrueType font available
depends+=('perl') # cupswrapper
optdepends=(
  'ttf-dejavu: printing text files from lpr'
)
options=('!strip')
#install="${pkgname}.install"
_dlf='http://www.brother.com/pub/bsc/linux'
_inf="${_brotherlnd}-${pkgver}.inf"
source=(
  'cupswrapper-license.txt'
  "${_inf}::${_dlf}/infs/${_brotherund}"
  'lpr-license.txt'
)
md5sums=('e42487a541573287fad544bafd1766c6'
         'f79bb3831af251bfcd876459cc054a99'
         '4f14b328317aac0d22c7f7f73c581628'
         '5c629753325da0b93fffedadecc59e63'
         'bce59955c4442d31876ffb0b1cb2bb62')
sha256sums=('65de8004f8d44a96b62f874a26a80b285f7f6b9f37a8b6c628d094e7f1986b2a'
            '9be8010091f7488773a892c8a93169200b1e3e453ef0eaab698ee6fe9cff7411'
            'b604def129534d245fa576f8cd7d01df1d2856b9bff6c1d2002404f77f7d4bb3'
            '64b501f4e5536e84ef5ebb48612d19f8150a67904bfe9b44a2b00b2167e10ef0'
            '9a4b99c28c2aca3fa2de75d2a04491cc74eb92906067edaac5b1ab741391b03e')

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

  # Some Brother installers create files here
  mkdir -p 'var/tmp'

  # This generated wrapper isn't used. We just want to run the install commands.

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
      -e '# Fix symlinks' \
      -e 's:^ldpwrapper="\${_srcdir}":ldpwrapper=:g' \
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

  local _wrapgen="${_basedir}/cupswrapper/brother_lpdwrapper_${_brotherxnd}"
  #local _wrapgen="usr/lib/cups/filter/brlpdwrapper${_brotherxnd}"
  #local _wrapgen="usr/lib/cups/filter/brother_lpdwrapper_${_brotherxnd}"
  test -s "${_wrapgen}" || echo "${}"

  # Ensure all paths were removed
  grep -qFe $'${_srcdir}\n'"${srcdir}" "${_wrapgen}" && echo "${}"

  # We did everything in the installer so we can get rid of it.
  rm "${_wrapper_source}"

  # Misnamed printer does not sort or autodetect properly
  #sed -e "s:Brother ${_brotherund} :Brother ${_brotheru} :g" -i "${_ppdir}"/*.ppd

  # Check to see if the lpd wrapper is referenced by the ppd
  # Check to see if our compiled code is referenced by the lpd wrapper
  local _nppdfound=0
  #local _ncodefound=0
  #local _lwrapper
  for _lwrapper in 'usr/lib/cups/filter'/*; do
    if grep -q "$(basename "${_lwrapper}")" "${_ppdir}"/*.ppd; then
      _nppdfound=$((_nppdfound+1))
    fi
    #if grep -q "${_brcupsconf##*/}" "${_lwrapper}"; then
    #  _ncodefound=$((_ncodefound+1))
    #fi
  done
  test "${_nppdfound}" -ne 0 || echo "${}"
  #test "${_ncodefound}" -ne 0 || echo "${}"

  set +u
}

_postin() {
  # move architecture specific binaries into place and delete rest
  set +u; msg2 "Apply ${CARCH} binaries"; set -u
  local _basedir="opt/brother/Printers/${_brotherxnd}"
  local _f=''
  pushd "${pkgdir}/${_basedir}/lpd" > /dev/null
  local _dir _fnd=0
  local _dels=()
  for _dir in */; do
    _dels+=("${_dir}")
    if [ "${_dir}" = "${CARCH}/" ]; then
      _dir="${_dir%/}"
      mv "${_dir}"/* .
      install -d "${pkgdir}/usr/bin"
      mv br*cdw "${pkgdir}/usr/bin/"
      _fnd=1
    fi
  done
  if [ "${_fnd}" -eq 0 ]; then
    echo "No architecture specific binaries were found in ${_basedir}/lpd/${CARCH}"
    set +u
    false
  else
    rm -r "${_dels[@]}"
  fi
  popd > /dev/null
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

  _postin

  # Ensure we got a ppd and a filter for CUPS
  test ! -z "$(find "${pkgdir}/usr/share/cups/model" -type 'f' -name '*.ppd')" || echo "${}"
  test ! -z "$(find "${pkgdir}/usr/lib/cups/filter/" '(' -type 'f' -o -type 'l' ')')" || echo "${}"

  # Ensure there are no forbidden paths
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

  install -Dpm644 'cupswrapper-license.txt' 'lpr-license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
