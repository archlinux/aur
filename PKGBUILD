# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>

pkgname=tomcat8
pkgver=8.5.78
pkgrel=2
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
makedepends=(
  ant
  git
  java-environment=8
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
_tag=f732d3aa5ca55eb07cb73d9ec2b585330f80f00b
source=(
  git+https://github.com/apache/tomcat.git#tag=${_tag}
  tomcat8.service
  tomcat8.sysusers
  tomcat8.tmpfiles
)
b2sums=('SKIP'
        'b573a5c2d081539c57c35655c612108ae5ece6e362d887170fa52888272480f17f4e6637f378e9fbdf9cb992d91ce63f4fb45d2fca62b31fa1c817ae4465e94c'
        'e2b63275530ce7e57756ccf6f3934506245888dbc41005275e039e25712c13d37c2f28fd3af0c1dcace1dabe7a1e33d7f056f4c3c8f4a336f952fd7de46345ef'
        'a0e3052408ad8c64c88fcc7d4c3a883c16e7fd0d89a22fd6e89480b2021fc7fb4acf6f9b2ded78e64ebe9c2afb8bf85742da0299666b22f5cf6f63166ce1b141')

_gid_log=19
_gid_tomcat=57
_uid_tomcat=57

pkgver() {
  cd tomcat

  _pkgver=$(git describe --tags)

  if [[ ${_pkgver} != 8.* ]]; then
    exit 1
  fi

  echo ${_pkgver}
}

prepare() {
  cd tomcat

  cp build.properties.default build.properties
  sed "/^base\.path=/c\base\.path=${srcdir}" -i build.properties
  sed "/^compile.debug=/c\compile.debug=false" -i build.properties
  sed "/^trydownload.httpusecaches=/c\trydownload.httpusecaches=false" -i build.properties
}

build() {
  cd tomcat

  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  export PATH="$JAVA_HOME/bin:$PATH"

  ant
}

package() {
  cd tomcat/output/build

  # Tomcat general files
  install -dm 755 "${pkgdir}"/usr/share/tomcat8/bin
  install -m 755  bin/* -t "${pkgdir}"/usr/share/tomcat8/bin/
  # commons-daemon is packaged on its own
  rm "${pkgdir}"/usr/share/tomcat8/bin/{*.bat,commons-daemon*}
  ln -s /usr/share/java/commons-daemon.jar "${pkgdir}"/usr/share/tomcat8/bin/commons-daemon.jar

  install -dm 755 "${pkgdir}"/usr/share/java/tomcat8
  install -m 644 lib/* -t "${pkgdir}"/usr/share/java/tomcat8/
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
  install -m 640 -g ${_gid_tomcat} conf/* -t "${pkgdir}"/etc/tomcat8/

  install -dm 775 -g ${_gid_tomcat} "${pkgdir}"/etc/tomcat8/Catalina
  ln -s /etc/tomcat8 "${pkgdir}"/usr/share/tomcat8/conf

  install -dm 775 "${pkgdir}"/var/lib/tomcat8
  cp -dr --no-preserve=ownership webapps "${pkgdir}"/var/lib/tomcat8/
  chown -R ${_uid_tomcat}:${_gid_tomcat} "${pkgdir}"/var/lib/tomcat8
  chmod 775 "${pkgdir}"/var/lib/tomcat8/webapps
  ln -s /var/lib/tomcat8/webapps "${pkgdir}"/usr/share/tomcat8/webapps

  install -dm 1777 "${pkgdir}"/var/tmp
  install -dm 775 -o ${_uid_tomcat} -g ${_gid_tomcat} "${pkgdir}"/var/tmp/tomcat8/{temp,work}
  ln -s /var/tmp/tomcat8/temp "${pkgdir}"/usr/share/tomcat8/temp
  ln -s /var/tmp/tomcat8/work "${pkgdir}"/usr/share/tomcat8/work

  install -Dm 644 ../../../tomcat8.service "${pkgdir}"/usr/lib/systemd/system/tomcat8.service
  install -Dm 644 ../../../tomcat8.sysusers "${pkgdir}"/usr/lib/sysusers.d/tomcat8.conf
  install -Dm 644 ../../../tomcat8.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/tomcat8.conf
}

# vim: ts=2 sw=2 et:
