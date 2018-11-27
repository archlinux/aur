# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnick='STP-103II'
pkgname="bixolon-${_pkgnick,,}"
pkgver='1.0.0'; _dl='20121116155942'
pkgrel='1'
pkgdesc="LPR and CUPS driver for Bixolon Samsung ${_pkgnick} POS thermal receipt printer"
arch=('i686' 'x86_64')
url='http://www.bixolon.com/html/en/download/download_list.xhtml'
license=('custom')
depends=('cups')
depends_x86_64=('lib32-glibc' 'lib32-libcups')
_bxl='http://www.bixolon.com/upload/download'
if ! :; then
  _pdfs=(
    'manual_linux%20cups%20driver%20install_en_v1.0.0.pdf'
  )
  for _pdf in "${_pdfs[@]}"; do
    source+=("${_pdf//%20/_}::${_bxl}/${_pdf}")
  done
  unset _pdf _pdfs
fi
_srcdir="${_pkgnick}_V${pkgver//_/.}"
source+=("${_bxl}/${_srcdir,,}_${_dl}.zip")
_srcdir+='/Std_Linux'
_setup="setup_v${pkgver//_/.}.sh"
md5sums=('c36545ef465ce0f0be35f8a0e332614b')
sha256sums=('4e418e0f51d97b987f8a51854a36e025df705a13a0562a45d3951a76d425e2b0')

_uagent='Mozilla'
_uagent='Mozilla/5.0 (X11; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0'
DLAGENTS=("${DLAGENTS[@]//curl -/curl -A '${_uagent}' -}")

prepare() {
  set -u
  cd "${_srcdir}"

  chmod 644 *.ppd

  # Make installer package compatible
  #cp "${_setup}"{,.Arch}
  sed -e '# Run as user' \
      -e 's:\$UID:$ROOT_UID:g' \
      -e 's:\bsudo ::g' \
      -e '# Remove Gentoo check' \
      -e 's:^\(LINUX_CHECK\)=.*$:\1=0:g' \
      -e '# Remove cups version check' \
      -e 's:^\(CUPSVER\)=.*$:\1=Arch:g' \
      -e '# Package folders' \
      -e 's: /etc/: "${_pkgdir}"/etc/:g' \
      -e 's: /usr/: "${_pkgdir}"/usr/:g' \
      -e '# Add pkgdir to some symlinks' \
      -e 's:--target-directory=:&"${_pkgdir}":g' \
      -e '# Remove pkgdir from symlinks' \
      -e '/ln / s: "${_pkgdir}"/usr/: /usr/:' \
      -e '# chmod target instead of symlink' \
      -e 's:chmod .*\${LIBPATH}.*rasterto:# &:g' \
      -e 's:chmod .*/lib/.*rasterto:# &:g' \
      -e '# Eliminate service lines' \
      -e 's:^\s*service\s:# &:g' \
      -e '# Eliminate restarts' \
      -e '/Restarting CUPS/ s:^:exit 0 # Arch Compatible\n&:g' \
    -i "${_setup}"
  grep -qe 'Arch Compatible$' "${_setup}" || echo "${}"
  test ! -s "${_setup}.Arch" || echo "${}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/cups/filter/" "${pkgdir}/usr/share/cups/model/"

  _pkgdir="${pkgdir}" \
  sh -e -u "${_setup}"

  chmod 644 "${pkgdir}/usr/share/cups/model"/*.ppd
  set +u
}
set +u
