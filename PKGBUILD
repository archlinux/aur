# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>

pkgname=tomcat8
pkgver=8.5.56
pkgrel=1
pkgdesc='Open source implementation of the Java Servlet 3.1 and JavaServer Pages 2.3 technologies'
arch=(any)
url=https://tomcat.apache.org/
license=(APACHE)
depends=(
  'java-runtime>=7'
  java-jsvc
  java-commons-daemon
  eclipse-ecj
)
optdepends=('tomcat-native: to allow optimal performance in production environments')
backup=(
  etc/tomcat8/catalina.policy
  etc/tomcat8/catalina.properties
  etc/tomcat8/context.xml
  etc/tomcat8/logging.properties
  etc/tomcat8/server.xml
  etc/tomcat8/tomcat-users.xml
  etc/tomcat8/web.xml
)
install=tomcat8.install
source=(
  https://archive.apache.org/dist/tomcat/tomcat-8/v${pkgver}/bin/apache-tomcat-${pkgver}.tar.gz{,.asc}
  tomcat8.service
  tomcat8.sysusers
  tomcat8.tmpfiles
)
validpgpkeys=(
  A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 # Mark E D Thomas
  713DA88BE50911535FE716F5208B0AB1D63011C7 # Violeta Georgieva Georgieva
)
sha512sums=('7a02a8e0b12eea2e0bf1175d754bd19dc445e7182c2db033ba6ca1330161cc74207c9b9b7f0fce510417ece28f26cc36816b34eb394b0d27350631e64204aed3'
            'SKIP'
            '114c62af0adf4243d210b2f3d7a9a51ca448a7105d38ef4a6587903eac716ad552989bfee76af933cf0022bad374a8dcb1b932abb8e902a93f72dec0aadd7ab7'
            '7b505c79e495c35f787f300cd786e9f474ba2df61f8a50e21d2480de6a4c27a409b627447d1e4cb2fb543f81c107cbb30adbbc31a29754d0fe8e6908ea61cd7a'
            'f5d819afa9b01adbe1f09267a64d1d35f994db48c7af9c49b1731305e82e0306561a24d6b6d4a33116dcd4990989d8a7a9c52532b003d480c0522e63b976c815')

_gid_log=19
_gid_tomcat=57
_uid_tomcat=57

package() {
  cd apache-tomcat-${pkgver}

  # Tomcat general files
  install -dm 755 "${pkgdir}"/usr/share/{,java/}tomcat8
  cp -dr --no-preserve=ownership bin "${pkgdir}"/usr/share/tomcat8
  # commons-daemon and tomcat-natives are packaged on their own
  rm "${pkgdir}"/usr/share/tomcat8/bin/{*.bat,commons-daemon*,tomcat-native.tar.gz}
  ln -s /usr/share/java/commons-daemon.jar "${pkgdir}"/usr/share/tomcat8/bin/commons-daemon.jar

  install -m 644 lib/* "${pkgdir}"/usr/share/java/tomcat8
  # eclipse-ecj is packaged on its own
  rm "${pkgdir}"/usr/share/java/tomcat8/ecj-*.jar
  ln -s ../eclipse-ecj.jar "${pkgdir}"/usr/share/java/tomcat8/ecj.jar

  ln -s /usr/share/java/tomcat8 "${pkgdir}"/usr/share/tomcat8/lib

  # We log through systemd but this would still be required for stock Tomcat logging
  install -dm 775 -o ${_uid_tomcat} -g ${_gid_log} "${pkgdir}"/var/log/tomcat8
  ln -s /var/log/tomcat8 "${pkgdir}"/usr/share/tomcat8/logs
  touch "${pkgdir}"/var/log/tomcat8/catalina.{out,err}
  chgrp ${_gid_log} "${pkgdir}"/var/log/tomcat8/catalina.{out,err}

  install -dm 775 "${pkgdir}"/etc/tomcat8
  install -m 640 -g ${_gid_tomcat} conf/* "${pkgdir}"/etc/tomcat8
  install -dm 775 -g ${_gid_tomcat} "${pkgdir}"/etc/tomcat8/Catalina
  ln -s /etc/tomcat8 "${pkgdir}"/usr/share/tomcat8/conf

  install -dm 775 "${pkgdir}"/var/lib/tomcat8
  cp -r webapps "${pkgdir}"/var/lib/tomcat8
  chown -R ${_uid_tomcat}:${_gid_tomcat} "${pkgdir}"/var/lib/tomcat8
  chmod 775 "${pkgdir}"/var/lib/tomcat8/webapps
  ln -s /var/lib/tomcat8/webapps "${pkgdir}"/usr/share/tomcat8/webapps

  install -dm 1777 "${pkgdir}"/var/tmp
  install -dm 775 -o ${_uid_tomcat} -g ${_gid_tomcat} "${pkgdir}"/var/tmp/tomcat8/{temp,work}
  ln -s /var/tmp/tomcat8/temp "${pkgdir}"/usr/share/tomcat8/temp
  ln -s /var/tmp/tomcat8/work "${pkgdir}"/usr/share/tomcat8/work

  install -Dm 644 ../tomcat8.service "${pkgdir}"/usr/lib/systemd/system/tomcat8.service
  install -Dm 644 ../tomcat8.sysusers "${pkgdir}"/usr/lib/sysusers.d/tomcat8.conf
  install -Dm 644 ../tomcat8.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/tomcat8.conf
}

# vim: ts=2 sw=2 et:
