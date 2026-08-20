# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=oberon-risc-emu-git
_pkgname=oberon-risc-emu
pkgver=2016.1.r28.g26c8ac5
pkgrel=4
pkgdesc="Emulator for the Oberon RISC machine"
arch=("x86_64" "i686" "pentium4")
url="https://github.com/pdewacht/oberon-risc-emu"
license=('ISC')
depends=('sdl2')
makedepends=('git' 'python')
optdepends=('rust: for some tools')
install="oberon-risc-emu.install"

source=(
  'git+https://github.com/pdewacht/oberon-risc-emu.git'
  'git+https://github.com/pdewacht/project-norebo'
  'manifest.csv'
  'fetch-sources.py'
  'upstream-20251229.tgz'
)
md5sums=('SKIP'
         'SKIP'
         'f72634f9692cbec150dba93c162bde07'
         '920feb961fa305a766f80d8da892e8fe'
         'b967bad0f7ce38db0375a1004ccc27e3')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
}

build() {
  cd "${srcdir}/project-norebo"
  make
  ./build-image.py "${srcdir}/upstream"
  cd "${srcdir}/${_pkgname}"
  make
  if test -x /usr/bin/rustc; then
    cd tools
    make
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 risc "${pkgdir}/usr/bin/risc"
  install -Dm755 pcsend.sh "${pkgdir}/usr/bin/pcsend"
  install -Dm755 pcreceive.sh "${pkgdir}/usr/bin/pcreceive"
  if test -x /usr/bin/rustc; then
    install -Dm755 tools/asciidecoder "${pkgdir}/usr/bin/asciidecoder"
    install -Dm755 tools/ob2unix "${pkgdir}/usr/bin/ob2unix"
  fi
  install -m755 -d "${pkgdir}/usr/share/${_pkgname}"
  install -m666 -t "${pkgdir}/usr/share/${_pkgname}" DiskImage/*.dsk
  BUILDDATE=`date '+%Y-%m-%d'`
  echo "${BUILDDATE}" > "${pkgdir}/usr/share/${_pkgname}/BUILD_DATE"
  install -m666 "${srcdir}/project-norebo/build/Oberon.dsk" "${pkgdir}/usr/share/${_pkgname}/Oberon-$BUILDDATE.dsk"
}
