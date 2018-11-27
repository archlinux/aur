# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnick='Bixolon'
pkgname='bixolon-unified'
pkgver='1.3.7_1'
pkgrel='1'
pkgdesc='LPR and CUPS driver for Bixolon Samsung SPP R200III R210 R300 R310 R318 R400II R410 R418 SRP 330II 340II 342II 350III 350IIK plusIII 352III 370 380 382 F310II F312II F313II Q300 Q302 QE300 QE302 S300 STP-103III POS mobile thermal receipt printer'
arch=('i686' 'x86_64')
url='http://www.bixolon.com/html/en/download/download_list.xhtml'
license=('custom')
depends=('cups')
declare -A _arch=([i686]='x86' [x86_64]='x64')
_bxl='http://www.bixolon.com/upload/download'
if ! :; then
  _pdfs=(
    'manual_linux%20cups%20driver%20install_en_v1.0.0.pdf'
    'manual_linux%20cups%20driver%20install_kr_v1.0.0.pdf'
    'manual_cups%20ethernet%20setting_v1.0.0.pdf'
  )
  for _pdf in "${_pdfs[@]}"; do
    source+=("${_pdf//%20/_}::${_bxl}/${_pdf}")
  done
  unset _pdf _pdfs
fi
_srcdir="Software_${_pkgnick}CupsDrv_Linux_v${pkgver//_/.}"
source_i686=("${_bxl}/${_srcdir,,}_x86.tar.gz")
source_x86_64=("${_bxl}/${_srcdir,,}_x64.tar.gz")
_srcdir+="_${_arch[${CARCH:-i686}]}"
_setup="setup_v${pkgver//_/.}.sh"
md5sums_i686=('cb61c9a373951774d53d81eea25eaf77')
md5sums_x86_64=('5aefcaeacc7a388287d2c2b7028dcbf5')
sha256sums_i686=('9c4483f46b8d47d54cd5f4227e0ebc9572e847bee9e76975de0eb6389b8d10c5')
sha256sums_x86_64=('2b503a1eb84944d01618f4d5fff77d762de49435fe6357b959c35b8e155839db')

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
