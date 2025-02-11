# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=ti99sim
pkgver=0.16.0
pkgrel=3
pkgdesc="Texas Instruments TI-99/4A Home Computer Emulator"
arch=('x86_64')
url="http://www.mrousseau.org/programs/ti99sim"
license=('GPL')
depends=('sdl')
makedepends=('sdl')
source=("${url}/archives/${pkgname}-${pkgver}.src.tar.xz"
        "https://www.99er.net/files/TIMRaD2.Zip"
        "include-cstring.patch")
sha256sums=('14bd72f372fe1a253c3a25bca579d29b5c3e47aff2f22622188dc4023576b159'
            'bf01737f996a335f4be84d2b170d2e16704b8242bd8447c5b6debb5b4f959b55'
            '42b9ae172a1d2a9222a3c5d500c305e8517626ab4ed8473d0bfebe59ed81d561')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -p0 < ../include-cstring.patch
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make

  cd "${srcdir}"/ROMs
  mv 994AGROM.Bin 994agrom.bin
  mv 994aROM.Bin 994arom.bin
  mv Disk.Bin ti-disk.bin
  mv SpchROM.Bin spchrom.bin

  "${srcdir}"/${pkgname}-${pkgver}/bin/convert-ctg 994a.bin
  "${srcdir}"/${pkgname}-${pkgver}/bin/convert-ctg --cru=1100 ti-disk.bin
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  local DATA_ROOT=/opt/"${pkgname}"
  export DATA_DIR="${pkgdir}${DATA_ROOT}"
  export SYS_BIN="${pkgdir}"/usr/bin
  mkdir -p "${DATA_DIR}" "${SYS_BIN}"

  make install

  cp "${srcdir}"/ROMs/TI-994A.ctg "${DATA_DIR}"/console
  cp "${srcdir}"/ROMs/ti-disk.ctg "${DATA_DIR}"/console
  cp "${srcdir}"/ROMs/spchrom.bin "${DATA_DIR}"/console

  for SYMLINK in "${SYS_BIN}"/*; do
    SYMLINK_NAME=$(basename "$SYMLINK")
    ln -sf "${DATA_ROOT}/bin/${SYMLINK_NAME}" "${SYS_BIN}/${SYMLINK_NAME}"
  done

  ln -s "${DATA_ROOT}"/bin/ti99sim-sdl "${SYS_BIN}"/ti99sim
}
