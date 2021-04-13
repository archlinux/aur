# Maintainer: Flavius Aspra <flavius.as at gmail dot com>
# Contributor: Thor77 <thor77 at thor77 dot org>
# Contributor: Cody Ramaker <cramaker@linux.com>
# Contributor: Andreas Nüßlein <nutz@noova.de>
# Contributor: Ben Edwards <ben@artfuldodge.io>
# Contributor: Ben Alex <ben.alex@acegi.com.au>
# Contributor: Scott Lawrence <bytbox@gmail.com>
# Contributor: Guillaume ALAUX <guillaume at alaux dot net>
pkgname=zookeeper-stable
pkgcanonical=zookeeper
pkgver=3.6.3
pkgrel=1
pkgdesc='Open-source server which enables highly reliable distributed coordination'
arch=('any')
url='https://zookeeper.apache.org/'
license=('Apache')
depends=('java-runtime')
conflicts=('zookeeper')
provides=('zookeeper')
backup=(etc/zookeeper/configuration.xsl
        etc/zookeeper/log4j.properties
        etc/zookeeper/zoo.cfg)
install=install_zookeeper.sh

source=("https://downloads.apache.org/zookeeper/stable/apache-zookeeper-${pkgver}-bin.tar.gz"
        systemd_zookeeper.service
        systemd_zookeeper@.service
        systemd_sysusers.d_zookeeper.conf
        systemd_tmpfiles.d_zookeeper.conf)

sha256sums=('fed19a8e8daa3cd49e721d61929b90613dc0b19faa8ccb7d0b3a85db46b0c922'
            'b59e0641de1951ad149ca39df5b5ec37dc6229f1aa987b0ed9d7e82e570be9ed'
            'a3fd2566648f57c0cdd75cd48b7b60fa55eb59ee67dd716de1e1aa6a57823b88'
            'e863b63650c15a8823cfb2b507c375c999a71cda24805062de36af0250de5daa'
            '99fff5b04623889b0010c74c2dc3a4be29e7770fe2c7e15da51f7442a28c6580')

package() {
  cd "${srcdir}/apache-${pkgcanonical}-${pkgver}-bin"

  _app_home=/usr/share/${pkgcanonical}

  install -d "${pkgdir}"{${_app_home}/bin,/etc,/usr/bin,/usr/share/{doc,java}}

  cp -r conf ${pkgdir}/etc/${pkgcanonical}/
  ln -s /etc/${pkgcanonical} "${pkgdir}${_app_home}/conf"

  cp -r bin/*.sh  "${pkgdir}${_app_home}/bin/"
  sed -i "s|^ZOOBIN=\"\$(dirname \"\${ZOOBIN}\")\"|ZOOBIN=\"${_app_home}/bin\"|" \
    "${pkgdir}"${_app_home}/bin/*
  for b in zkCleanup.sh zkCli.sh zkServer.sh; do
    bname=$(basename $b)
    ln -s ${_app_home}/bin/${bname} "${pkgdir}/usr/bin/${bname}"
  done

  cp -r lib "${pkgdir}/usr/share/java/${pkgcanonical}"
  rm -rf "${pkgdir}"/usr/share/java/${pkgcanonical}/{jdiff,cobertura}
  ln -s ../java/${pkgcanonical} "${pkgdir}${_app_home}/lib"

### As of 3.4.14, recipes are no longer held in a separate directory
#  cp -r recipes "${pkgdir}/usr/share/${pkgcanonical}"

  install -m 644 "${srcdir}/apache-${pkgcanonical}-${pkgver}-bin/lib/${pkgcanonical}-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/${pkgcanonical}/${pkgcanonical}-${pkgver}.jar"
  ln -s ${pkgcanonical}-${pkgver}.jar \
    "${pkgdir}/usr/share/java/${pkgcanonical}/${pkgcanonical}.jar"
  ln -s lib/${pkgcanonical}-${pkgver}.jar \
    "${pkgdir}/usr/share/${pkgcanonical}/${pkgcanonical}-${pkgver}.jar"

  install -D -m 644 "${srcdir}/systemd_zookeeper.service" \
    "${pkgdir}/usr/lib/systemd/system/zookeeper.service"
  install -D -m 644 "${srcdir}/systemd_zookeeper@.service" \
    "${pkgdir}/usr/lib/systemd/system/zookeeper@.service"
  install -D -m 644 "${srcdir}/systemd_sysusers.d_zookeeper.conf" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgcanonical}.conf"
  sed "s|^dataDir=/tmp/zookeeper$|dataDir=/var/lib/${pkgcanonical}|" \
    "${pkgdir}/etc/${pkgcanonical}/zoo_sample.cfg" \
    > "${pkgdir}/etc/${pkgcanonical}/zoo.cfg"
  install -D -m 644 "${srcdir}/systemd_tmpfiles.d_zookeeper.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/zookeeper.conf"
}
