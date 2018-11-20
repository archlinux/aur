# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: libernux <dutchman55@gmx.com>

# This has not been tested with non cups lprng.

# NOTE 1: Remember to add user to lp group using
# gpasswd -a USER lp
# NOTE 2: Remember to logout after adding groups
# NOTE 3: Set each printer default Media Size to Letter with
# lpadmin -p BR7360 -o media=Letter

_opt_DEB=0

set -u
_brothern='420'
_brotheru="MFC-${_brothern}CN"
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
pkgname="brother-${_brotherl}"
_lprver='1.0.2_1'
_cuprpmver='1.0.0_1'
_cupdebver='1.0.2_3'
pkgver="${_cuprpmver}"
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='https://support.brother.com/g/s/id/linux/en/'
license=('GPL' 'custom')
depends=('cups' 'ghostscript' 'psutils' 'a2ps' 'sed' 'grep')
depends+=('tcsh')
depends_x86_64=('lib32-glibc')
# We look at the scripts and find these programs from which we decide on the depends above.
# gs: lpr rendering
# pdf2ps: cups rendering
# a2ps: rendering ascii text files
# (no) pstops: pdf resizing
# (no) psnup: printing n-up pages
# sed grep awk
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
# Printing a text file fails when Liberation is the only TrueType font available
optdepends=(
  'ttf-dejavu: printing text files from lpr'
  'brscan2: Scanner support'
)
makedepends=('patchelf')
options=('!strip')
#install="${pkgname}.install"
#_brsource="brmfc-src-${pkgver//_/-}.i386" # fax driver, cups driver source not available
_dlf="http://www.brother.com/pub/bsc/linux"
source=(
  "${_brotherlnd}.inf::${_dlf}/infs/${_brotherund}" # A crc change lets us know that the driver has been updated
  "${_dlf}/packages/${_brotherund}lpr-${_lprver//_/-}.i386.rpm"
  "${_dlf}/packages/cupswrapper${_brotherund}-${_cuprpmver//_/-}.i386.rpm"
  #"${_dlf}/dlf/${_brsource}.tar.gz"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
if [ "${_opt_DEB}" -ne 0 ]; then
  noextract=(
    "${_dlf}/packages/${_brotherlnd}lpr-${_lprver//_/-}.i386.deb"
    "${_dlf}/packages/cupswrapper${_brotherund}-${_cupdebver//_/-}.i386.deb"
  )
  source[1]="${noextract[0]}"
  source[2]="${noextract[1]}"
  noextract=("${noextract[@]##*/}")
fi
md5sums=('771bd45f00fd7dfdf8d1937371a92d98'
         'cce69ed63841ccffe5ad38e8ec17ec30'
         'dec7e5367a5b31c7ac98e24454181479'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d')
sha256sums=('01bf70ce74da534a4e15ba0ae7e9856bfbb23d2f7ae315be83d71096615a16fb'
            'a84e7f6a4bde6898618b77d8b6873649dda9ed48a35febed21a0f2e83fdb06ff'
            'b25053439ca227176dc5bccf4c3644524ca8a91151e38bfb3c5b5ce34debc8ba'
            '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')

# Conflicts with MFC-410CN
# Must be same length as
#         'Brother'
_conflict='bmf420c'

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
  #install -dm755 "${srcdir}/usr/share/ppd" # For cups we don't need the ppd file here.

  # /etc/printcap is managed by cups
  find . -type 'f' -name 'setupPrintcap*' -delete

  set +u
}

build() {
  set -u

  #local _basedir="opt/brother/Printers/${_brotherlnd}"
  local _basedir="usr/share/${_conflict}"
  local _wrapper_source=(${_basedir}/cupswrapper/cupswrapper${_brotherund}*)
  test "${#_wrapper_source[@]}" -eq 1 || echo "${}"
  _wrapper_source="${_wrapper_source[0]}"
  test -s "${_wrapper_source}" || echo "${}"

  # Some Brother installers create files here
  #mkdir -p 'var/tmp'

  # Fix lpr driver.
  sed -e '# Fix sbin reference' \
      -e 's:/sbin/:/bin/:g' \
      -e '#Fix hash bang' \
      -e 's:#/bin/sh:#!/bin/sh:g' \
    -i "${_basedir}/lpd/psconvertij2"

  local _brcupsconf='usr/bin/brprintconfij2'
  # personalize print config in /usr/bin to prevent conflicts with other printers
  if :; then
    local _brcupsconfo="${_brcupsconf}"
    _brcupsconf+="${_brotherund}"
    mv "${_brcupsconfo}" "${_brcupsconf}"
    sed -e "s:${_brcupsconfo##*/}:${_brcupsconf##*/}:g" -i "${_wrapper_source}"
    unset _brcupsconfo
  fi

  # Fix page shifted off center that affects some printers
  # Letter prints off center shifted down and right with PaperType=A4
  # I can only test printing A4 on Letter paper. A4 appears to print correctly with PaperType=Letter
  #sed -e 's:^\(PaperType\)=.\+$:\1=Letter:g' -i "${_basedir}/inf/br${_brotherund}rc"

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
      -e '/>>/ s:"${_srcdir}"::g' \
      -e '# Remove extra quotes where path was already quoted' \
      -e 's:""\${_srcdir}":"${_srcdir}:g' \
      -e '#s:/model/Brother:/model:g' \
      -e "# Stop the Install script after the files are generated. cups doesn't require a reload to see the printer driver." \
      -e 's:^sleep.*$:exit 0 # & #Arch Linux Compatible:g' \
      -e '# not using set -u allows bugs like this to slip by' \
      -e '#/Nup=/ s:`:\\`:g' \
      -e '# Fix a forgotten escape script error' \
      -e '#s: \$errorcode: \\$errorcode:g' \
      -e '# This printer requires the permissions fix that isnt multi user compatible.' \
      -e "s:/usr/local/Brother:/usr/share/${_conflict}:g" \
      -e '/cups restart/ s:^:true :g' \
    -i "${_wrapper_source}"
  grep -lqe '#Arch Linux Compatible$' "${_wrapper_source}" || echo "${}"
  test -f "${_wrapper_source}.Arch" && echo "${}" # Halt for debugging
  # Generate PPD and wrapper. Use sh -x to debug
  # Possible bug: copying to /usr/share/ppd is disabled.
  _srcdir="${srcdir}" \
  tcsh "${_wrapper_source}" -i # set -e crashes early, bash set -u is always active
  local _ppdir='usr/share/cups/model'
  chmod 644 "${_ppdir}"/*.ppd # Some installers make ppd executable
  rm -rf 'var'

  #local _wrapgen="${_basedir}/cupswrapper/brother_lpdwrapper_${_brotherlnd}"
  local _wrapgen="usr/lib/cups/filter/brlpdwrapper${_brotherund}"
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
  local _ncodefound=0
  local _lwrapper
  for _lwrapper in 'usr/lib/cups/filter'/*; do
    if grep -q "$(basename "${_lwrapper}")" 'usr/share/cups/model'/*.ppd; then
      _nppdfound=$((_nppdfound+1))
    fi
    if grep -q "${_brcupsconf##*/}" "${_lwrapper}"; then
      _ncodefound=$((_ncodefound+1))
    fi
  done
  test "${_nppdfound}" -ne 0 || echo "${}"
  test "${_ncodefound}" -ne 0 || echo "${}"

  set +u
}

