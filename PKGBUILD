# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ib-tws
pkgver=963.2c
pkgrel=1
pkgdesc='Electronic trading platform from discount brokerage firm Interactive Brokers'
arch=('any')
url="http://interactivebrokers.com/"
license=('custom')
depends=(java-environment bash)
makedepends=(imagemagick gzip tar)

source=('LICENSE'
	'ib-tws'
	'ib-tws.desktop'
	'ib-gw'
	'ib-gw.desktop'
	'https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-linux-x64.sh')
md5sums=('e1cae2de592add7133bb08123e8db1ad'
         'c407d22dfafdb33ec2fe97eeb5e9f0aa'
         '9205b5eade96d69f8e470cc52c30db4a'
         'c95eeb41fec3aae6ad5e82703a39060c'
         'ffa9fcfb623850e5c9e796040bdbd052'
         '96de3d4619b2d73ead0c8564cf0154e7')


build() {
  cd ${srcdir}
  chmod +x tws-latest-standalone-linux-x64.sh
  # Assumes no other Install4J packages are in use by user; if so, makepkg from dedicated user account
  majorVer=$(echo "$pkgver" | sed "s/\([0-9]\+\)\..*/\1/")
  rm -rf $HOME/.install4j $HOME/.i4j_jres $HOME/Jts/${majorVer}
  ./tws-latest-standalone-linux-x64.sh -q

  mv ${HOME}/Jts/${majorVer}/jars/*.jar ${srcdir}
  rm -rf $HOME/.install4j $HOME/.i4j_jres $HOME/Jts/${majorVer}
  cd ${srcdir}

  # Thanks to http://finance.groups.yahoo.com/group/TWSAPI/files/RPM%20spec%20file/
  jar xf jts4launch-${majorVer}.jar trader/common/images/ibapp_icon_48x48.gif
  jar xf jts4launch-${majorVer}.jar trader/common/images/quote_details_48x48.jpg
  convert trader/common/images/ibapp_icon_48x48.gif ${pkgname}.png
  convert trader/common/images/ibapp_icon_48x48.gif -resize 66.666% ${pkgname}-32x32.png
  convert trader/common/images/ibapp_icon_48x48.gif -resize 33.333% ${pkgname}-16x16.png
  convert trader/common/images/ibapp_icon_48x48.gif ${pkgname}-48x48.png
  convert trader/common/images/quote_details_48x48.jpg ib-gw.png
  convert trader/common/images/quote_details_48x48.jpg -resize 66.666% ib-gw-32x32.png
  convert trader/common/images/quote_details_48x48.jpg -resize 33.333% ib-gw-16x16.png
  convert trader/common/images/quote_details_48x48.jpg ib-gw-48x48.png
}

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ib-gw ${pkgdir}/usr/bin/ib-gw
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ib-gw.desktop ${pkgdir}/usr/share/applications/ib-gw.desktop
  mkdir -p ${pkgdir}/usr/share/pixmaps/
  install -Dm644 *.png "${pkgdir}/usr/share/pixmaps/"
  mkdir -p ${pkgdir}/usr/share/java/${pkgname}
  install -Dm644 *.jar ${pkgdir}/usr/share/java/${pkgname}
}
