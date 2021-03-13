# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Olli <olli@suruatoel.xyz>

pkgname=tomcat10
pkgver=10.0.4
pkgrel=1
pkgdesc='Open source implementation of the Java Servlet 5.0 and JavaServer Pages 3.0 technologies'
arch=(any)
url=https://tomcat.apache.org/
license=(APACHE)
depends=(
  'java-runtime>=8'
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
  etc/tomcat10/catalina.policy
  etc/tomcat10/catalina.properties
  etc/tomcat10/context.xml
  etc/tomcat10/logging.properties
  etc/tomcat10/server.xml
  etc/tomcat10/tomcat-users.xml
  etc/tomcat10/web.xml
)
install=tomcat10.install
source=(
  git+https://github.com/apache/tomcat.git#tag=${pkgver}
  tomcat10.service
  tomcat10.sysusers
  tomcat10.tmpfiles
)
b2sums=('SKIP'
        '2bdf5f9e0ff8766363b2f0ac636415ee416bcfc3f4cc2859e1917d5352da827d0d25dc1c81260c38c1cf3e149d3701931b5a6bd0f32daeed9af4612dbc0b1f72'
        'ab6584d66e0e2e4d094a54d658af6e6397cbfee56ed211a6add84763d3b89c9e260127387a318c531f23182abde59c2289986773658f45e1c877687e1233b477'
        '79ef7469fd113253479e212ed5faf9ec7e0e55b4eba25a120d1e3814b35241b6f8f2e78b1b36554088c8944b2652b8e304fd16615132db057e76a32a7778a39d')


_gid_log=20
_gid_tomcat=59
_uid_tomcat=59

pkgver() {
  cd tomcat

  _pkgver=$(git describe --tags)

  if [[ ${_pkgver} != 10.* ]]; then
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
  install -dm 755 "${pkgdir}"/usr/share/tomcat10/bin
  install -m 755  bin/* -t "${pkgdir}"/usr/share/tomcat10/bin/
  # commons-daemon is packaged on its own
  rm "${pkgdir}"/usr/share/tomcat10/bin/{*.bat,commons-daemon*}
  ln -s /usr/share/java/commons-daemon.jar "${pkgdir}"/usr/share/tomcat10/bin/commons-daemon.jar

  install -dm 755 "${pkgdir}"/usr/share/java/tomcat10
  install -m 644 lib/* -t "${pkgdir}"/usr/share/java/tomcat10/
  # eclipse-ecj is packaged on its own
  rm "${pkgdir}"/usr/share/java/tomcat10/ecj-*.jar
  ln -s ../eclipse-ecj.jar "${pkgdir}"/usr/share/java/tomcat10/ecj.jar

  ln -s /usr/share/java/tomcat10 "${pkgdir}"/usr/share/tomcat10/lib

  # We log through systemd but this would still be required for stock Tomcat logging
  install -dm 775 -o ${_uid_tomcat} -g ${_gid_log} "${pkgdir}"/var/log/tomcat10
  ln -s /var/log/tomcat10 "${pkgdir}"/usr/share/tomcat10/logs
  touch "${pkgdir}"/var/log/tomcat10/catalina.{out,err}
  chgrp ${_gid_log} "${pkgdir}"/var/log/tomcat10/catalina.{out,err}

  install -dm 775 "${pkgdir}"/etc/tomcat10
  install -m 640 -g ${_gid_tomcat} conf/* -t "${pkgdir}"/etc/tomcat10/

  install -dm 775 -g ${_gid_tomcat} "${pkgdir}"/etc/tomcat10/Catalina
  ln -s /etc/tomcat10 "${pkgdir}"/usr/share/tomcat10/conf

  install -dm 775 "${pkgdir}"/var/lib/tomcat10
  cp -dr --no-preserve=ownership webapps "${pkgdir}"/var/lib/tomcat10/
  chown -R ${_uid_tomcat}:${_gid_tomcat} "${pkgdir}"/var/lib/tomcat10
  chmod 775 "${pkgdir}"/var/lib/tomcat10/webapps
  ln -s /var/lib/tomcat10/webapps "${pkgdir}"/usr/share/tomcat10/webapps

  install -dm 1777 "${pkgdir}"/var/tmp
  install -dm 775 -o ${_uid_tomcat} -g ${_gid_tomcat} "${pkgdir}"/var/tmp/tomcat10/{temp,work}
  ln -s /var/tmp/tomcat10/temp "${pkgdir}"/usr/share/tomcat10/temp
  ln -s /var/tmp/tomcat10/work "${pkgdir}"/usr/share/tomcat10/work

  install -Dm 644 ../../../tomcat10.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 ../../../tomcat10.sysusers "${pkgdir}"/usr/lib/sysusers.d/tomcat10.conf
  install -Dm 644 ../../../tomcat10.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/tomcat10.conf
}

# vim: ts=2 sw=2 et:
