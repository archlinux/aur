# The cups binary is 64 bit. Until Brother releases source for the 32 bit lpr
# binary blobs, 64 bit users must enable multilib.

# This has not been tested with non cups lprng.

set -u
_brotheru='MFC-J985DW'
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
pkgname="brother-${_brotherl}"
pkgver='1.0.0'
pkgrel='0'
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
optdepends=(
  'ttf-dejavu: Printing text files from lpr'
  'brscan4: Scanner support'
)
# The cups wrapper uses the lpr driver.
_brsource="${_brotherlnd}_cupswrapper_GPL_source_${pkgver}-${pkgrel}"
source=(
  "https://download.brother.com/welcome/dlf102747/${_brotherlnd}cupswrapper-$pkgver-$pkgrel.i386.rpm"
  "https://download.brother.com/welcome/dlf102746/${_brotherlnd}lpr-$pkgver-$pkgrel.i386.rpm"
  "https://download.brother.com/welcome/dlf102750/${_brsource}.tar.gz"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
md5sums=(
  '4f1c504c42e457771f4398cda38759a4'
  '564727c54c3691a630cc172f7e086aa0'
  '1e2b3fe6939096730c2d7f150e23ea66'
  '97ad0cffd216059e9d1d3121899d8646'
  '5e87a3dc0f3e3438c088eda0f3565f0d'
)

build() {
  set -u
  # Do not Install in '/usr/local'. Does not apply to all Brother models.
  # This may modify binary blobs which only
  # works when the old and new strings are exactly the same length.
  if [ -d "${srcdir}/usr/local/Brother" ]; then
    install -dm755 "${srcdir}/usr/share"
    mv "${srcdir}/usr/local/Brother/" "${srcdir}/usr/share/brother"
    rm -rf "${srcdir}/usr/local"
    sed -i -e 's:/usr/local/Brother:/usr/share/brother:g' $(grep -lr '/usr/local/Brother' ./)
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
  rm -f "${_bindir}"/* # We download the cups driver only to throw it all away. All I want is the dir name without hunting for it in the installer.
  local _basedir="${srcdir}/${_brsource}"
  test -d "${_basedir}" || echo "${}"
  cd "${_basedir}/cupswrapper" 2>/dev/null || cd "${_basedir}/scripts" 2>/dev/null || cd "${_basedir}"
  local _wrapdir="$(pwd)"
  cd "${_wrapdir}"
  local _wrapper_source="$(echo cupswrapper${_brotherund}*)"
  if ! test -f "${_wrapper_source}"; then
    _wrapper_source="$(echo cupswrapper*)"
    test -f "${_wrapper_source}" || echo "${}"
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
    make -s
    cp -p 'brcupsconfpt1' "${_bindir}"
  else
    # Not sure why it's called brcupsconfig3 some places and brcupsconfig4 in others.
    # The version in their binary matches the version in the source so it looks good to me.
    # gcc options are pulled from other Brother makefiles.
    gcc -pipe -Wall -W -O2 -s -o "${_bindir}/brcupsconfig3" "brcupsconfig.c"
  fi

  cd "${_bindir}"
  if [ ! -z "${_ppddir:-}" ]; then
    # Use the ppd supplied in the source
    cp -p "${_ppddir}"/*.ppd "${_bindir}/"
    chmod 644 "${_bindir}"/*.ppd
  fi

  # Some Brother installers create files here
  mkdir -p "${srcdir}/var/tmp"

  # Fix any sbin reference in the lpr driver. The cups driver uses bin.
  #sed -i -e 's:/sbin/:/bin/:g' $(find "${srcdir}/usr" -type f -name "psconvert2")

  # Fix page shifted off center that affects some printers
  # Letter prints off center shifted down and right with PaperType=A4
  # I can only test printing A4 on Letter paper. A4 appears to print correctly with PaperType=Letter
  sed -i -e 's:^\(PaperType\)=.\+$:\1=Letter:g' "${_rcfile}"

  # Modify the installer so we can finish the install here in PKGBUILD.
  cp -p "${_wrapdir}/${_wrapper_source}" "${_bindir}/"
  #cp -p "${_wrapper_source}" "${_wrapper_source}.Arch" # debug: diff compare with Total Commander
  sed -i -e '# Install to _srcdir. Some folders may not apply to this model.' \
         -e 's:/usr:${_srcdir}&:g' \
         -e 's:/opt:${_srcdir}&:g' \
         -e 's:/var:${_srcdir}&:g' \
         -e "# Stop the Install script after the files are generated. cups doesn't require a reload to see the printer driver." \
         -e 's:^if \[ -e /etc/init:exit 0 #Arch Linux Compatible\n&:g' \
    "${_wrapper_source}"
  grep -lq "#Arch Linux Compatible" "${_wrapper_source}" || echo "${}"
  test -f "${_wrapper_source}.Arch" && echo "${}" # Halt for debugging
  # Generate PPD and wrapper. Use sh -x to debug
  # Possible bug: copying to /usr/share/ppd is disabled.
  export _srcdir="${srcdir}"
  sh -e "${_wrapper_source}" -i
  unset _srcdir

  rm -rf "${srcdir}/var"

  # Remove srcdir from the generated wrapper file.
  # No paths in the generated ppd.
  sed -i -e '# Remove the ${_srcdir} variety' \
         -e 's:${_srcdir}::' \
         -e '# Remove the /home/... variety' \
         -e "s:${srcdir}::" "${srcdir}/usr/lib/cups/filter/"*lpdwrapper*

  # We did everything in the installer so we can get rid of it.
  rm -f "${_wrapper_source}"
  set +u
}

package() {
  set -u
  local _dir
  # /var/spool is not used anywhere in this package. Maybe it's needed for non cups lprng.
  for _dir in usr opt; do # var
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
  grep -alqr "/sbin" "${pkgdir}" && echo "${}"
  grep -alqr "/usr/tmp" "${pkgdir}" && echo "${}"

  install -Dm644 'cupswrapper-license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
  install -Dm644 'lpr-license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/lpr-licence.txt"
  set +u
}
set +u
