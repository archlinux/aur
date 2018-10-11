# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

# TODO: Test page left and bottom edges disappear.

# The cups binary is 64 bit. Until Brother releases source for the 32 bit lpr
# binary blobs, 64 bit users must enable multilib.

# This has not been tested with non cups lprng.

# NOTE 1: Remember to add user to lp group using
# gpasswd -a USER lp
# NOTE 2: Remember to logout after adding groups
# NOTE 3: Set each printer default Media Size to Letter with
# lpadmin -p BR7360 -o media=Letter

set -u
_brothern='990'
_brotheru="MFC-${_brothern}CW"
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
pkgname="brother-${_brotherl}"
pkgver='1.1.2_2'
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='http://www.brother.com/'
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
_brsource="brcups_ink4_src_${pkgver%_*}-x"
_dlf="http://www.brother.com/pub/bsc/linux/dlf"
source=(
  "${_dlf}/${_brotherlnd}lpr-${pkgver//_/-}.i386.rpm"
  "${_dlf}/${_brotherlnd}cupswrapper-${pkgver//_/-}.i386.rpm"
  "${_dlf}/${_brsource}.tar.gz"
  'lpr-license.txt'
)
sha256sums=('de984c4d72620745ae6b5efcabb5498a2de3d0da5fb1eba0db13260c59e59b22'
            '883b4771f52ca5272663b58d2c376181f12b4f984a362bc335503a0f89836c04'
            'ee009db6e216b23901704fc5a2bd7de7d48337f27c84adbc3e413d9bbe782ff3'
            'b604def129534d245fa576f8cd7d01df1d2856b9bff6c1d2002404f77f7d4bb3')

prepare() {
  set -u
  # Do not Install in '/usr/local'. Does not apply to all Brother models.
  # This may modify binary blobs which only
  # works when the old and new strings are exactly the same length.
  if [ -d 'usr/local/Brother' ]; then
    install -d 'usr/share'
    mv 'usr/local/Brother' 'usr/share/brother'
    rmdir 'usr/local'
    sed -e 's:/usr/local/Brother:/usr/share/brother:g' -i $(grep -lare '/usr/local/Brother' ./)
  fi

  # setup cups-directories
  install -d 'usr/lib/cups/filter'
  install -d 'usr/share/cups/model'
  #install -dm755 "${srcdir}/usr/share/ppd" # For cups we don't need the ppd file here.
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
  local _bindir
  _bindir="$(find "`pwd`" -type 'd' -name 'cupswrapper')"
  test -d "${_bindir}" || echo "${}" # die if blank or invalid before we rm something we don't want to
  pushd "${_bindir}" > /dev/null
  local _brcupsconf=(brcupsconf*); _brcupsconf="${_brcupsconf[0]}"
  test -x "${_brcupsconf}" || echo "${}"
  rm -f "${_bindir}"/* # We download the cups driver only to throw it all away. All I want is the dir name without hunting for it in the installer.
  local _basedir="${srcdir}/${_brsource}"
  test -d "${_basedir}" || echo "${}"
  cd "${_basedir}/cupswrapper" 2>/dev/null || cd "${_basedir}/scripts" 2>/dev/null || cd "${_basedir}"
  local _wrapdir="$(pwd)"
  cd "${_wrapdir}"
  local _wrapper_source="$(echo cupswrapper${_brotherund}*)"
  if ! test -f "${_wrapper_source}"; then
    _wrapper_source="$(echo cupswrapper*${_brothern}*)"
    test -f "${_wrapper_source}" || echo "${}"
    bsdtar -xf "${_wrapper_source}"
    cd cupswrapper*/
    _basedir="${PWD}"
    cd 'SCRIPT'
    _wrapdir="${PWD}"
    _wrapper_source=(cupswrapper*); _wrapper_source="${_wrapper_source[0]}"
    cd ../..
  fi
  cd "${_basedir}"/brcups*
  local _makedir="$(pwd)"
  if cd "${_basedir}/PPD" 2>/dev/null || cd "${_basedir}/ppd" 2>/dev/null; then
    local _ppddir="$(pwd)"
  fi

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

  # Some Brother installers create files here
  #mkdir -p "${srcdir}/var/tmp"

  # Fix lpr driver.
  true sed -e '# Fix sbin reference' \
      -e 's:/sbin/:/bin/:g' \
      -e '#Fix hash bang' \
      -e 's:#/bin/sh:#!/bin/sh:g' \
    -i $(find "${srcdir}/usr" -type f -name 'psconvert2')

  # Fix page shifted off center that affects some printers
  # Letter prints off center shifted down and right with PaperType=A4
  # I can only test printing A4 on Letter paper. A4 appears to print correctly with PaperType=Letter
  #sed -e 's:^\(PaperType\)=.\+$:\1=Letter:g' -i "${_rcfile}"

  # Modify the installer so we can finish the install here in PKGBUILD.
  cp -p "${_wrapdir}/${_wrapper_source}" "${_bindir}/"
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
      -e '/Nup=/ s:`:\\`:g' \
      -e 's: $errorcode: \\$errorcode:g' \
      -e '# This printer requires the permissions fix that isnt multi user compatible.' \
      -e 's:/usr/local/Brother:/usr/share/brother:g' \
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
    if grep -q "${_brcupsconf}" "${_lwrapper}"; then
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

  # /etc/printcap is managed by cups. This eliminates any need for a printcap helper.
  rm -f "`find "${pkgdir}" -type f -name 'setupPrintcap*'`"

  # Ensure we got a ppd and a filter for CUPS
  test "$(find "${pkgdir}/usr/share/cups/model" -type f -name '*.ppd')"
  test "$(find "${pkgdir}/usr/lib/cups/filter/" -type f)"

  # Ensure there are no forbidden paths
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

  install -Dpm644 <(sed -e 's:\r::g' "${_brsource}"/*/"Copying") "${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
  install -Dpm644 'lpr-license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/lpr-licence.txt"
  set +u
}
set +u
