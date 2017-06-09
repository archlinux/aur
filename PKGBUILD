# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: libernux <dutchman55@gmx.com>

# This has not been tested with non cups lprng.

# NOTE 1: Remember to add user to lp group using
# gpasswd -a USER lp
# NOTE 2: Remember to logout after adding groups
# NOTE 3: Set each printer default Media Size to Letter with
# lpadmin -p BR7360 -o media=Letter

set -u
_brotheru='MFC-420CN'
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
pkgname="brother-${_brotherl}"
pkgver='1.0.0_1'
pkgrel='1'
_lprpkgver='1.0.2_1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='http://www.brother.com/'
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
#_brsource="brmfc-src-${pkgver//_/-}.i386" # fax driver, cups driver source not available
_dlf="http://www.brother.com/pub/bsc/linux/dlf"
source=(
  "${_dlf}/cupswrapperMFC420CN-${pkgver//_/-}.i386.rpm"
  "${_dlf}/MFC420CNlpr-${_lprpkgver//_/-}.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
sha256sums=('b25053439ca227176dc5bccf4c3644524ca8a91151e38bfb3c5b5ce34debc8ba'
            'a84e7f6a4bde6898618b77d8b6873649dda9ed48a35febed21a0f2e83fdb06ff'
            '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')

prepare() {
  set -u
  # Do not Install in '/usr/local'. Does not apply to all Brother models.
  # This may modify binary blobs which only
  # works when the old and new strings are exactly the same length.
  if [ -d "${srcdir}/usr/local/Brother" ]; then
    install -dm755 "${srcdir}/usr/share"
    mv "${srcdir}/usr/local/Brother/" "${srcdir}/usr/share/brother"
    rm -rf "${srcdir}/usr/local"
    sed -e 's:/usr/local/Brother:/usr/share/brother:g' -i $(grep -lr '/usr/local/Brother' ./)
  fi

  # setup cups-directories
  install -dm755 "${srcdir}/usr/lib/cups/filter"
  install -dm755 "${srcdir}/usr/share/cups/model"
  #install -dm755 "${srcdir}/usr/share/ppd" # For cups we don't need the ppd file here.

  # Get the dirs and the name of the wrapper. Either in /opt or /usr.
  # This is set up to adapt or crash. Unlike false, ${} shows the line number.
  cd "${srcdir}/opt" 2>/dev/null || cd "${srcdir}/usr"
  local _rcfile="$(find "`pwd`" -type f -ipath "*inf/br${_brotherund}rc")"
  test -f "${_rcfile}" || echo "${}"
  local _bindir="$(find "`pwd`" -type d -name 'cupswrapper')"
  test -d "${_bindir}" || echo "${}" # die if blank or invalid before we rm something we don't want to
  pushd "${_bindir}" > /dev/null
  #local _brcupsconf=(brcupsconf*); _brcupsconf="${_brcupsconf[0]}"
  #test -x "${_brcupsconf}" || echo "${}"
  #rm -f "${_bindir}"/* # We download the cups driver only to throw it all away. All I want is the dir name without hunting for it in the installer.
  #local _basedir="${srcdir}/${_brsource}"
  #test -d "${_basedir}" || echo "${}"
  #cd "${_basedir}/cupswrapper" 2>/dev/null || cd "${_basedir}/scripts" 2>/dev/null || cd "${_basedir}"
  local _wrapdir="$(pwd)"
  cd "${_wrapdir}"
  local _wrapper_source="$(echo cupswrapper${_brotherund}*)"
  if ! test -f "${_wrapper_source}"; then
    _wrapper_source="$(echo cupswrapper*290*)"
    test -f "${_wrapper_source}" || echo "${}"
    bsdtar -xf "${_wrapper_source}"
    cd cupswrapper*/
    _basedir="${PWD}"
    cd 'SCRIPT'
    _wrapdir="${PWD}"
    _wrapper_source=(cupswrapper*); _wrapper_source="${_wrapper_source[0]}"
    cd ../..
  fi
  #cd "${_basedir}"/brcups*
  #local _makedir="$(pwd)"
  #if cd "${_basedir}/PPD" 2>/dev/null || cd "${_basedir}/ppd" 2>/dev/null; then
  #  local _ppddir="$(pwd)"
  #fi

if ! :; then
  # Source is available for the cups binary, not the lpr binaries so we can't
  # get away from multilib. Any usage of /opt is hardcoded into some binaries
  # for which we can't find an equal length replacement so we can't easily get
  # rid of that either.
  cd "${_makedir}"
  if [ -s 'Makefile' ]; then
    'ma''ke' -s
    cp -p 'brcupsconfpt1' "${_bindir}"
  else
    # gcc options are pulled from other Brother makefiles.
    gcc -pipe -Wall -W -O2 -s -o "${_bindir}/${_brcupsconf}" "brcupsconfig.c"
  fi

  # Some models supply the ppd in the install script
  cd "${_bindir}"
  if [ ! -z "${_ppddir:-}" ]; then
    # Use the ppd supplied in the source
    cp -p "${_ppddir}"/*.ppd "${_bindir}/"
    chmod 644 "${_bindir}"/*.ppd
  fi
fi

  # Some Brother installers create files here
  #mkdir -p "${srcdir}/var/tmp"

  # Fix lpr driver.
  sed -e '# Fix sbin reference' \
      -e 's:/sbin/:/bin/:g' \
      -e '#Fix hash bang' \
      -e 's:#/bin/sh:#!/bin/sh:g' \
    -i $(find "${srcdir}/usr" -type f -name 'psconvertij2')

  # personalize print config in /usr/bin to prevent conflicts with other printers
  mv "${srcdir}/usr/bin/brprintconfij2" "${srcdir}/usr/bin/brprintconfij2${_brotherund}"
  sed -e "s:brprintconfij2:brprintconfij2${_brotherund}:g" -i "${_wrapper_source}"

  # Fix page shifted off center that affects some printers
  # Letter prints off center shifted down and right with PaperType=A4
  # I can only test printing A4 on Letter paper. A4 appears to print correctly with PaperType=Letter
  #sed -e 's:^\(PaperType\)=.\+$:\1=Letter:g' -i "${_rcfile}"

  # Modify the installer so we can finish the install here in PKGBUILD.
  #cp -p "${_wrapdir}/${_wrapper_source}" "${_bindir}/"
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
      -e '#s: $errorcode: \\$errorcode:g' \
      -e '# This printer requires the permissions fix that isnt multi user compatible.' \
      -e 's:/usr/local/Brother:/usr/share/brother:g' \
      -e '/cups restart/ s:^:true :g' \
    -i "${_wrapper_source}"
  grep -lq "#Arch Linux Compatible$" "${_wrapper_source}" || echo "${}"
  test -f "${_wrapper_source}.Arch" && echo "${}" # Halt for debugging
  # Generate PPD and wrapper. Use sh -x to debug
  # Possible bug: copying to /usr/share/ppd is disabled.
  _srcdir="${srcdir}" \
  tcsh "${_wrapper_source}" -i # set -e crashes early, bash set -u is always active
  chmod 644 "${srcdir}/usr/share/cups/model"/*.ppd # Some installers make ppd executable
  rm -rf "${srcdir}/var"

  # Remove srcdir from the generated wrapper file.
  # No paths in the generated ppd.
  sed -e '# Remove the ${_srcdir} variety' \
      -e 's:${_srcdir}::' \
      -e '# Remove the /home/... variety' \
      -e "s:${srcdir}::" \
      -e '# Remove surplus quotes' \
      -e 's:""/:/:g' \
    -i "${srcdir}/usr/lib/cups/filter"/*lpdwrapper*

  # We did everything in the installer so we can get rid of it.
  rm "${_wrapper_source}"

  cd "${srcdir}"
  # Misnamed printer does not sort or autodetect properly
  sed -e "s:Brother ${_brotherund} :Brother ${_brotheru} :g" -i 'usr/share/cups/model'/*.ppd

  # Check to see if the lpd wrapper is referenced by the ppd
  # Check to see if our compiled code is referenced by the lpd wrapper
  local _nppdfound=0
  local _ncodefound=0
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

  # ldd file not found if I change this. It's an old printer so shouldn't matter much.
  local _f1='libbrcompij2'
  local _f2='libbrmfc420c'

  # Execute LPR POSTIN. These libs will probably cause a conflict with other printers.
  #mv "${pkgdir}/usr/lib/${_f1}.so.1.0.2" "${pkgdir}/usr/lib/${_f2}.so.1.0.2"
  grep -a 'ln -s' "${source[1]##*/}" | \
  sed -e 's:/usr/lib/::' \
      -e "s:/usr/lib/:${pkgdir}&:g" \
      -e '# Prevent lib conflicts with similar printers' \
      -e "#s:${_f1}:${_f2}:g" \
  | bash -e -u --
  #sed -e "s:${_f1}:${_f2}:g" -i "${pkgdir}/usr/share/brother/lpd/rastertobrij2"

  # /etc/printcap is managed by cups. This eliminates any need for a printcap helper.
  rm -f "`find "${pkgdir}" -type f -name 'setupPrintcap*'`"

  # Ensure we got a ppd and a filter for CUPS
  test "$(find "${pkgdir}/usr/share/cups/model" -type f -name '*.ppd')"
  test "$(find "${pkgdir}/usr/lib/cups/filter/" -type f)"

  # Ensure there are no forbidden paths
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

  install -Dpm644 'cupswrapper-license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 'lpr-license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
