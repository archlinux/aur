# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: khvalera ukr.net
# Contributor: Dmitry Nosachev quartz64 gmail
# Contributor: Patrick Schneider Patrick.Schneider uni-ulm.de

# TODO: There are still a few differences between the two builds

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

_opt_build=0
# 0 = full package from Apache (fast)
# 1 = Github + maven (about 45 minutes to build)

set -u
pkgname='openmeetings'
_pkgver='6.3.0'
pkgver="${_pkgver//-/.}"
pkgrel='1'
#pkgdesc='Multi-Language Cross-Platform Customizable Web-Conferencing and Collaboration'
pkgdesc='Provides video conferencing, instant messaging, white board, collaborative document editing and other groupware tools. It uses API functions of Media Server for Remoting and Streaming (Red5 or Kurento)'
arch=('any')
#url='https://code.google.com/p/openmeetings/'
#url='https://github.com/apache/openmeetings/'
url='http://openmeetings.apache.org/'
license=('apache')
_minjv='11'
depends=('libjpeg' 'lame' "java-environment-openjdk>=${_minjv}")
#depends+=('swftools') # removed in 5.0
optdepends=('imagemagick' 'ghostscript' 'sox' 'libreoffice' 'ffmpeg' 'mysql' 'openmeetings-mysql-connector-java' 'docker' 'kurento-media-server' 'kms-elements')
makedepends=('curl')
makedepends+=('gcc' 'make' 'libtool' 'bison' 'autoconf' 'automake' 'fakeroot') # base-devel
#makedepends+=('unzip') # Used to download as zip
backup=(
  'opt/openmeetings/webapps/openmeetings/WEB-INF/classes/META-INF/persistence.xml'
  'opt/openmeetings/webapps/openmeetings/WEB-INF/classes/org/apache/openmeetings/web/room/VideoSettings.html'
  'opt/openmeetings/conf/server.xml'
  'opt/openmeetings/conf/context.xml'
  'opt/openmeetings/conf/logging.properties'
)
options=('!strip') # Nothing to strip in a Java package, wastes time!
install="${pkgname}.install"
_srcdir="apache-${pkgname}-${_pkgver}"
_srzgz="${_srcdir}.tar.gz"

# by Guillaume ALAUX for storm,kafka
#_apache_cgi='http://www.apache.org/dyn/closer.cgi'
#_closest="$(curl "${_apache_cgi}?asjson=1" | tr -d '\n ' | sed -r 's/.*"preferred":"(.+)".*/\1/')" # '
_closest='https://www.apache.org/dist' # It worked but wasn't compatible with mksrcinfo
source=(
  "${_closest}/${pkgname}/${_pkgver}/bin/${_srzgz}"
)
if [ "${_opt_build}" -ne 0 ]; then
  source[0]="${_srcdir}-git.tar.gz::https://github.com/apache/openmeetings/archive/${_pkgver}.tar.gz"
  _srcdir="${_srcdir#apache-}"
  makedepends+=('jshon' 'expac' 'mvnvm' 'ruby')
else
  : # source+=("https://www.apache.org/dist/${pkgname}/${_pkgver}/bin/${_srzgz}.asc") # Sigs always come from the master repository
  noextract=("${_srzgz}")
fi
#_verwatch=("https://archive.apache.org/dist/${pkgname}/" "\([0-9\.]\+\)/" 'l')
md5sums=('44fcbeea70c67f671120e14ce8de0d63')
sha256sums=('e909c0291e75359e1b5e23f9427e2e5108524867747c22a18a49981e7ab2917d')

#PKGEXT='.pkg.tar.gz'

build() {
  set -u
  if [ "${_opt_build}" -ne 0 ]; then
    cd "${_srcdir}"
    local _j _jmx _jvmx=0 _jmn _jvmn=999999
    for _j in /usr/lib/jvm/java-[0-9]*-openjdk/; do
      if [[ "${_j}" =~ ^/usr/lib/jvm/java-([0-9]+)-openjdk/$ ]] && [ "${BASH_REMATCH[1]}" -ge "${_minjv}" ]; then
        if [ "${BASH_REMATCH[1]}" -ge "${_jvmx}" ]; then
          _jmx="${_j}"
          _jvmx="${BASH_REMATCH[1]}"
        fi
        if [ "${BASH_REMATCH[1]}" -le "${_jvmn}" ]; then
          _jmn="${_j}"
          _jvmn="${BASH_REMATCH[1]}"
        fi
      fi
    done
    #_jmx="${_jmn}"
    # Use a persistent local maven repository.
    set +u; msg2 "Java ${_jmx}"; set -u
    JAVA_HOME="${_jmx}" \
    mvn clean install -Dmaven.repo.local="${startdir}/mvn-repository" -PallModules # -T 1C didn't help
  fi
  set +u
}

