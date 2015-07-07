# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: libernux dutchman55 gmx com
# Category: system

# The cups binary is 64 bit. Until Brother releases source for the 32 bit lpr
# binary blobs, 64 bit users must enable multilib.

# This has not been tested with non cups lprng.

set -u
pkgname='brother-mfc-j870dw'
pkgver='3.0.0'
pkgrel='1'
pkgdesc='LPR and CUPS driver for the Brother MFC-J870DW'
arch=('i686' 'x86_64')
url='http://solutions.brother.com/linux/en_us/'
license=('custom:Brother Industries')
depends=('cups' 'ghostscript' 'psutils' 'a2ps' 'sed' 'grep')
# gs: lpr rendering
# pdf2ps: cups rendering
# a2ps: rendering ascii text files
# (not) pstops: pdf resizing
# psnup: printing n-up pages
# sed grep
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
# Printing a text file fails when Liberation is the only TrueType font available
optdepends=('ttf-dejavu: printing text files from lpr')
#install="${pkgname}.install"
# The cups wrapper uses the lpr driver.
source=(
  "http://www.brother.com/pub/bsc/linux/dlf/mfcj870dwlpr-${pkgver}-${pkgrel}.i386.rpm"
  "http://www.brother.com/pub/bsc/linux/dlf/mfcj870dwcupswrapper-${pkgver}-${pkgrel}.i386.rpm"
  "http://download.brother.com/welcome/dlf006869/mfcj870dw_cupswrapper_GPL_source_${pkgver}-${pkgrel}.tar.gz"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
sha256sums=('70e8c16f1aea8a47bbbcca3dbc8230b6982f2d8565d515b8344eca065c9b7d30'
            'ee97c1ad72ecd510a9f12024ed85b738dd71a06e36e5083466411e48046f7ce0'
            'e8bf7663a58ebe2fd0b32a4ec6a19ed6ed82c12086cab401dc1d46aff903bd75'
            '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')

if [ "${CARCH:-}" = 'x86_64' ]; then
  # This will error out if multilib isn't enabled
  depends+=('lib32-glibc')
fi

prepare() {
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
  local _bindir="$(find "${srcdir}/opt" -type d -name 'cupswrapper')"
  test -d "${_bindir}" # die if blank or invalid before we rm something we don't want to
  rm -f "${_bindir}"/* # We download the cups driver only to throw it all away. All I want is the dir name without hunting for it in the installer.
  local _basedir="$(find "${srcdir}" -maxdepth 1 -type d -name '*cupswrapper_GPL_source*')" # find avoids the link from PKGBUILD
  test -d "${_basedir}"
  local _wrapdir="${_basedir}/cupswrapper"
  test -d "${_wrapdir}"
  cd "${_wrapdir}"
  local _wrapper_source="$(echo cupswrapper*)"
  test -f "${_wrapper_source}"
  cd "${_basedir}"/brcups*
  local _makedir="$(pwd)"

  # Source is available for the cups binary, not the lpr binaries
  # brprintconf or brmfcj870dwfilter so we can't get away from multilib.
  # /opt is hardcoded into brmfcj870dwfilter so we can't easily get rid of that 
  # either.
  cd "${_makedir}"
  make -s
  cp -p 'brcupsconfpt1' "${_bindir}"

  cd "${_bindir}"
  # Use the supplied ppd
  cp -p "${_basedir}/PPD"/*.ppd "${_bindir}/"
  chmod 644 "${_bindir}"/*.ppd

  # This installer creates one of the files here
  mkdir -p "${srcdir}/var/tmp"

  # Modify the installer so we can finish the install here in PKGBUILD.
  cp -p "${_wrapdir}/${_wrapper_source}" "${_bindir}/"
  #cp -p "${_wrapper_source}" "${_wrapper_source}.Arch" # debug: diff compare with Total Commander
  sed -i -e '# Install to _srcdir. Some folders may not apply to this model.' \
         -e 's:/usr:${_srcdir}&:g' \
         -e 's:/opt:${_srcdir}&:g' \
         -e 's:/var:${_srcdir}&:g' \
         -e "# Stop the Install script after the files are generated. cups doesn't require a reload to see the printer driver." \
         -e 's:^if \[ -e /etc/init:exit 0\n&:g' \
    "${_wrapper_source}"
  # Generate PPD and wrapper
  # Possible bug: copying to /usr/share/ppd is disabled.
  export _srcdir="${srcdir}"
  sh "${_wrapper_source}" -i
  unset _srcdir

  rmdir "${srcdir}/var/tmp" "${srcdir}/var"

  # Remove srcdir from the generated wrapper file.
  # No paths in the generated ppd.
  sed -i -e '# Remove the ${srcdir} variety' \
         -e 's:${srcdir}::' \
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

  install -Dm644 'cupswrapper-license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
  install -Dm644 'lpr-license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/lpr-licence.txt"
  set +u
}
set +u
