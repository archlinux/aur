# Maintainer: Chris G. <chris-git@gmx.com>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>


set -u
_major='8'
pkgname="jdk${_major}-docs"
_minorjd='341'
_buildjd='b10'
_hashjd='61ae65e088624f5aaa0b1d2d801acb16'
_minorfx='341'
_buildfx='b10'
_hashfx='424b9da4b48848379167015dcc250d8d'
pkgver="${_major}u${_minorjd}"
pkgverfx="${_major}u${_minorfx}"
pkgrel='1'
pkgdesc="Documentation for Oracle Java ${_major} Development Kit"
arch=('any')
url='https://www.oracle.com/java/technologies/javase-jdk8-doc-downloads.html'
license=('custom:Oracle')
depends=("java-environment>=${_major}")
options=('!strip')
_srcfil="jdk-${pkgver}-docs-all.zip"
source=(
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_buildjd}/${_hashjd}/jdk-${pkgver}-docs-all.zip"
  "https://download.oracle.com/otn-pub/java/javafx/${_major}.0.${_minorfx}-${_buildfx}/${_hashfx}/javafx-${pkgverfx}-apidocs.zip"
  'LICENSE-Documentation.txt'
  'LICENSE-Oracle-Legal-Notices.txt'
)
# from oracle-sqldeveloper
DLAGENTS+=("manual::${startdir:-}/readme.sh %o %u")
source[0]="manual://${_srcfil}"
if [ ! -z "${HOME:-}" ]; then # block mksrcinfo
  XDG_DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD 2>/dev/null)" || :
  if [ -z "${XDG_DOWNLOAD_DIR}" ]; then
    XDG_DOWNLOAD_DIR=~/'Downloads'
  fi
  if [ -s "${XDG_DOWNLOAD_DIR}/${_srcfil}" ] && [ ! -e "${_srcfil}" ]; then
    if type msg > /dev/null 2>&1; then
      set +u
      msg "Scooping files from ${XDG_DOWNLOAD_DIR}" 1>&2
      msg2 "${_srcfil}" 1>&2
      set -u
      ln -sr "${XDG_DOWNLOAD_DIR}/${_srcfil}"
    fi
  fi
fi
unset _srcfil
unset XDG_DOWNLOAD_DIR

sha256sums=('a7eeab8619c26176e229efa33f1901882cbf83a03869b7daaec8434460d32dfe'
            'd2a688d16a4632100b2564948019fd3b1070c7a1467f8cfb71081e932d96b97e'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '99e666088f11baacfe1816747e69441a7002e024ac0d7a4ca4092c6cb2658c9f')
sha512sums=('0d8792b3e0c039f99272eee971321f37eadd2ca3c7c07f9e1bc6f6b73cddffb2cb7370492af942706ccf024598632cdb5f3e8de7f29e24f7b5f5db74a0853ed3'
            '2584bebdcafd3b5f5afeb9eb96ea3aff44886094d00e185878cfdc045cb646108493bc6f8ee14b3196a2d069b459febf7f60c97b071aac1136b612833520002c'
            '16ec94fa0739547af03192be3bc4ba74888fc0f3c1fefb2a1be3e0801f52f62af438dab91669a1598da30eb45e0ce2d9694e5fc106c77a42411828c4b29cf751'
            '5137995bf26bbae92d5e33107a1c90ec88ea67bd3b22d28166e3c47cece04c67685f012fec2c61e41be86e07842b93ec1f72a4e05d47111b0f21de060c3b09ad')

DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
  set -u
  # Create Dirs
  install -d "${pkgdir}/usr/share/doc/java${_major}/javafx/"

  # Install
  mv docs/* "${pkgdir}/usr/share/doc/java${_major}/"
  mv api "${pkgdir}/usr/share/doc/java${_major}/javafx/"

  # License
  install -Dpm644 'LICENSE-Oracle-Legal-Notices.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
