# Maintainer: Guillaume Alaux <guillaume@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=tomcat8
pkgver=8.5.50
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
  https://archive.apache.org/dist/tomcat/tomcat-8/v${pkgver}/bin/apache-tomcat-${pkgver}.tar.gz
  tomcat8.service
  tomcat8.sysusers
  tomcat8.tmpfiles
)
sha256sums=('ea762293e889f85d40f5ec14ac4474e133a379522d623f4ba5993da6260bf06e'
            '01ba022e06d6afa71f6f7d774e48c042c63eca9e06f0c95c92cf8d5a3828a8b2'
            '02e7a1edb82ed117629189806d40c2c7b70ec994ecbafc11cb7dc7eec35af216'
            '0dc1fdb537d3488756755f3fb713a9638597d4c68596f6f94f2707e8363cf5e2')

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

  install -dm1777 "${pkgdir}"/var/tmp
  install -dm775 -o ${_uid_tomcat} -g ${_gid_tomcat} "${pkgdir}"/var/tmp/tomcat8/{temp,work}
  ln -s /var/tmp/tomcat8/temp "${pkgdir}"/usr/share/tomcat8/temp
  ln -s /var/tmp/tomcat8/work "${pkgdir}"/usr/share/tomcat8/work

  install -Dm 644 ../tomcat8.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 ../tomcat8.sysusers "${pkgdir}"/usr/lib/sysusers.d/tomcat8.conf
  install -Dm 644 ../tomcat8.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/tomcat8.conf
}

# vim: ts=2 sw=2 et:
