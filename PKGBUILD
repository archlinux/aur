# Maintainer: Chris G. <chris-git@gmx.com>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>


set -u
_major='8'
pkgname="jdk${_major}-docs"
_minorjd='381'
_buildjd='b09'
_hashjd='8c876547113c4e4aab3c868e9e0ec572'
_minorfx='381'
_buildfx='b09'
_hashfx='8c876547113c4e4aab3c868e9e0ec572'
pkgver="${_major}u${_minorjd}"
pkgverfx="${_major}u${_minorfx}"
pkgrel='1'
pkgdesc="Documentation for Oracle Java ${_major} Development Kit and Java FX ${_major}"
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

sha256sums=('dbfe8401622a2be282c5cf7f502680a6e17e0432362452768180694aced47197'
            '2b945519816423056d5d1e86ff4a9852aaf769fec20e6e4883ab032b83c4ea86'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '99e666088f11baacfe1816747e69441a7002e024ac0d7a4ca4092c6cb2658c9f')
sha512sums=('8bcaaab1cc8d316b2ddbda88fe5147034a180bef1ddf890c2e2127b5174c30304683d826f6f1b22a5be33690223838e260af68814e23d0533b20875a319e6e6a'
            'f0c297d37e61c423ee23e189f688e13215d0bea21ef5d7f9a3a48cd82eecd8f0152e94db584ca168743b4b37aa3fb0fbdef5882ef3c65a658f48b63f685215a8'
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
