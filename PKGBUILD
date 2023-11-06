# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=GC_MQ_PAL_F
verdesc="Ocarina of Time Master Quest Europe PAL"
pkgname=soh-otr-${vername,,}
pkgver=7.1.1.r151.g8b78cb832
pkgrel=1
epoch=1   # For old versions of SoH, if available
pkgdesc="OTR game data for SoH (${verdesc})"
arch=("any")
url="https://shipofharkinian.com/"
license=("unknown")
provides=("soh-otr-mq")
conflicts=("soh-otr-mq")
makedepends=("soh-otr-exporter")
source=("file://baserom.z64")
sha256sums=('ed392a890d5fab1c4d6863c69a40df6ca966f568160f2b2a9a73e5d02a6e93c2')

SHIP_PREFIX=/opt/soh
OTRFILE=oot-mq.otr

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