package() {
  _package_"${_opt_build}"
}

_package_0() {
  set -u
  install -dm755 "${pkgdir}/opt/"
  #unzip -q -d "${pkgdir}/opt/${pkgname}" "${srcdir}/${_srzgz}"
  cd "${pkgdir}/opt"

  set +u; msg2 "Extract ${_srzgz}"; set -u
  bsdtar -xz --no-same-owner -f "${srcdir}/${_srzgz}"
  #chmod 755 "${pkgdir}/opt/${pkgname}"/*.sh # 1.9.1 forgot to set the shell scripts executable
  mv "${_srcdir}" 'openmeetings'
  cd 'openmeetings'
  mv *.sh 'bin/' # probably not necessary

  install -d "${pkgdir}/usr/lib/systemd/system/"
  mv 'openmeetings.service' "${pkgdir}/usr/lib/systemd/system/"
  _fin

  # Overwrite Apache Derby with MySQL/MariaDB which has been installed by this PKGBUILD.
  # The user can select Derby or any of the others after Install.
  #cp -p 'webapps/openmeetings/WEB-INF/classes/META-INF'/{mysql_persistence.xml,persistence.xml}
  set +u
}

_fin() {
  install -d "${pkgdir}/run/openmeetings"

  find "${pkgdir}/opt/openmeetings" -type 'f' '(' -name '*.bat' -o -name '*.tar.gz' ')' -delete

  find "${pkgdir}/opt/openmeetings/bin" -type 'f' -name '*.sh' -exec chmod 755 '{}' '+'

  # Fix openmeetings.service
  sed -Ee 's:^(JAVA_HOME)=.*$:\1=/usr/lib/jvm/java-11-openjdk:g' \
      -e 's:^(Group)=.*$:\1=nobody:g' \
      -e 's:^(CATALINA_PID)=.*$:\1=/var/run/openmeetings/openmeetings.pid:g' \
    -i "${pkgdir}/usr/lib/systemd/system/openmeetings.service"
}

_package_1() {
  set -u

  cd "${_srcdir}"
  install -d "${pkgdir}/opt/openmeetings/webapps/openmeetings"/{docs,screenshare}

  cp -p -r 'openmeetings-server/target/apache-tomcat-9.0.34'/* "${pkgdir}/opt/openmeetings"

  cp -f -r 'openmeetings-server/src/main/assembly/conf'/* "${pkgdir}/opt/openmeetings/conf"

  cp -p -r 'openmeetings-server/src/main/assembly/scripts'/*.sh "${pkgdir}/opt/openmeetings/bin"

  rm "${pkgdir}/opt/openmeetings/conf"/tomcat-users.*

  install -Dpm644 'openmeetings-server/src/main/assembly/scripts/openmeetings.service' \
          -t "${pkgdir}/usr/lib/systemd/system/"

  _fin

  rm -R "${pkgdir}/opt/openmeetings/webapps"/{examples,host-manager,manager,docs,ROOT}

  # install webapps openmeetings
  cp -p -r 'openmeetings-web/target/openmeetings-web-5.0.0-M4'/* "${pkgdir}/opt/openmeetings/webapps/openmeetings"
  rmdir "${pkgdir}/opt/openmeetings/webapps/openmeetings/META-INF"

  # install webapps ROOT
  cp -p -r 'openmeetings-server/src/main/assembly/ROOT' "${pkgdir}/opt/openmeetings/webapps"

  # install webapps docs
  cp -p -r 'openmeetings-server/target/site'/* "${pkgdir}/opt/openmeetings/webapps/openmeetings/docs"

  # install screenshare
  cp -f -r 'openmeetings-screenshare/target/jnlp'/* "${pkgdir}/opt/openmeetings/webapps/openmeetings/screenshare"

  # localhost.jks - later need to fix
  bsdtar -xz --no-same-owner -f "openmeetings-server/target/apache-${_srcdir}.tar.gz"

  cp -f "apache-${_srcdir}/conf/localhost.jks" "${pkgdir}/opt/openmeetings/conf/localhost.jks"
  set +u
}
set +u
