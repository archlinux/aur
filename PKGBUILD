# Maintainer: edward-p <edward At edward-p Dot xyz>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=proxmark3-iceman-git
pkgver=4.17768.r201.gab0c46a
pkgrel=1
pkgdesc='RRG / Iceman repo - Proxmark3 RDV4.0 and other Proxmark3 platforms.'
arch=('x86_64')
url='https://github.com/RfidResearchGroup/proxmark3'
license=('GPL-2.0-only')
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
# checkdepends=(
#   python-pyopenssl
#   python-cryptography
#   python-pip
#   python-pipx
#   )
options=(!buildflags)
provides=('proxmark3' 'proxmark3-iceman')
conflicts=('proxmark3' 'proxmark3-iceman')
replaces=($pkgname'-generic' $pkgname'-rdv4')
source=("$pkgname::git+${url}.git"
  "${pkgname}.install")
sha512sums=('SKIP'
            'dd9b4a37918fcd2a646090b1805de159ec05fec337f14aac09ff476c164551d94c16085bae19be8a1f8f3eb66c0470f98b728f3bf1b48a7ab5b94f99e753afe7')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
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

# check() {
#   cd "${srcdir}/${pkgname}"
# #   pipx install sslcrypto
#   make check
# }

package() {
  export DESTDIR="build"
  cd "${srcdir}/${pkgname}"
  mv "$DESTDIR"/* "${pkgdir}/"
}
