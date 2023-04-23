# Maintainer: Ben Alex <ben.alex@acegi.com.au>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: bgh <aur at bgh dot io>

pkgname=ib-tws
pkgver=10.22.1i
pkgrel=3
epoch=1
pkgdesc='Electronic trading platform from discount brokerage firm Interactive Brokers'
arch=('any')
url="http://interactivebrokers.com/"
license=('custom')
backup=('etc/ib-tws.conf' 'etc/ib-gw.conf')
depends=(gtk2)
optdepends=(ffmpeg-compat-55)
makedepends=(libarchive)

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
            '8e18bf962892e027d574fb108f8de9cf3b009e18f33d5d723de7eba2db4116d6')

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
  rm -f "${HOME}"/Desktop/Trader\ Workstation*.desktop "${HOME}"/.local/share/applications/install4j_*-tws.desktop

  # icons
  bsdtar --extract --include trader/common/images/ibkr_icon_w12.32_h24.svg --strip-components=3 \
    --to-stdout --file jts4launch-*.jar | tee ib-tws.svg ib-gw.svg
  sed --in-place --expression='s/{fill: #911421;}/{fill: #0d0d0d;}/' \
    --expression='s/{fill: #d81222;}/{fill: #161616;}/' ib-gw.svg # recolor gw icon to differentiate
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
  mkdir -p ${pkgdir}/usr/share/icons/
  install -Dm644 ib-*.svg "${pkgdir}/usr/share/icons/"
  mkdir -p ${pkgdir}/usr/share/${pkgname}/jre
  cp -R jre ${pkgdir}/usr/share/${pkgname}
  mkdir -p ${pkgdir}/usr/share/${pkgname}/jars
  install -Dm644 *.jar ${pkgdir}/usr/share/${pkgname}/jars
}
