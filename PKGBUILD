# Wildfly Application Server package
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>
# Maintainer: Zdenek Obst <zdenek dot obst at gmail dot com>

pkgname=wildfly
pkgver=15.0.0.Final
pkgrel=1

pkgdesc='Wildfly Application Server'
arch=('any')
url='http://www.wildfly.org/'
license=('LGPL')
depends=('java-runtime>=8')
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

sha256sums=('52a41ca0e36dc41800214e6a8f4e0032276477299804e6a719ba1ffe35d37a92'
            '65e4b22b106aa16413e5c95686969b3f16974235451d8445ce4c562299325412'
            '3b2d059fcecb799ea8134b23ee0b77b4bc53dd99c7bd541679c4c139638b323a'
            'a360ddb4beb9c704257bd78e08e8eea69c43b410a9c93d346541158c3b9d4330'
            '922035fcf68a66ed4b36a89370d2335941cb64ef8561e81fa6f59b5784f659e1')

sha512sums=('bbcd90577f04579b4ae61943c228fe961984a50f601c132867ca1a73efaea0550fb3d36f94dee23a90a69dd8b494e28e91964723f9b327c863773c7d3cdfb42e'
            'cab55d727ea2be620dba204c63a5156fe23386475d242d9988101174eaec7a58524e97e90947f522a09c9d9df6e18cb9e06af56edb9a693796f25f840f553fb3'
            'b5ce879d81cfe825b75edb97de27c7f4c75465cb514fc500f5f7ab9fef9fb87142456692f29a3f327981631a28755d02b7edf9368e5b5d09b372a6606a457d16'
            'd0bbd9e446d3e3640a13c64ee7dde15ff4527cccaa4c66814d262b54c8b22a8603ebe8ef8afa578a56732137a9b2fcf4e313d1c9768c2b356f3c8fbfeaa9453a'
            '73ef19d07c79a9b644511209e11b04a0c23c837593ed27a6221989fda415d9bbd789ae2dbfa292236d37536aae317fc3612391311db58816549c44960d611dc9')

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
