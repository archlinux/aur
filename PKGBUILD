# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: James Bulmer <nekinie@gmail.com>
# Sources available at https://github.com/galaux/arch_kafka
pkgname=kafka
# You can change this for one of the Scala version upstream has already built
# against as explained on https://kafka.apache.org/downloads.html
# but do not remove the Scala jar as the Kafka tarball is compiled against it
# and __not__ against the one from the Scala package
_scalaver=2.11
_appver=0.8.2.1
pkgver=${_scalaver}_${_appver}
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc='A high-throughput distributed messaging system'
arch=('any')
url='http://kafka.apache.org/'
license=('Apache')
depends=('java-runtime' 'zookeeper')
backup=(etc/kafka/consumer.properties
        etc/kafka/log4j.properties
        etc/kafka/producer.properties
        etc/kafka/server.properties
        etc/kafka/test-log4j.properties
        etc/kafka/tools-log4j.properties
        etc/zookeeper/zookeeper-kafka/zoo.cfg
        etc/zookeeper/zookeeper-kafka/log4j.properties)
install=install_kafka.sh

_apache_cgi="http://www.apache.org/dyn/closer.cgi"
_closest=$(curl "${_apache_cgi}?asjson=1" | tr -d '\n ' | sed -r 's/.*"preferred":"(.+)".*/\1/')
_app_path="/${pkgname}/${_appver}/${pkgname}_${_pkgver}.tgz"
source=(${_closest}/${_app_path}
        zookeeper_log4j.properties
        systemd_kafka.service
        systemd_sysusers.d_kafka.conf
        systemd_tmpfiles.d_kafka.conf)

sha256sums=('9fb84546149b477bdbf167da8ca880a2c1199aeb24b2d5cd17aac0973ba4e54b'
            '00780ee4cea3bb7a282a548f41b8964d5e392776f9d687ebea89cd49ed5742e3'
            'e1a5ad12c4f0873740f4c34817bd6733a9b1541c68f2bb3aab3ac1be591f1fde'
            'dc1f3f94662339bcfb5cd4d058c06431f0e3d37e59f8c66a870e8fb02d9b5079'
            'a2258d4a06c0fcf7f7d5367c616b0a220bbd3d35256dfb3d5f790e61ac9a98f5')

package() {
  cd "${srcdir}/${pkgname}_${_pkgver}"

  _app_home=/usr/share/${pkgname}

  install -d "${pkgdir}"{${_app_home}/bin,/usr/bin,/usr/share/java/${pkgname}}
  install -d "${pkgdir}"/etc/zookeeper/zookeeper-${pkgname} \
             "${pkgdir}"/etc/${pkgname}

  cp -r config/* "${pkgdir}/etc/${pkgname}"
  sed -i "s|^log.dirs=/tmp/kafka-logs$|log.dirs=/var/lib/${pkgname}|" \
    "${pkgdir}/etc/${pkgname}/server.properties"
  mv "${pkgdir}/etc/${pkgname}/zookeeper.properties" \
     "${pkgdir}/etc/zookeeper/zookeeper-${pkgname}/zoo.cfg"
  sed -i "s|^dataDir=/tmp/zookeeper$|dataDir=/var/lib/zookeeper/zookeeper-${pkgname}|" \
    "${pkgdir}/etc/zookeeper/zookeeper-${pkgname}/zoo.cfg"

  install -D -m 644 ${srcdir}/zookeeper_log4j.properties \
    "${pkgdir}/etc/zookeeper/zookeeper-${pkgname}/log4j.properties"

  ln -s /etc/${pkgname} "${pkgdir}${_app_home}/config"

  cp -r bin/kafka-* "${pkgdir}${_app_home}/bin/"
  rm -rf "${pkgdir}${_app_home}/bin/windows"
  sed -i "s|\$(dirname \$0)|${_app_home}/bin|" "${pkgdir}"${_app_home}/bin/*
  for b in "${pkgdir}"${_app_home}/bin/*; do
    bname=$(basename $b)
    ln -s ${_app_home}/bin/${bname} "${pkgdir}/usr/bin/${bname}"
  done
  install bin/zookeeper-shell.sh "${pkgdir}${_app_home}/bin/zookeeper-shell.sh"
  ln -s ${_app_home}/bin/zookeeper-shell.sh "${pkgdir}/usr/bin/kafka-zookeeper-shell.sh"
  ln -s ../../java/zookeeper/zookeeper.jar \
    "${pkgdir}/usr/share/java/${pkgname}/zookeeper.jar"

  cp -r libs/* "${pkgdir}/usr/share/java/${pkgname}"
  rm "${pkgdir}"/usr/share/java/${pkgname}/zookeeper-*
  ln -s ../java/${pkgname} "${pkgdir}${_app_home}/libs"

  ln -s /var/log/${pkgname} "${pkgdir}${_app_home}/logs"

  install -D -m 644 "${srcdir}/systemd_kafka.service" \
    "${pkgdir}/usr/lib/systemd/system/kafka.service"

  install -D -m 644 ${srcdir}/systemd_sysusers.d_kafka.conf \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m 644 "${srcdir}/systemd_tmpfiles.d_kafka.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/kafka.conf"
}
