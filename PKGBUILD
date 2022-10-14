# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_romname=gc_mq_d
_romdesc="Ocarina of Time Master Quest Debug"
pkgname=soh-otr-${_romname}
pkgver=1
pkgrel=1
pkgdesc="OTR game data for SoH (${_romdesc})"
arch=("any")
url="https://github.com/HarbourMasters/Shipwright"
provides=("soh-otr")
conflicts=("soh-otr")
depends=("soh")
makedepends=("soh-otr-exporter")
source=("verify_baserom.py")
sha256sums=('bd82ccb54e94505549af7dc07b56dc83b3e63e1c65d525b6fb98ed1b56b8aecf')

SHIP_PREFIX=/opt/soh

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

  ln -s ${SHIP_PREFIX}/assets assets
  mkdir -p Extract/assets
  cp -r "${SHIP_PREFIX}"/assets/game/* Extract/assets/

  "assets/extractor/ZAPD.out" ed -eh -i "assets/extractor/xmls/${_romname^^}" \
    -b baserom.z64 -fl "assets/extractor/filelists" -o placeholder -osf placeholder -gsf 1 \
    -rconf "assets/extractor/Config_${_romname^^}.xml" -se OTR
}

package() {
  cd "${srcdir}"

  install -Dm644 oot.otr -t "${pkgdir}/${SHIP_PREFIX}"
}

