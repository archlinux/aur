# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=GC_NMQ_PAL_F
verdesc="Ocarina of Time Gamecube Europe PAL"
pkgname=soh-otr-${vername,,}
pkgver=5.1.4.r35.g37f31116b
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
sha256sums=('f788793d27aac3f8d91be5f242c4134217c615bfddd5c70384521ea2153435d2')

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
    -b baserom.z64 -fl "assets/extractor/filelists" -o . -osf . -gsf 1 \
    -rconf "assets/extractor/Config_${vername}.xml" -se OTR --otrfile oot.otr
}

package() {
  cd "${srcdir}"

  install -Dm644 oot.otr -t "${pkgdir}/${SHIP_PREFIX}"
}

