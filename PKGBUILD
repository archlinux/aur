# Maintainer: Chris G. <chris-git@gmx.com>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>


set -u
_major='8'
pkgname="jdk${_major}-docs"
_minorjd='361'
_buildjd='b09'
_hashjd='0ae14417abb444ebb02b9815e2103550'
_minorfx='361'
_buildfx='b09'
_hashfx='0ae14417abb444ebb02b9815e2103550'
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

sha256sums=('c881799067f90ba8c720f73569a9cfab0eeb3dee844d8876cbf15f53df1275fb'
            '6450977e1b95988943f0f28789a90463789d3357302f248b0afc9a596142b571'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '99e666088f11baacfe1816747e69441a7002e024ac0d7a4ca4092c6cb2658c9f')
sha512sums=('df6462c7953d22d66dd0bc6bcebd9d154dd45534291becdc7d484844826bf6dd2df6cc026fefa87784e3d8c972ffe078e247508bad815f62f54efe4409c263b8'
            'bb6437023671f15132a2f2092e82f1ef2a95bfda7aae5e5210b2c2a959a235acf63a76d0eb14cd9f21fdf132dfd85d012e352f220d6636fd7fa9da18a358c0fc'
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
