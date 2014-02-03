# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=tomcat8
pkgver=8.0.1
pkgrel=1
arch=('any')
url='http://tomcat.apache.org/'
license=('APACHE')
makedepends=('java-environment>=7' 'apache-ant>=1.8' 'java-commons-daemon' 'eclipse-ecj')
pkgdesc='Servlet-3.1/JSP-2.3 Container'
depends=('java-runtime>=7' 'java-jsvc' 'java-commons-daemon' 'eclipse-ecj')
optdepends=('tomcat-native: to allow optimal performance in production environments')
backup=(etc/tomcat8/catalina.policy
        etc/tomcat8/catalina.properties
        etc/tomcat8/context.xml
        etc/tomcat8/logging.properties
        etc/tomcat8/server.xml
        etc/tomcat8/tomcat-users.xml
        etc/tomcat8/web.xml)
install=tomcat8.install
source=(http://archive.apache.org/dist/tomcat/tomcat-8/v${pkgver}/src/apache-tomcat-${pkgver}-src.tar.gz
        systemd_tomcat8.service
        systemd_tmpfiles.d_tomcat8.conf
        tomcat8.install)

sha256sums=('2725863308fb767d002e2305ef3943517824109531147c456bcb5602d28a29c3'
            '435ea512aa6b4e4d2e28eee90964f706b0a0f57e7c6e59db1ca9c4986bdbef3e'
            'cd637d5b1a0e816c149c868a72d3d315ea0061efc9e544cadfbc73859dedb847'
            '901c9262d869b4788a1ebb0cd50c5f2a195ebf26d9a8eac74679361f1a19fae1')

prepare() {
  cd "${srcdir}/apache-tomcat-${pkgver}-src"
  touch HACK
  mkdir "${srcdir}/DOWN_LIBS"
}

build() {
  cd "${srcdir}/apache-tomcat-${pkgver}-src"

  . /etc/profile.d/apache-ant.sh

  ant \
    -Dbase.path="${srcdir}/DOWN_LIBS" \
    -Dcommons-daemon.jar=/usr/share/java/commons-daemon.jar \
    -Dcommons-daemon.native.src.tgz="HACK" \
    -Dtomcat-native.tar.gz="HACK" \
    -Dcommons-dbcp.version=2.0-20140203.145446-157 \
    -Djdt.jar=/usr/share/java/eclipse-ecj.jar
    #-Dcommons-pool.home="HACKDIR" \
}

# Takes ages:
#check() {
#  cd "${srcdir}/apache-tomcat-${pkgver}-src"
#
#  ant test \
#    -Dbase.path="${srcdir}/DOWN_LIBS"
#}

_gid_log=19
_gid_tomcat8=57
_uid_tomcat8=57

package() {
  cd "${srcdir}/apache-tomcat-${pkgver}-src/output/build"

  # Tomcat general files
  install -dm755 "${pkgdir}"/usr/share/${pkgname} \
                 "${pkgdir}"/usr/share/java/${pkgname}
  cp -r bin "${pkgdir}"/usr/share/${pkgname}
  # commons-daemon and tomcat-natives are packaged on their own
  rm "${pkgdir}"/usr/share/${pkgname}/bin/{*.bat,commons-daemon*,tomcat-native.tar.gz}
  ln -s /usr/share/java/commons-daemon.jar "${pkgdir}"/usr/share/${pkgname}/bin/commons-daemon.jar

  install -m644 lib/* "${pkgdir}"/usr/share/java/${pkgname}
  # eclipse-ecj is packaged on its own
  rm "${pkgdir}"/usr/share/java/${pkgname}/eclipse-ecj.jar
  ln -s ../eclipse-ecj.jar "${pkgdir}"/usr/share/java/${pkgname}/eclipse-ecj.jar

  ln -s /usr/share/java/${pkgname} "${pkgdir}"/usr/share/${pkgname}/lib

  # We log through systemd but this would still be required for stock Tomcat logging
  install -dm775 -o ${_uid_tomcat8} -g ${_gid_log} "${pkgdir}"/var/log/${pkgname}
  ln -s /var/log/${pkgname} "${pkgdir}"/usr/share/${pkgname}/logs
  touch "${pkgdir}"/var/log/${pkgname}/catalina.{out,err}
  chgrp ${_gid_log} "${pkgdir}"/var/log/${pkgname}/catalina.{out,err}

  install -dm775 "${pkgdir}"/etc/${pkgname}
  install -g ${_gid_tomcat8} -m640 conf/* "${pkgdir}"/etc/${pkgname}
  install -d -g ${_gid_tomcat8} -m775 "${pkgdir}"/etc/${pkgname}/Catalina
  ln -s /etc/${pkgname} "${pkgdir}"/usr/share/${pkgname}/conf

  install -dm775 "${pkgdir}"/var/lib/${pkgname}
  cp -r webapps "${pkgdir}"/var/lib/${pkgname}
  chown -R ${_uid_tomcat8}:${_gid_tomcat8} "${pkgdir}"/var/lib/${pkgname}
  ln -s /var/lib/${pkgname}/webapps "${pkgdir}"/usr/share/${pkgname}/webapps

  install -dm1777 "${pkgdir}"/var/tmp
  install -dm775 -o ${_uid_tomcat8} -g ${_gid_tomcat8} "${pkgdir}"/var/tmp/${pkgname}/{temp,work}
  ln -s /var/tmp/${pkgname}/temp "${pkgdir}"/usr/share/${pkgname}/temp
  ln -s /var/tmp/${pkgname}/work "${pkgdir}"/usr/share/${pkgname}/work

  install -Dm644 "${srcdir}"/systemd_tomcat8.service \
                 "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 "${srcdir}"/systemd_tmpfiles.d_tomcat8.conf \
                 "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
