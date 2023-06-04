# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=GC_NMQ_D
verdesc="Ocarina of Time Gamecube Europe PAL Debug"
pkgname=soh-otr-${vername,,}
pkgver=7.0.2.r60.g2308ab882
pkgrel=1
epoch=1   # For old versions of SoH, if available
pkgdesc="OTR game data for SoH (${verdesc})"
arch=("any")
url="https://shipofharkinian.com/"
license=("unknown")
provides=("soh-otr")
conflicts=("soh-otr")
makedepends=("soh-otr-exporter")
source=("file://baserom.z64")
sha256sums=('94bdeb4ab906db112078a902f4477e9712c4fe803c4efb98c7b97c3f950305ab')

SHIP_PREFIX=/opt/soh

pkgver() {
  pacman -Q soh-otr-exporter | sed -E 's/.* (.*)-.*$/\1/'
}

build() {
  cd "${srcdir}"

  [ -e oot.otr ] && rm oot.otr
  [ ! -e assets ] && ln -s ${SHIP_PREFIX}/assets assets
  [ -e Extract ] && rm -r Extract; mkdir Extract
  cp -r "${SHIP_PREFIX}"/assets/game Extract/assets/

  "assets/extractor/ZAPD.out" ed -eh -i "assets/extractor/xmls/${vername}" \
    -b baserom.z64 -fl "assets/extractor/filelists" -o . -osf . -gsf 0 \
    -rconf "assets/extractor/Config_${vername}.xml" -se OTR --otrfile oot.otr
}

package() {
  cd "${srcdir}"

  install -Dm644 oot.otr -t "${pkgdir}/${SHIP_PREFIX}"
}

