# Maintainer: Ben Alex <ben.alex@acegi.com.au>
# Contributor: Jon Wiersma <archaur@jonw.org>

pkgname=ib-tws
pkgver=10.20.1f
pkgrel=1
epoch=1
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
            'b6aaf7a0f026b5829d5e061e5e73037915ac4b722f96eaca5f03741d54fe6d0a')

build() {
  cd ${srcdir}
  rm -rf ${srcdir}/target ${srcdir}/jre
  mkdir ${srcdir}/target ${srcdir}/jre

  chmod +x tws-${pkgver}-standalone-linux-x64.sh
  ./tws-${pkgver}-standalone-linux-x64.sh -q -dir ${srcdir}/target

  # install4j provides a "shared" JRE that may go into /opt, /usr/local or $HOME/.i4j_jres/.
  # If it already exists, the install4j log will include a "java.home=" truncated path.
  BUNDLED_JRE_LOCATION=$(grep java.home ${srcdir}/target/.install4j/installation.log | head -n 1 | cut -d '=' -f 2 | sed 's/\.\.\.//g')
  if [ -z "${BUNDLED_JRE_LOCATION}" ]; then
    echo "java.home JRE location could not be found in the log"
    exit 1
  fi
  BUNDLED_JRE_LOCATION=$(echo ${BUNDLED_JRE_LOCATION}*/*)
  echo "java.home JRE location expanded to ${BUNDLED_JRE_LOCATION}"

  if [ ! -f "${BUNDLED_JRE_LOCATION}/bin/java" ]; then
    echo "java.home JRE location did not contain java; finding log entry which installed java"
    BUNDLED_JRE_LOCATION=$(grep -e "Install file.*\/java\;" ${srcdir}/target/.install4j/installation.log | head -n 1 | cut -d ';' -f 1|sed -e 's/ .*Install file\: //g'|sed 's/\/bin\/java//')
    if [ -z "${BUNDLED_JRE_LOCATION}" ]; then
      echo "Could not find bundled JRE installation entry in log"
      exit 1
    fi
  fi
  if [ -f "${BUNDLED_JRE_LOCATION}/bin/java" ]; then
    echo "Confirmed java in ${BUNDLED_JRE_LOCATION}"
  else
    echo "Cannot find java; last tried ${BUNDLED_JRE_LOCATION}"
    exit 1
  fi

  # copy the bundled JRE (do not move it as other install4j applications may be sharing it)
  cp -r "${BUNDLED_JRE_LOCATION}"/* ${srcdir}/jre
  mv ${srcdir}/target/jars/*.jar ${srcdir}
  rm -f "${HOME}"/Desktop/Trader\ Workstation*.desktop

  # Thanks to http://finance.groups.yahoo.com/group/TWSAPI/files/RPM%20spec%20file/
  unzip -o jts4launch-*.jar trader/common/images/ibapp_icon_48x48.gif
  unzip -o jts4launch-*.jar trader/common/images/quote_details_48x48.jpg
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
