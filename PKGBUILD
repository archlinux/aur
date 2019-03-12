# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=tomcat8
pkgver=8.5.38
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
source=(https://archive.apache.org/dist/tomcat/tomcat-8/v${pkgver}/bin/apache-tomcat-${pkgver}.tar.gz
        systemd_${pkgname}.service
        systemd_sysusers.d_${pkgname}.conf
        systemd_tmpfiles.d_${pkgname}.conf)

sha512sums=('3a3e624014faf87091e6dbb8bad13c68240955d62301d22cf3d75a1766859dd97500d6850fbd5d3dc012f08f9301eb24c24fa7175bcca616767fa5c18875072d'
            '114c62af0adf4243d210b2f3d7a9a51ca448a7105d38ef4a6587903eac716ad552989bfee76af933cf0022bad374a8dcb1b932abb8e902a93f72dec0aadd7ab7'
            '7b505c79e495c35f787f300cd786e9f474ba2df61f8a50e21d2480de6a4c27a409b627447d1e4cb2fb543f81c107cbb30adbbc31a29754d0fe8e6908ea61cd7a'
            'f5d819afa9b01adbe1f09267a64d1d35f994db48c7af9c49b1731305e82e0306561a24d6b6d4a33116dcd4990989d8a7a9c52532b003d480c0522e63b976c815')

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
