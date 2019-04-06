# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Michael Duell <michael.duell@rub.de> (akurei)
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

set -u
pkgname='html2ps'
pkgver='1.0b7'
pkgrel='7'
pkgdesc='An HTML to PostScript converter written in Perl.'
arch=('any')
#url='http://user.it.uu.se/~jan/html2ps.html'
url='https://linux.die.net/man/1/html2ps'
license=('GPL2')
depends=('ghostscript' 'perl' 'texlive-bin')
options=('!strip')
source=(
  #"http://user.it.uu.se/~jan/html2ps-${pkgver}.tar.gz"
  "https://fossies.org/linux/www/old/html2ps-${pkgver}.tar.gz"
)
md5sums=('073ab8a239c8d0e3547192ee9016db15')
sha1sums=('20d508817803af08e397794d4986046ee8128b5c')
sha256sums=('d553980468a14bae738982c384c17f426ecf77dafd9a4e2499d520953f156f14')
sha384sums=('e1c95370257b22f408848914b56703334ee0f1ef7683b045bbef67142a7577fc5a8c3fba0790fd90a380dcdf4f5c5eb7')

package() {
  set -u
  local _script="${srcdir}/${pkgname}-${pkgver}/${pkgname}"

  # Fixes Bug: https://bugzilla.redhat.com/show_bug.cgi?id=822117
  sed -e '/^  local($\[)=0;$/d' -i "${_script}"

  # Set some variables in the script
  sed -e "s#/it/sw/share/www/lib/html2ps/html2psrc#/etc/html2psrc#g" -i "${_script}"
  sed -e "s#/opt/misc/lib/html2ps/html2psrc#/etc/html2psrc#g" -i "${_script}"
  sed -e "s#/opt/misc/lib/html2ps/html2ps.html#/usr/share/html2ps/html2ps.html#g" -i "${_script}"
  sed -e "s#Ghostscript: 0;#Ghostscript: 1;#g" -i "${_script}"
  sed -e "s#TeX: 0;#TeX: 1;#g" -i "${_script}"
  sed -e 's# file: "";# file: "/usr/share/texmf/tex/generic/hyphen/hyphen.tex";#g' -i "${_script}"

  install -Dpm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/sample" "${pkgdir}/etc/html2psrc"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/sample" "${pkgdir}/usr/share/${pkgname}/etc/html2psrc-sampleconfig"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}rc.5" -t "${pkgdir}/usr/share/man/man5/"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.html" -t "${pkgdir}/usr/share/${pkgname}/"
  set +u
}
set +u
