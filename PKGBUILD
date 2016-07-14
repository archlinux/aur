# Wildfly Application Server package
# Maintainer: Zdenek Obst <zdenek dot obst at gmail dot com>

pkgname=wildfly
pkgver=10.0.0.Final
pkgrel=2

pkgdesc='Wildfly Application Server'
arch=('any')
url='http://www.wildfly.org/'
license=('LGPL')
depends=('java-runtime>=7')
conficts=('wildfly-devel')

_pkgloc=opt
backup=(etc/profile.d/${pkgname}.sh
        ${_pkgloc}/${pkgname}/domain/configuration/application-roles.properties
        ${_pkgloc}/${pkgname}/domain/configuration/application-users.properties
        ${_pkgloc}/${pkgname}/domain/configuration/logging.properties
        ${_pkgloc}/${pkgname}/domain/configuration/mgmt-groups.properties
        ${_pkgloc}/${pkgname}/domain/configuration/mgmt-users.properties
        ${_pkgloc}/${pkgname}/domain/configuration/domain.xml
        ${_pkgloc}/${pkgname}/domain/configuration/host.xml
        ${_pkgloc}/${pkgname}/standalone/configuration/application-roles.properties
        ${_pkgloc}/${pkgname}/standalone/configuration/application-users.properties
        ${_pkgloc}/${pkgname}/standalone/configuration/logging.properties
        ${_pkgloc}/${pkgname}/standalone/configuration/mgmt-groups.properties
        ${_pkgloc}/${pkgname}/standalone/configuration/mgmt-users.properties
        ${_pkgloc}/${pkgname}/standalone/configuration/standalone.xml
        ${_pkgloc}/${pkgname}/bin/add-user.properties
        ${_pkgloc}/${pkgname}/bin/appclient.conf
        ${_pkgloc}/${pkgname}/bin/domain.conf
        ${_pkgloc}/${pkgname}/bin/jboss-cli-logging.properties
        ${_pkgloc}/${pkgname}/bin/jboss-cli.xml
        ${_pkgloc}/${pkgname}/bin/standalone.conf)
install=${pkgname}.install
source=(http://download.jboss.org/wildfly/${pkgver}/wildfly-${pkgver}.tar.gz
        ${pkgname}.service
        ${pkgname}.sh
        ${pkgname}.install
	systemd-wrapper.sh)
sha256sums=('e00c4e4852add7ac09693e7600c91be40fa5f2791d0b232e768c00b2cb20a84b'
            '65e4b22b106aa16413e5c95686969b3f16974235451d8445ce4c562299325412'
            '3b2d059fcecb799ea8134b23ee0b77b4bc53dd99c7bd541679c4c139638b323a'
            'a360ddb4beb9c704257bd78e08e8eea69c43b410a9c93d346541158c3b9d4330'
            '922035fcf68a66ed4b36a89370d2335941cb64ef8561e81fa6f59b5784f659e1')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -f bin/*.{bat,exe}
  install -dm755 ${pkgdir}/${_pkgloc}
  cp -R ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/${_pkgloc}/${pkgname}

  # Prepare systemd service file
  install -Dm755 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service

  # Prepare file for environment variables to profile.d
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh

  # Include wrapper script for systemd startup
  install -Dm755 ${srcdir}/systemd-wrapper.sh ${pkgdir}/${_pkgloc}/${pkgname}/bin/systemd-wrapper.sh
}
