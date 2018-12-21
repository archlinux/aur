# Maintainer: Ben Alex <ben.alex@acegi.com.au>
# Contributor: Jon Wiersma <archaur@jonw.org>

pkgname=ib-tws
pkgver=974.4g
pkgrel=1
pkgdesc='Electronic trading platform from discount brokerage firm Interactive Brokers'
arch=('any')
url="http://interactivebrokers.com/"
license=('custom')
backup=('etc/ib-tws.conf' 'etc/ib-gw.conf')
depends=(bash)
optdepends=(ffmpeg)
makedepends=(gtk2 imagemagick unzip)

source=('LICENSE'
	'ib-tws'
	'ib-tws.conf'
	'ib-tws.desktop'
	'ib-gw'
	'ib-gw.conf'
	'ib-gw.desktop'
	'https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-linux-x64.sh')
md5sums=('e1cae2de592add7133bb08123e8db1ad'
         '428c553da90bb2ea650a7f96ae076937'
         '1ec45ec225b8dcd362634f7395e8cd0d'
         '9205b5eade96d69f8e470cc52c30db4a'
         'b1cbe7273f3d0f2f0b6a09e65606b600'
         '238637fb4ab6ae734bade474709bafb1'
         'ffa9fcfb623850e5c9e796040bdbd052'
         '6b815ab4a67f442d581bbe02f18940b7')

build() {
  cd ${srcdir}
  chmod +x tws-latest-standalone-linux-x64.sh
  # Assumes no other Install4J packages are in use by user; if so, makepkg from dedicated user account
  majorVer=$(echo "$pkgver" | sed "s/\([0-9]\+\)\..*/\1/")
  rm -rf $HOME/.install4j $HOME/.i4j_jres $HOME/Jts/${majorVer} $HOME/Desktop/Trader\ Workstation\ ${majorVer}.desktop
  ./tws-latest-standalone-linux-x64.sh -q

  BUNDLED_JRE_VER=$(ls -1 ${HOME}/.i4j_jres)
  mv ${HOME}/.i4j_jres/${BUNDLED_JRE_VER} ${HOME}/.i4j_jres/jre
  mv ${HOME}/.i4j_jres/jre ${srcdir}/jre
  mv ${HOME}/Jts/${majorVer}/jars/*.jar ${srcdir}
  rm -rf $HOME/.install4j $HOME/.i4j_jres $HOME/Jts/${majorVer} $HOME/Desktop/Trader\ Workstation\ ${majorVer}.desktop
  cd ${srcdir}

  # Thanks to http://finance.groups.yahoo.com/group/TWSAPI/files/RPM%20spec%20file/
  unzip jts4launch-${majorVer}.jar trader/common/images/ibapp_icon_48x48.gif
  unzip jts4launch-${majorVer}.jar trader/common/images/quote_details_48x48.jpg
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
  install -Dm644 ${pkgname}.conf ${pkgdir}/etc/$pkgname.conf
  install -Dm644 ib-gw.conf ${pkgdir}/etc/ib-gw.conf
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ib-gw.desktop ${pkgdir}/usr/share/applications/ib-gw.desktop
  mkdir -p ${pkgdir}/usr/share/pixmaps/
  install -Dm644 *.png "${pkgdir}/usr/share/pixmaps/"
  mkdir -p ${pkgdir}/usr/share/${pkgname}/jre
  cp -R jre ${pkgdir}/usr/share/${pkgname}
  mkdir -p ${pkgdir}/usr/share/${pkgname}/jars
  install -Dm644 *.jar ${pkgdir}/usr/share/${pkgname}/jars
}
