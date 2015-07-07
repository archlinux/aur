# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: giacomo giacomogiorgianni gmail
# Contributor: brenton <brenton taylorbyte com>
# Category: system

# There's a new generic lpr driver 3.1.0-1 available but it looks like some
# work to get it compatible with the cups driver.

# The cups binary is 64 bit. Until Brother releases source for the 32 bit lpr
# binary blobs, 64 bit users must enable multilib.

# This has not been tested with non cups lprng.

# NOTE 1: Remember to add user to lp group using
# gpasswd -a USER lp
# NOTE 2: Remember to logout after adding groups
# NOTE 3: Set each printer default Media Size to Letter with
# lpadmin -p BR7360 -o media=Letter

set -u
pkgname='brother-mfc7360n'
_printername='MFC7360N'
pkgver='2.0.4'
_lprpkgver='2.1.0'
pkgrel='2'
pkgdesc="CUPS and LPR driver for Brother ${_printername} printer"
arch=('i686' 'x86_64')
url='http://solutions.brother.com/linux/en_us/'
license=('custom:Brother Industries')
depends=('cups' 'ghostscript' 'psutils' 'a2ps' 'sed' 'grep')
# gs: lpr rendering
# pdf2ps: cups rendering
# a2ps: rendering ascii text files
# pstops: pdf resizing
# psnup: printing n-up pages
# sed grep
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
# Printing a text file fails when Liberation is the only TrueType font available
optdepends=('ttf-dejavu: printing text files from lpr')
#install="${pkgname}.install"
# The cups wrapper uses the lpr driver.
source=(
  "http://download.brother.com/welcome/dlf006760/brmfc7360ncups_src-${pkgver}-${pkgrel}.tar.gz"
  "http://download.brother.com/welcome/dlf006238/cupswrapper${_printername}-${pkgver}-${pkgrel}.i386.rpm"
  "http://www.brother.com/pub/bsc/linux/dlf/mfc7360nlpr-${_lprpkgver}-1.i386.rpm"
  #"http://download.brother.com/welcome/dlf101124/brgenml1lpr-3.1.0-1.i386.rpm"
)
sha256sums=('0330ea2d74627026736842beade0b504816265cdd61b1b1b49a234a1e2c8011c'
            '358e37e1d8cfdce25b1ebe17f21fd2cf3abcdc45263c7e007e36c8be74ae2fbf'
            'b3ffe2e882d08763795e2cc18b35e724e5157a57edf6c76696401c4c810af3a9')

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
  local _bindir="$(find "${srcdir}/usr" -type d -name 'cupswrapper')"
  test -d "${_bindir}" # die if blank or invalid before we rm something we don't want to
  rm -f "${_bindir}"/* # We download the cups driver only to throw it all away. All I want is the dir name without hunting for it in the installer.
  local _basedir="$(find "${srcdir}" -maxdepth 1 -type d -name '*cups_src*')" # find avoids the link from PKGBUILD
  test -d "${_basedir}"
  local _wrapdir="${_basedir}" # /cupswrapper"
  test -d "${_wrapdir}"
  cd "${_wrapdir}"
  local _wrapper_source="$(echo cupswrapper*)"
  test -f "${_wrapper_source}"
  cd "${_basedir}"/brcups*
  local _makedir="$(pwd)"

  # Source is available for the cups binary, not the lpr binaries
  # braddprinter brprintconflsr3 rawtobr3 so we can't get away from multilib
  # Not sure why it's called brcupsconfig3 some places and brcupsconfig4 in others.
  # The version in their binary matches the version in the source so it looks good to me.
  # Brother forgot the makefile so I pulled some make options from mfc-j870dw
  cd "${_makedir}"
  gcc -pipe -Wall -W -O2 -s -o "${_bindir}/brcupsconfig4" "brcupsconfig.c"

  cd "${_bindir}"
  # Fix an sbin reference in the lpr driver. The cups driver uses bin.
  sed -i -e 's:/sbin/:/bin/:g' $(find "${srcdir}/usr" -type f -name "psconvert2")

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

  # I'd like to add a dash to MFC7360N but that could invalidate a lot of cups 
  # settings and documents and make us different from other distros.

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

  # Change mode to avoid warning on reinstall
  # This is no longer necessary. Running the installer here in PKGBUILD sets
  # the proper permissions for the package.
  #install -d -m777 "${pkgdir}/usr/local/Brother/inf/"
  # It looks like this is so everyone can write to brMFC7360Nrc (brPRINTERrc)
  # I suspect this isn't safe for multiple users.
  set +u
}
set +u
