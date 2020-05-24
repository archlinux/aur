# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Michael Duell <michael.duell@rub.de> (akurei)
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

set -u
pkgname='html2ps'
pkgver='1.0b7'
pkgrel='8'
pkgdesc='An HTML to PostScript converter written in Perl.'
arch=('any')
#url='http://user.it.uu.se/~jan/html2ps.html'
url='https://linux.die.net/man/1/html2ps'
license=('GPL2')
depends=('ghostscript' 'perl' 'texlive-bin')
options=('!strip')
_srcdir="${pkgname}-${pkgver}"
source=(
  #"http://user.it.uu.se/~jan/html2ps-${pkgver}.tar.gz"
  "https://fossies.org/linux/www/old/${_srcdir}.tar.gz"
  '0000-tmpname.patch'
)
md5sums=('073ab8a239c8d0e3547192ee9016db15'
         'af46fab28f1d32c6fc30e3e2bf09f19c')
sha256sums=('d553980468a14bae738982c384c17f426ecf77dafd9a4e2499d520953f156f14'
            '3bedbca6aa76f3accd1c18210c686cddf7168c59f376285bd1c9a35b00e1c74b')

prepare() {
  set -u
  cd "${_srcdir}"

  patch -Nup3 -i '../0000-tmpname.patch'

  sed -e '# Fixes Bug: https://bugzilla.redhat.com/show_bug.cgi?id=822117' \
      -e '/^  local($\[)=0;$/d' \
      -e '#' \
      -e '# Set some variables in the script' \
      -e "s#/it/sw/share/www/lib/html2ps/html2psrc#/etc/html2psrc#g" \
      -e "s#/opt/misc/lib/html2ps/html2psrc#/etc/html2psrc#g" \
      -e "s#/opt/misc/lib/html2ps/html2ps.html#/usr/share/html2ps/html2ps.html#g" \
      -e "s#Ghostscript: 0;#Ghostscript: 1;#g" \
      -e "s#TeX: 0;#TeX: 1;#g" \
      -e 's# file: "";# file: "/usr/share/texmf/tex/generic/hyphen/hyphen.tex";#g' \
    -i "${pkgname}"

  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dpm644 'sample' "${pkgdir}/etc/html2psrc"
  install -Dpm644 'sample' "${pkgdir}/usr/share/${pkgname}/etc/html2psrc-sampleconfig"
  install -Dpm644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm644 "${pkgname}rc.5" -t "${pkgdir}/usr/share/man/man5/"
  install -Dpm644 "${pkgname}.html" -t "${pkgdir}/usr/share/${pkgname}/"
  set +u
}
set +u
