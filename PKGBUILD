# Maintainer: Cosmo Guerini <cosmo@cosmo.red>
# Contributor: Thor77 <thor77 at thor77 dot org>
# Contributor: Cody Ramaker <cramaker@linux.com>
# Contributor: Andreas Nüßlein <nutz@noova.de>
# Contributor: Ben Edwards <ben@artfuldodge.io>
# Contributor: Ben Alex <ben.alex@acegi.com.au>
# Contributor: Scott Lawrence <bytbox@gmail.com>
# Contributor: Guillaume ALAUX <guillaume at alaux dot net>
pkgname=zookeeper
pkgver=3.9.4
pkgrel=1
pkgdesc='Open-source server which enables highly reliable distributed coordination'
arch=('any')
url='https://zookeeper.apache.org/'
license=('Apache')
depends=('java-runtime')
backup=(etc/zookeeper/configuration.xsl
        etc/zookeeper/zoo.cfg
        etc/zookeeper/logback.xml)
install=install_zookeeper.sh

source=("https://archive.apache.org/dist/zookeeper/zookeeper-${pkgver}/apache-zookeeper-${pkgver}-bin.tar.gz"
        systemd_zookeeper.service
        systemd_zookeeper@.service
        systemd_sysusers.d_zookeeper.conf
        systemd_tmpfiles.d_zookeeper.conf)

sha256sums=('c5b7cbda0b1b59d724e552d33775983f8a366bf651ba484937d0559d97bf0ae9'
            '58de7a5bf6fddc2b86d5d56269c970f8c5b60316a4d45b6e030cb970871669ba'
            '4b18f321cdd3944115a5b87f9b14f5b564280045e01a3e9d704cc5cccd47ee57'
            'e863b63650c15a8823cfb2b507c375c999a71cda24805062de36af0250de5daa'
            '99fff5b04623889b0010c74c2dc3a4be29e7770fe2c7e15da51f7442a28c6580')

package() {
  cd "${srcdir}/apache-${pkgname}-${pkgver}-bin"

  _app_home=/usr/share/${pkgname}

  install -d "${pkgdir}"{${_app_home}/bin,/etc,/usr/bin,/usr/share/{doc,java}}

  cp -r conf ${pkgdir}/etc/${pkgname}/
  ln -s /etc/${pkgname} "${pkgdir}${_app_home}/conf"

  cp -r bin/*.sh  "${pkgdir}${_app_home}/bin/"
  sed -i "s|^ZOOBIN=\"\$(dirname \"\${ZOOBIN}\")\"|ZOOBIN=\"${_app_home}/bin\"|" \
    "${pkgdir}"${_app_home}/bin/*
  for b in zkCleanup.sh zkCli.sh zkServer.sh; do
    bname=$(basename $b)
    ln -s ${_app_home}/bin/${bname} "${pkgdir}/usr/bin/${bname}"
  done

  cp -r lib "${pkgdir}/usr/share/java/${pkgname}"
  rm -rf "${pkgdir}"/usr/share/java/${pkgname}/{jdiff,cobertura}
  ln -s ../java/${pkgname} "${pkgdir}${_app_home}/lib"

### As of 3.4.14, recipes are no longer held in a separate directory
#  cp -r recipes "${pkgdir}/usr/share/${pkgname}"

  install -m 644 "${srcdir}/apache-${pkgname}-${pkgver}-bin/lib/${pkgname}-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  ln -s ${pkgname}-${pkgver}.jar \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  ln -s lib/${pkgname}-${pkgver}.jar \
    "${pkgdir}/usr/share/${pkgname}/${pkgname}-${pkgver}.jar"

  install -D -m 644 "${srcdir}/systemd_zookeeper.service" \
    "${pkgdir}/usr/lib/systemd/system/zookeeper.service"
  install -D -m 644 "${srcdir}/systemd_zookeeper@.service" \
    "${pkgdir}/usr/lib/systemd/system/zookeeper@.service"
  install -D -m 644 "${srcdir}/systemd_sysusers.d_zookeeper.conf" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  sed "s|^dataDir=/tmp/zookeeper$|dataDir=/var/lib/${pkgname}|" \
    "${pkgdir}/etc/${pkgname}/zoo_sample.cfg" \
    > "${pkgdir}/etc/${pkgname}/zoo.cfg"
  install -D -m 644 "${srcdir}/systemd_tmpfiles.d_zookeeper.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/zookeeper.conf"
}
