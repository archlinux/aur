# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=GC_MQ_D
verdesc="Ocarina of Time Master Quest Debug"
pkgname=soh-otr-${vername,,}
pkgver=5.1.4.r35.g37f31116b
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

  [ -e oot-mq.otr ] && rm oot-mq.otr
  [ ! -e assets ] && ln -s ${SHIP_PREFIX}/assets assets
  [ -e Extract ] && rm -r Extract; mkdir Extract
  cp -r "${SHIP_PREFIX}"/assets/game Extract/assets

  "assets/extractor/ZAPD.out" ed -eh -i "assets/extractor/xmls/${vername}" \
    -b baserom.z64 -fl "assets/extractor/filelists" -o . -osf . -gsf 1 \
    -rconf "assets/extractor/Config_${vername}.xml" -se OTR --otrfile oot-mq.otr
}

package() {
  cd "${srcdir}"

  install -Dm644 oot-mq.otr -t "${pkgdir}/${SHIP_PREFIX}"
}

