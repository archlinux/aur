# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=ti99sim
pkgver=0.15.0
pkgrel=2
pkgdesc='Texas Instruments TI-99/4A Home Computer Emulator'
arch=('i686' 'x86_64')
url='http://www.mrousseau.org/programs/ti99sim'
license=('GPL')
makedepends=('sdl')
depends=('sdl')

source=("${url}/archives/${pkgname}-${pkgver}.src.tar.xz"
        "https://computerarchive.org/files/comp/files/Texas%20instruments%20ti-99/TIMRaD2.zip")

sha256sums=('deb74cf88956434ea3058f80bddb3eb3674d9773155f6d5aa1533feebb8ba88e'
            'bf01737f996a335f4be84d2b170d2e16704b8242bd8447c5b6debb5b4f959b55')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make

  cd "${srcdir}/ROMs"
  mv 994AGROM.Bin 994agrom.bin
  mv 994aROM.Bin 994arom.bin
  mv Disk.Bin ti-disk.bin
  mv SpchROM.Bin spchrom.bin

  "${srcdir}/${pkgname}-${pkgver}/bin/convert-ctg" 994a.bin
  "${srcdir}/${pkgname}-${pkgver}/bin/convert-ctg" --cru=1100 ti-disk.bin
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local DATA_ROOT="/opt/${pkgname}"
  export DATA_DIR="${pkgdir}${DATA_ROOT}"
  export SYS_BIN="${pkgdir}/usr/local/bin"
  mkdir -p "${DATA_DIR}" "${SYS_BIN}"

  make install

  cp "${srcdir}/ROMs/TI-994A.ctg" "${DATA_DIR}/console"
  cp "${srcdir}/ROMs/ti-disk.ctg" "${DATA_DIR}/console"
  cp "${srcdir}/ROMs/spchrom.bin" "${DATA_DIR}/console"

  for SYMLINK in "${SYS_BIN}"/*; do
    SYMLINK_NAME=$(basename "${SYMLINK}")
    ln -sf "${DATA_ROOT}/bin/${SYMLINK_NAME}" "${SYS_BIN}/${SYMLINK_NAME}"
  done

  ln -s "${DATA_ROOT}/bin/ti99sim-sdl" "${SYS_BIN}/ti99sim"
}
