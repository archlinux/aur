# Maintainer: Ben Alex <ben.alex@acegi.com.au>
# Contributor: Jon Wiersma <archaur@jonw.org>

pkgname=ib-tws
pkgver=985.1g
pkgrel=1
pkgdesc='Electronic trading platform from discount brokerage firm Interactive Brokers'
arch=('any')
url="http://interactivebrokers.com/"
license=('custom')
backup=('etc/ib-tws.conf' 'etc/ib-gw.conf')
depends=(bash)
optdepends=(ffmpeg-compat-55)
makedepends=(gtk2 imagemagick unzip)

source=('LICENSE'
	'ib-tws'
	'ib-tws.conf'
	'ib-tws.desktop'
	'ib-gw'
	'ib-gw.conf'
	'ib-gw.desktop'
	"tws-${pkgver}-standalone-linux-x64.sh"::'https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-linux-x64.sh')
sha256sums=('4b65b33dc88d77fef6e7ba1bdc1ae88b149296d3e1eb87db251bfcdf119a1f22'
            'e23256d8948a2a1adf7d69d99909738888b7d8a0adbd81578543312f1f509f66'
            'b359c8b5ccc7d884316ba9c88395450ff3a5dfd6af376741f091f837a5db7c26'
            '3a45eb7d43c0b7be2babc3fb0c83d723db2676eb1b608ecefc2f1415be8d7a62'
            '62fbd49b8c7fb5d4ae7491ca2b9072d42bbe589a2b9f0e14d09d1bf1177a3c46'
            '21070fa89c9053dff06ba799b6f9838bfd5ff209fd8dd710c5a97c3fc684af44'
            '9f74a204c45d47f551861cb231de89f2536f9966942da41f95d8f0ce5bcd13a4'
            '8a56aab94953d9c94a4fba9db26e4e135f3c4d55a34a9aadb067f596296a947e')

build() {
  cd ${srcdir}
  chmod +x tws-${pkgver}-standalone-linux-x64.sh
  # Assumes no other Install4J packages are in use by user; if so, makepkg from dedicated user account
  majorVer=$(echo "$pkgver" | sed "s/\([0-9]\+\)\..*/\1/")
  rm -rf $HOME/.install4j $HOME/.i4j_jres $HOME/tws $HOME/Desktop/Trader\ Workstation*.desktop $HOME/.local/share/applications/Trader\ Workstation*.desktop
  ./tws-${pkgver}-standalone-linux-x64.sh -q

  BUNDLED_JRE_VER=$(ls -1 ${HOME}/.i4j_jres)
  mv ${HOME}/.i4j_jres/${BUNDLED_JRE_VER} ${HOME}/.i4j_jres/jre
  mv ${HOME}/.i4j_jres/jre ${srcdir}/jre
  mv ${HOME}/tws/jars/*.jar ${srcdir}
  rm -rf $HOME/.install4j $HOME/.i4j_jres $HOME/tws $HOME/Desktop/Trader\ Workstation*.desktop $HOME/.local/share/applications/Trader\ Workstation*.desktop $HOME/.local/share/applications/install4j_*.desktop
  cd ${srcdir}

  # Thanks to http://finance.groups.yahoo.com/group/TWSAPI/files/RPM%20spec%20file/
  unzip -o jts4launch-${majorVer}.jar trader/common/images/ibapp_icon_48x48.gif
  unzip -o jts4launch-${majorVer}.jar trader/common/images/quote_details_48x48.jpg
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
