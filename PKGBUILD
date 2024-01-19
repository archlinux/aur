# Maintainer: edward-p <edward At edward-p Dot xyz>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=proxmark3-iceman-git
pkgver=4.17768.r170.gf48d495
pkgrel=0
pkgdesc='RRG / Iceman repo - Proxmark3 RDV4.0 and other Proxmark3 platforms.'
arch=('x86_64')
url='https://github.com/RfidResearchGroup/proxmark3'
license=('GPL2')
depends=('perl'
  'python'
  'libsndfile'
  'bluez'
  'bluez-libs'
  'gd'
  'qt5-tools')
makedepends=('git'
  'arm-none-eabi-gcc'
  'arm-none-eabi-newlib'
  'pkgconf'
  'readline'
  'bzip2'
  'lz4'
#   'lua'
#   'libwhereami'
)
checkdepends=(python-pyopenssl)
options=(!buildflags)
provides=('proxmark3' 'proxmark3-iceman')
conflicts=('proxmark3' 'proxmark3-iceman')
replaces=($pkgname'-generic' $pkgname'-rdv4')
source=("$pkgname::git+${url}.git"
  "${pkgname}.install")
sha512sums=('SKIP'
            'ae447b36cdaf7e7985a4e193d2dc1b7458e04c33503ee417d6f46aa816956ab8b1a4e301d296eb8656bfbea1234da94593297e67c4762e2035faabfcc569a14c')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
  export DESTDIR="build"
  export PREFIX="/usr"
  export UDEV_PREFIX="/usr/lib/udev/rules.d"
  
  cd "${srcdir}/${pkgname}"

  mkdir "$DESTDIR"
 
  STANDALONE_MODES=(
    'LF_SKELETON'
    'LF_EM4100EMUL'
    'LF_EM4100RSWB'
    'LF_EM4100RSWW'
    'LF_EM4100RWC'
    'LF_HIDBRUTE'
    'LF_MULTIHID'
    'LF_NEDAP_SIM'
    'LF_PROXBRUTE'
    'LF_PROX2BRUTE'
    'LF_SAMYRUN'
    'HF_14ASNIFF'
    'HF_14BSNIFF'
    'HF_15SNIFF'
    'HF_AVEFUL'
    'HF_CRAFTBYTE'
    'HF_LEGIC'
    'HF_MATTYRUN'
    'HF_MSDSAL'
    'HF_TCPRST'
    'HF_TMUDFORD'
    'HF_UNISNIFF'
    'HF_YOUNG'
    'DANKARMULTI'
    )
  RDV4_STANDALONE_MODES=(
    'LF_HIDFCBRUTE'
    'LF_ICEHID'
    'LF_NEXID'
    'LF_THAREXDE'
    'HF_14ASNIFF'
    'HF_BOG'
    'HF_CARDHOPPER'
    'HF_COLIN'
    'HF_ICECLASS'
    'HF_LEGICSIM'
    'HF_MFCSIM'
    'HF_REBLAY'
    )
 
  # Build recovery (without PLATFORM_EXTRAS and STANDALONE)
  make \
    PLATFORM="PM3RDV4" STANDALONE= FWTAG="rdv4-nostandalone" recovery/install
  make \
    PLATFORM="PM3OTHER" STANDALONE= FWTAG="other-nostandalone" recovery/install

  # These firmware is not needed.
  # rm build/usr/share/proxmark3/firmware/{fullimage-rdv4-nostandalone.elf,fullimage-other-nostandalone.elf}

  # Build various firmwares
  for standalone in ${STANDALONE_MODES[@]}; do

      make \
        PLATFORM="PM3RDV4" PLATFORM_EXTRAS="BTADDON" STANDALONE="${standalone}" \
        FWTAG="rdv4-"$(echo ${standalone} | tr '[:upper:]' '[:lower:]') armsrc/install

      make \
        PLATFORM="PM3OTHER" STANDALONE="${standalone}" \
        FWTAG="other-"$(echo ${standalone} | tr '[:upper:]' '[:lower:]') armsrc/install

  done

  for standalone in ${RDV4_STANDALONE_MODES[@]}; do

      make \
        PLATFORM="PM3RDV4" PLATFORM_EXTRAS="BTADDON" STANDALONE="${standalone}" \
        FWTAG="rdv4-"$(echo ${standalone} | tr '[:upper:]' '[:lower:]') armsrc/install

  done

  # Build & install other targets
  make {bootrom,client,mfkey,nonce2key,common}/install
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}

package() {
  export DESTDIR="build"
  cd "${srcdir}/${pkgname}"
  mv "$DESTDIR"/* "${pkgdir}/"
}
