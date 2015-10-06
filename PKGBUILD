# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Claudio Riva <firetux83@gmail.com>

set -u
pkgname='viewvc'
#_pkgno='49241' # 1.0.13
#_pkgno='49392' # 1.1.23
_pkgno='49471' # 1.1.24
pkgver='1.1.24'
pkgrel='1'
pkgdesc='web-based vcs version control repository browsing, formerly viewcvs'
arch=('i686' 'x86_64')
url='http://viewvc.tigris.org/'
license=('custom:ViewVC')
depends=('subversion' 'python2' 'diffutils')
makedepends=('cvs' 'rcs')
backup=('usr/share/viewvc/viewvc.conf')
install="${pkgname}.install"
_verwatch=("${url}/servlets/ProjectDocumentList?folderID=6004" "/files/documents/3330/[0-9]\+/${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
source=("${url}/files/documents/3330/${_pkgno}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0620f69fa5ba02ac65e000586ba31015a2053a82711bedb30629fd6087003d7e')

package() {
  set -u
  cd "${pkgname}-${pkgver}"

  sed -i -e "s@DESTDIR = None@DESTDIR = \"${pkgdir}/\"@g" \
         -e "s@ROOT_DIR = None@ROOT_DIR = \"/usr/share/${pkgname}\"@g" 'viewvc-install'
  python2 viewvc-install
  install -Dpm755 "${pkgdir}/usr/share/${pkgname}/bin/cgi"/{query.cgi,viewvc.cgi} -t "${pkgdir}/srv/httpd/cgi-bin/"
  sed -i -e "s@#rcs_path = /usr/bin/@rcs_path = /usr/bin/@g" \
         -e "s@mime_types_file = /usr/local/apache/conf/mime.types@mime_types_file = /etc/httpd/conf/mime.types@g" "${pkgdir}/usr/share/viewvc/viewvc.conf"
  install -Dpm644 'LICENSE.html' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
