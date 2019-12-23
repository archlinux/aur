# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Dmitry Nosachev quartz64 gmail
# Contributor: Patrick Schneider Patrick.Schneider uni-ulm.de

# Install guide:
# http://openmeetings.apache.org/installation.html
# The early steps are done by this PKGBUILD.

# Original instructions for 1.9.1, some of which may still apply:
# ==> Please make sure that mysql is reachable via TCP/IP
# ==> Do this by commenting out the following line in /etc/my.cnf:
# ==> skip-networking
#
# ==> OpenMeetings/red5 also requires you to open the following ports:
# ==> 5080 8443 1935 8088 9035"
#
# ==> Last, please configure your mysql database, user and password at
# ==> /opt/red5/webapps/openmeetings/WEB-INF/classes/META-INF/persistence.xml
# ==> Then start mysql and red5. If all went ok, you can access the
# ==> OpenMeetings installer at http://localhost:5080/openmeetings/install

set -u
pkgname='openmeetings'
pkgver='4.0.10'
pkgrel='1'
#pkgdesc='Multi-Language Cross-Platform Customizable Web-Conferencing and Collaboration'
pkgdesc='provides video conferencing, instant messaging, white board, collaborative document editing and other groupware tools using the Red5 Streaming Server'
arch=('any')
#url='http://code.google.com/p/openmeetings/'
url='http://openmeetings.apache.org/'
license=('apache')
depends=('mysql' 'imagemagick' 'ghostscript' 'swftools' 'sox' 'lame' 'java-environment-openjdk>=7'
 'ffmpeg' 'libreoffice')
makedepends=('curl') # 'unzip') # Used to download as zip
backup=("opt/${pkgname}/webapps/${pkgname}/WEB-INF/classes/META-INF/persistence.xml")
options=('!strip') # Nothing to strip in a Java package, wastes time!
#install="${pkgname}.install"
_srczip="apache-${pkgname}-${pkgver}.tar.gz"

# by Guillaume ALAUX for storm,kafka
#_apache_cgi='http://www.apache.org/dyn/closer.cgi'
#_closest="$(curl "${_apache_cgi}?asjson=1" | tr -d '\n ' | sed -r 's/.*"preferred":"(.+)".*/\1/')" # '
_closest="http://www.apache.org/dist" # It worked but wasn't compatible with mksrcinfo
source=("${_closest}/${pkgname}/${pkgver}/bin/${_srczip}"
        "http://www.apache.org/dist/${pkgname}/${pkgver}/bin/${_srczip}.asc" # Sigs always come from the master repository
        "${pkgname}.service"
)
_verwatch=("https://archive.apache.org/dist/${pkgname}/" "\([0-9\.]\+\)/" 'l')
noextract=("${_srczip}")
sha256sums=('ff1a84cbc2bd8b51dac99941c38cd3d2b12b49ec1219f2f460734d10242f516c'
            'SKIP'
            '9cfa4ff392fe48164fe883f10449e45df6ad4dccd5aa94da689e7e5137b043ce')

package() {
  set -u
  install -dm755 "${pkgdir}/opt/${pkgname}"
  #unzip -q -d "${pkgdir}/opt/${pkgname}" "${srcdir}/${_srczip}"

  tar -xz -C "${pkgdir}/opt/${pkgname}" -f "${srcdir}/${_srczip}"
  #chmod 755 "${pkgdir}/opt/${pkgname}"/*.sh # 1.9.1 forgot to set the shell scripts executable

  install -Dpm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"

  # Overwrite Apache Derby with MySQL/MariaDB which has been installed by this PKGBUILD.
  # The user can select Derby or any of the others after Install.
  cp -p "${pkgdir}/opt/${pkgname}/webapps/${pkgname}/WEB-INF/classes/META-INF/mysql_persistence.xml" "${pkgdir}/opt/${pkgname}/webapps/${pkgname}/WEB-INF/classes/META-INF/persistence.xml"
  set +u
}
set +u
