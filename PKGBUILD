# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnick='SRP-275III'
pkgname="bixolon-${_pkgnick,,}"
pkgver='1.0.1'
pkgrel='1'
pkgdesc="LPR and CUPS driver for Bixolon Samsung ${_pkgnick} POS thermal receipt printer"
arch=('i686' 'x86_64')
url='http://www.bixolon.com/html/en/download/download_list.xhtml'
license=('custom')
depends=('cups')
declare -A _arch=([i686]='x86' [x86_64]='x64')
_bxl='http://www.bixolon.com/upload/download'
if ! :; then
  _pdfs=(
    'manual_linux%20cups%20driver%20install_kr_v1.0.0.pdf'
    'manual_linux%20cups%20driver%20install_en_v1.0.0.pdf'
  )
  for _pdf in "${_pdfs[@]}"; do
    source+=("${_pdf//%20/_}::${_bxl}/${_pdf}")
  done
  unset _pdf _pdfs
fi
_srcdir="Software_${_pkgnick//-/}_Linux_v${pkgver//_/.}"
_fx="${_srcdir,,}_x86.tgz"
source_i686=("${_fx//.tgz/.tar}::${_bxl}/${_fx}")
_fx="${_srcdir,,}_x64.tgz"
source_x86_64=("${_fx//.tgz/.tar}::${_bxl}/${_fx}")
_srcdir+="_${_arch[${CARCH:-i686}]}"
_setup="setup_v${pkgver//_/.}.sh"
_setup='setup_v1.0.0.sh'
md5sums_i686=('c25a5da37c2b1ad16c990b264c6ee670')
md5sums_x86_64=('2a635372a3a1ab081d69e63879d953f7')
sha256sums_i686=('13aff2f679a821a5765106b1a94f224c2990dd55ccc16d515ff6e46624a8583b')
sha256sums_x86_64=('cf4dda0dd2c58310af3009904b84f6921e5d006c04f8ce267e96869602863398')

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
