# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnick='BxlLabel'
pkgname="bixolon-${_pkgnick,,}"
pkgver='1.1.3'
pkgrel='1'
pkgdesc='LPR and CUPS driver for Bixolon Samsung SLP D220 D223 D420 D423 DL410 DL413 DX220 DX223 DX420 DX423 T400 T403 TX220 TX223 TX400 TX403 TX420 TX423 SPP L300 SRP E770III POS mobile direct thermal transfer label printer'
arch=('i686' 'x86_64')
url='http://www.bixolon.com/html/en/download/download_list.xhtml'
license=('custom')
depends=('cups')
declare -A _arch=([i686]='x86' [x86_64]='x64')
_bxl='http://www.bixolon.com/upload/download'
if ! :; then
  _pdfs=(
    'manual_linux%20cups%20driver%20installation%20guide_english_rev_1_01.pdf'
    'manual_linux%20cups%20driver%20installation%20guide_korean_rev_1_01.pdf'
    'manual_cups%20ethernet%20setting_v1.0.0.pdf'
  )
  for _pdf in "${_pdfs[@]}"; do
    source+=("${_pdf//%20/_}::${_bxl}/${_pdf}")
  done
  unset _pdf _pdfs
fi
_srcdir="Software_${_pkgnick}CupsDrv_Linux_v${pkgver//_/.}"
_fx="${_srcdir,,}_x86.tgz"
source_i686=("${_fx//.tgz/.tar}::${_bxl}/${_fx}")
_fx="${_srcdir,,}_x64.tgz"
source_x86_64=("${_fx//.tgz/.tar}::${_bxl}/${_fx}")
_srcdir+="_${_arch[${CARCH:-i686}]}"
_setup="setup_v${pkgver//_/.}.sh"
md5sums_i686=('1f8800a4c30b3c0a0aa6f0b2dcce6fe3')
md5sums_x86_64=('680379bc35cd48ea4e2a701df6e798a5')
sha256sums_i686=('c99ff022d30564931b7f3417d4f6996c45deea1fe0acc0727b1d28e4147c060c')
sha256sums_x86_64=('ddf502d53ad6356253af486f0bf3fdf91310ef0956448b16068477143c7028ba')

_uagent='Mozilla'
_uagent='Mozilla/5.0 (X11; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0'
DLAGENTS=("${DLAGENTS[@]//curl -/curl -A '${_uagent}' -}")

prepare() {
  set -u
  cd "${_srcdir}"

  chmod 644 Bixolon/*.ppd

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

  chmod 644 "${pkgdir}/usr/share/cups/model/Bixolon"/*.ppd
  set +u
}
set +u
