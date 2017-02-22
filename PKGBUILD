# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=opengts
pkgver=2.6.3
pkgrel=1
pkgdesc="A full featured web-based GPS tracking system for your fleet of vehicles"
arch=('i686' 'x86_64')
url="http://opengts.sourceforge.net/"
license=('APACHE')
depends=('java-runtime' 'mariadb-jdbc' 'java-gnumail' 'tomcat7' 'mariadb')
makedepends=('apache-ant')
install=opengts.install
source=("http://prdownloads.sourceforge.net/opengts/OpenGTS_${pkgver}.zip"
	'build.xml'
	'opengts.csh'
	'opengts.sh')

package() {
  cd ${srcdir}/OpenGTS_${pkgver}
  export CATALINA_HOME=/usr/share/tomcat7/
#  cp ../build.xml .
  ant all
  mkdir -p $pkgdir/usr/share/tomcat7/webapps/
  cp build/*.war $pkgdir/usr/share/tomcat7/webapps/
  mkdir -p $pkgdir/opt/opengts
  cp -r bin $pkgdir/opt/opengts/
  # install profile.d script
  install -dm755 ${pkgdir}/etc/profile.d
  install -m755 "${srcdir}"/${pkgname}.{csh,sh} ${pkgdir}/etc/profile.d/

  # remove .bat files
  rm $pkgdir/opt/opengts/bin/*.bat

  # Pdf Guide installation
  cp OpenGTS_Config.pdf ${pkgdir}/opt/opengts/
}

md5sums=('19ba4d99791a613a8af9aa284640f2d7'
         'eaa24afc6598fad65c0aed030ebf37c8'
         '841e957e78f0a617fe89e7c9bb66132d'
         '9e8981a8ad668801e8fa07405fa281f0')
