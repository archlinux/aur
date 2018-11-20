# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: electricprism
# Contributor: mrshannon Michael R. Shannon

_opt_DEB=0

set -u
_brothern='8610'
_brotheru="MFC-L${_brothern}CDW"
_brotherl="${_brotheru,,}"     # mfc-0000dw
_brotherlnd="${_brotherl//-/}" # mfc0000dw
_brotherund="${_brotheru//-/}" # MFC0000DW
pkgname="brother-${_brotherl}"
_lprver='1.2.0_0'
_cupver='1.3.0_0'
pkgver="${_cupver}"
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_brotheru} printer"
arch=('i686' 'x86_64')
url='https://support.brother.com/g/s/id/linux/en/index.html'
license=('GPL' 'custom')
depends=('cups' 'ghostscript' 'sed' 'grep')
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
  'brscan4: Scanner support'
)
options=('!strip')
#install="${pkgname}.install"
_dlf="http://www.brother.com/pub/bsc/linux"
source=(
  "${_brotherlnd}.inf::${_dlf}/infs/${_brotherund}" # A crc change lets us know that the driver has been updated
  "${_dlf}/packages/${_brotherlnd}lpr-${_lprver//_/-}.i386.rpm"
  "${_dlf}/packages/${_brotherlnd}cupswrapper-${_cupver//_/-}.i386.rpm"
  #"${_dlf}/${_brsource}.tar.gz"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
if [ "${_opt_DEB}" -ne 0 ]; then
  noextract=(
    "${_dlf}/packages/${_brotherlnd}lpr-${_lprver//_/-}.i386.deb"
    "${_dlf}/packages/${_brotherlnd}cupswrapper-${_cupver//_/-}.i386.deb"
  )
  source[1]="${noextract[0]}"
  source[2]="${noextract[1]}"
  noextract=("${noextract[@]##*/}")
fi
md5sums=('1e2ab322f58952141132468b99d4cbe8'
         '6ea8b62f22f94f38ba2df13a19e15d1e'
         '8af6a0c5eb4a23bdd91db500fcd32576'
         'e42487a541573287fad544bafd1766c6'
         '4f14b328317aac0d22c7f7f73c581628')
sha256sums=('5a23a54cf9e71d2738240f7277e1192d06bd74cc6727f103ede956afef3461e5'
            '27211c779effea39d5622f0683629faf44d7f62a4fee48b7ef3cc1935a00cde9'
            '0d54d2985bccf4c2790573d15ce0a38ea47e83d58aeffd4b05000e36dff64653'
            '65de8004f8d44a96b62f874a26a80b285f7f6b9f37a8b6c628d094e7f1986b2a'
            'b604def129534d245fa576f8cd7d01df1d2856b9bff6c1d2002404f77f7d4bb3')

prepare() {
  set -u

  shopt -s nullglob
  local _deb
  for _deb in *.deb; do
    mkdir 'debextract'
    bsdtar -C 'debextract' -xf "${_deb}"
    bsdtar -xf debextract/data.tar.?z
    rm -r 'debextract'
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
  local _basedir="opt/brother/Printers/${_brotherlnd}"
  local _wrapper_source="${_basedir}/cupswrapper/cupswrapper${_brotherlnd}"
  test -s "${_wrapper_source}" || echo "${}"

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
  grep -lq "#Arch Linux Compatible$" "${_wrapper_source}" || echo "${}"
  test -f "${_wrapper_source}.Arch" && echo "${}" # Halt for debugging
  # Generate PPD and wrapper. Use sh -x to debug
  # Possible bug: copying to /usr/share/ppd is disabled.
  _srcdir="${srcdir}" \
  sh -u -e "${_wrapper_source}" -i
  local _ppdir='usr/share/cups/model/Brother'
  chmod 644 "${_ppdir}"/*.ppd # Some installers make ppd executable
  rm -rf 'var'

  local _wrapgen="${_basedir}/cupswrapper/brother_lpdwrapper_${_brotherlnd}"
  test -s "${_wrapgen}" || echo "${}"

  # Remove srcdir from the generated wrapper file.
  sed -e '# Remove the /home/... variety' \
      -e "s:${srcdir}::" \
    -i "${_wrapgen}"

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
  test ! -z "$(find "${pkgdir}/usr/share/cups/model" -type 'f' -name '*.ppd')" || echo "${}"
  test ! -z "$(find "${pkgdir}/usr/lib/cups/filter/" '(' -type 'f' -o -type 'l' ')')" || echo "${}"

  # Ensure there are no forbidden paths
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

  install -Dpm644 'cupswrapper-license.txt' 'lpr-license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
