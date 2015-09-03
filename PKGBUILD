# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Claudio Riva <firetux83@gmail.com>

set -u
pkgname='viewvc'
pkgver='1.1.23'
pkgrel='1'
pkgdesc='web-based vcs version control repository browsing'
url='http://viewvc.tigris.org/'
license=('custom:ViewVC')
arch=('i686' 'x86_64')
depends=('subversion' 'python2' 'diffutils')
makedepends=('cvs' 'rcs')
backup=('usr/share/viewvc/viewvc.conf')
install="${pkgname}.install"
_verwatch=('http://viewvc.tigris.org/servlets/ProjectDocumentList?folderID=6004' '/files/documents/3330/49392/viewvc-\([0-9\.]\+\)\.tar\.gz' 'l')
source=("http://viewvc.tigris.org/files/documents/3330/49392/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d14290b23f44e8f5301a7ca9fc946bcd0f8bb8206d9b9c111ac56e19f2588b7d')

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"

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
