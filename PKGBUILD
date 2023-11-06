# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=GC_NMQ_PAL_F
verdesc="Ocarina of Time Gamecube Europe PAL"
pkgname=soh-otr-${vername,,}
pkgver=7.1.1.r151.g8b78cb832
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
OTRFILE=oot.otr

_get_extractor_ver() {
  pacman -Q soh-otr-exporter | sed -E 's/.* ((\.?[[:digit:]]*){3}).*$/\1/'
}

pkgver() {
  pacman -Q soh-otr-exporter | sed -E 's/.* (.*)-.*$/\1/'
}

build() {
  cd "${srcdir}"

  [ -e "$OTRFILE" ] && rm "$OTRFILE"
  [ -e assets ] && rm -rf assets

  cp -r "${SHIP_PREFIX}/assets" assets

  "assets/extractor/ZAPD.out" ed -eh \
    -i "assets/extractor/xmls/${vername}" -b baserom.z64 \
    -fl "assets/extractor/filelists" -o . -osf . -gsf 0 \
    -rconf "assets/extractor/Config_${vername}.xml" -se OTR --otrfile "$OTRFILE" --portVer "$(_get_extractor_ver)"
}

package() {
  cd "${srcdir}"

  install -Dm644 "$OTRFILE" -t "${pkgdir}/${SHIP_PREFIX}"
}
