# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=GC_MQ_D
verdesc="Ocarina of Time Master Quest Debug"
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
makedepends=("soh-otr-exporter" "python")
source=("verify_baserom.py")
sha256sums=('bd82ccb54e94505549af7dc07b56dc83b3e63e1c65d525b6fb98ed1b56b8aecf')

SHIP_PREFIX=/opt/soh
OTRFILE=oot-mq.otr

_get_extractor_ver() {
  pacman -Q soh-otr-exporter | sed -E 's/.* ((\.?[[:digit:]]*){3}).*$/\1/'
}

pkgver() {
  pacman -Q soh-otr-exporter | sed -E 's/.* (.*)-.*$/\1/'
}

prepare() {
  cd "${srcdir}"

  if [ ! -e "${startdir}/baserom.z64" ]; then
    echo "baserom.z64 does not exist in this directory."
    echo "Please put the ROM in \"${startdir}\"."
    return 1
  fi

  cp "${startdir}/baserom.z64" .
  echo "Checking hash..."
  ./verify_baserom.py baserom.z64
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


