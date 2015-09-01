# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=tomcat8
pkgver=8.0.26
pkgrel=1
pkgdesc='Open source implementation of the Java Servlet 3.1 and JavaServer Pages 2.3 technologies'
arch=('any')
url='http://tomcat.apache.org/'
license=('APACHE')
depends=('java-runtime>=7' 'java-jsvc' 'java-commons-daemon' 'eclipse-ecj')
optdepends=('tomcat-native: to allow optimal performance in production environments')
backup=(etc/${pkgname}/catalina.policy
        etc/${pkgname}/catalina.properties
        etc/${pkgname}/context.xml
        etc/${pkgname}/logging.properties
        etc/${pkgname}/server.xml
        etc/${pkgname}/tomcat-users.xml
        etc/${pkgname}/web.xml)
install=${pkgname}.install
source=(http://archive.apache.org/dist/tomcat/tomcat-8/v${pkgver}/bin/apache-tomcat-${pkgver}.tar.gz
        systemd_${pkgname}.service
        systemd_sysusers.d_${pkgname}.conf
        systemd_tmpfiles.d_${pkgname}.conf)

sha256sums=('9f11588f0ff767adde63cd6919462c0c2742897560f4b367a0ffffdd8b1ed382'
            'd44056248b7cdd6671fd4de08a9453b3bd1a83980343d249a99b74939d46f4d4'
            '02e7a1edb82ed117629189806d40c2c7b70ec994ecbafc11cb7dc7eec35af216'
            '0dc1fdb537d3488756755f3fb713a9638597d4c68596f6f94f2707e8363cf5e2')

_gid_log=19
_gid_tomcat=57
_uid_tomcat=57

package() {
  cd "${srcdir}/apache-tomcat-${pkgver}"

  # Tomcat general files
  install -dm755 "${pkgdir}"/usr/share/{,java/}${pkgname}
  cp -r bin "${pkgdir}"/usr/share/${pkgname}
  # commons-daemon and tomcat-natives are packaged on their own
  rm "${pkgdir}"/usr/share/${pkgname}/bin/{*.bat,commons-daemon*,tomcat-native.tar.gz}
  ln -s /usr/share/java/commons-daemon.jar "${pkgdir}"/usr/share/${pkgname}/bin/commons-daemon.jar

  install -m644 lib/* "${pkgdir}"/usr/share/java/${pkgname}
  # eclipse-ecj is packaged on its own
  rm "${pkgdir}"/usr/share/java/${pkgname}/ecj-*.jar
  ln -s ../eclipse-ecj.jar "${pkgdir}"/usr/share/java/${pkgname}/ecj.jar

  ln -s /usr/share/java/${pkgname} "${pkgdir}"/usr/share/${pkgname}/lib

  # We log through systemd but this would still be required for stock Tomcat logging
  install -dm775 -o ${_uid_tomcat} -g ${_gid_log} "${pkgdir}"/var/log/${pkgname}
  ln -s /var/log/${pkgname} "${pkgdir}"/usr/share/${pkgname}/logs
  touch "${pkgdir}"/var/log/${pkgname}/catalina.{out,err}
  chgrp ${_gid_log} "${pkgdir}"/var/log/${pkgname}/catalina.{out,err}

  install -dm775 "${pkgdir}"/etc/${pkgname}
  install -g ${_gid_tomcat} -m640 conf/* "${pkgdir}"/etc/${pkgname}
  install -d -g ${_gid_tomcat} -m775 "${pkgdir}"/etc/${pkgname}/Catalina
  ln -s /etc/${pkgname} "${pkgdir}"/usr/share/${pkgname}/conf

  install -dm775 "${pkgdir}"/var/lib/${pkgname}
  cp -r webapps "${pkgdir}"/var/lib/${pkgname}
  chown -R ${_uid_tomcat}:${_gid_tomcat} "${pkgdir}"/var/lib/${pkgname}
  chmod 775 "${pkgdir}"/var/lib/${pkgname}/webapps
  ln -s /var/lib/${pkgname}/webapps "${pkgdir}"/usr/share/${pkgname}/webapps

  install -dm1777 "${pkgdir}"/var/tmp
  install -dm775 -o ${_uid_tomcat} -g ${_gid_tomcat} "${pkgdir}"/var/tmp/${pkgname}/{temp,work}
  ln -s /var/tmp/${pkgname}/temp "${pkgdir}"/usr/share/${pkgname}/temp
  ln -s /var/tmp/${pkgname}/work "${pkgdir}"/usr/share/${pkgname}/work

  install -Dm644 "${srcdir}"/systemd_${pkgname}.service \
                 "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 "${srcdir}"/systemd_sysusers.d_${pkgname}.conf \
                 "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 "${srcdir}"/systemd_tmpfiles.d_${pkgname}.conf \
                 "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