_fn_libconflict() {
  # Change lib name to prevent conflicts with other printers that use the same one
  local _f1='libbrcompij2'
  local _f2="${_f1}-${_brotherlnd}"
  local _fp='' # blank enables name change, pound sign # disables

  # Execute ln soname commands from postin
  if [ "${_opt_DEB}" -ne 0 ]; then
    local _postin='debextract.2/postinst'
  else
    local _postin="${source[1]##*/}"
  fi

  grep -ae '^ln -s' "${_postin}" | \
  sed -e 's:/usr/lib/::' \
      -e "s:/usr/lib/:${pkgdir}&:g" \
      -e '# Prevent lib conflicts with similar printers' \
      -e "${_fp}s:${_f1}:${_f2}:g" \
  | bash -e -u --

  if [ -z "${_fp}" ]; then
    mv "${pkgdir}/usr/lib/${_f1}.so.1.0.2" "${pkgdir}/usr/lib/${_f2}.so.1.0.2"
    grep -aqFe "${_f1}.so.1" "${pkgdir}/usr/share/${_conflict}/lpd/rastertobrij2" || echo "${}"
    patchelf --replace-needed "${_f1}.so.1" "${_f2}.so.1" "${pkgdir}/usr/share/${_conflict}/lpd/rastertobrij2"
    patchelf --set-soname "${_f2}.so.1" "${pkgdir}/usr/lib/${_f2}.so.1.0.2"
  fi
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

  _fn_libconflict

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
