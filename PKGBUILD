pkgname=tomcat9
pkgver=9.0.14
pkgrel=1
pkgdesc='Open source implementation of the Java Servlet 4.0 and JavaServer Pages 2.3 technologies'
arch=('any')
url='http://tomcat.apache.org/'
license=('APACHE')
depends=('java-runtime>=8' 'java-jsvc' 'java-commons-daemon' 'eclipse-ecj')
optdepends=('tomcat-native: to allow optimal performance in production environments')
backup=(etc/${pkgname}/catalina.policy
        etc/${pkgname}/catalina.properties
        etc/${pkgname}/context.xml
        etc/${pkgname}/logging.properties
        etc/${pkgname}/server.xml
        etc/${pkgname}/tomcat-users.xml
        etc/${pkgname}/web.xml)
install=${pkgname}.install
source=(https://archive.apache.org/dist/tomcat/tomcat-9/v${pkgver}/bin/apache-tomcat-${pkgver}.tar.gz{,.asc}
        systemd_${pkgname}.service
        systemd_sysusers.d_${pkgname}.conf
        systemd_tmpfiles.d_${pkgname}.conf)
validpgpkeys=('A9C5DF4D22E99998D9875A5110C01C5A2F6059E7'  # Mark E D Thomas
              '713DA88BE50911535FE716F5208B0AB1D63011C7') # Violeta Georgieva Georgieva
sha256sums=('5bdb23aaccb12c2bf087c2aa2193813c597b8f7443a614fdd78d971fb6a63c16'
            'SKIP'
            'df2199080b3e4061eb8d454045428d7d340e527972c497309f69392ab2e3186f'
            '63d8a28af96e6c7232595e7eab3bb7930f0eebcd89a5b1e3bc17b80cb2580db5'
            '5cf1be7e6975c909d9935b2226a5aec4f783de154d910d3b65860286a3ce2a7b')
_gid_log=19
_gid_tomcat=58
_uid_tomcat=58

package() {
  cd "${srcdir}/apache-tomcat-${pkgver}"

  # Tomcat general files
  install -dm755 "${pkgdir}"/usr/share/{,java/}${pkgname}
  cp -r bin "${pkgdir}"/usr/share/${pkgname}
  chmod 755 "${pkgdir}"/usr/share/${pkgname}/bin
  chmod 644 "${pkgdir}"/usr/share/${pkgname}/bin/*
  chmod 755 "${pkgdir}"/usr/share/${pkgname}/bin/*.sh
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
