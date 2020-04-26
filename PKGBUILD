# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Claudio Riva <firetux83@gmail.com>

set -u
pkgname='viewvc'
#_pkgno='49241'; pkgver='1.0.13'
#_pkgno='49392'; pkgver='1.1.23'
#_pkgno='49471'; pkgver='1.1.24'
#pkgver='1.1.27'
pkgver='1.2.1'
pkgrel='1'
pkgdesc='web-based vcs version control repository browsing, formerly viewcvs'
arch=('i686' 'x86_64')
#url='http://viewvc.tigris.org/'
url='https://github.com/viewvc/viewvc'
license=('custom:ViewVC')
depends=('subversion' 'python2' 'diffutils')
makedepends=('cvs' 'rcs')
backup=('usr/share/viewvc/viewvc.conf')
install="${pkgname}.install"
#_verwatch=("${url}/servlets/ProjectDocumentList?folderID=6004" "/files/documents/3330/[0-9]\+/${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
_verwatch=("${url}/releases.atom" "\s\+<title>ViewVC \([^<]\+\)</title>.*" 'f') # RSS
#source=("${url}/files/documents/3330/${_pkgno}/${pkgname}-${pkgver}.tar.gz")
_srcdir="${pkgname}-${pkgver}"
source=("${_srcdir}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('4c1bd8b7b54c0d994d58c7073d1c3e1f')
sha256sums=('5fe1e16f986b51a2800d908683673b880684e90ae1611d98744187f0649634f5')

package() {
  set -u
  set -x
  cd "${pkgname}-${pkgver}"

  sed -e "s@DESTDIR = None@DESTDIR = \"${pkgdir}/\"@g" \
      -e "s@ROOT_DIR = None@ROOT_DIR = \"/usr/share/${pkgname}\"@g" \
    -i 'viewvc-install'
  python2 viewvc-install
  install -Dpm755 "${pkgdir}/usr/share/${pkgname}/bin/cgi"/viewvc.cgi -t "${pkgdir}/srv/httpd/cgi-bin/"
  sed -e "s@#rcs_path = /usr/bin/@rcs_path = /usr/bin/@g" \
      -e "s@mime_types_file = /usr/local/apache/conf/mime.types@mime_types_file = /etc/httpd/conf/mime.types@g" \
    -i "${pkgdir}/usr/share/viewvc/viewvc.conf"
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
