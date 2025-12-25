# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=oberon-risc-emu-git
_pkgname=oberon-risc-emu
pkgver=2016.1.r28.g26c8ac5
pkgrel=1
pkgdesc="Emulator for the Oberon RISC machine"
arch=("x86_64")
url="https://github.com/pdewacht/oberon-risc-emu"
license=('GPL')
depends=('sdl2')
makedepends=('git' 'rust')
optdepends=('rust: for some tools')
install="oberon-risc-emu.install"

source=('git+https://github.com/pdewacht/oberon-risc-emu.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  make
  if test -x /usr/bin/rustc; then
    cd tools
    make
  fi
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 risc "${pkgdir}/usr/bin/risc"
  install -Dm755 pcsend.sh "${pkgdir}/usr/bin/pcsend"
  install -Dm755 pcreceive.sh "${pkgdir}/usr/bin/pcreceive"
  if test -x /usr/bin/rustc; then
    install -Dm755 tools/asciidecoder "${pkgdir}/usr/bin/asciidecoder"
    install -Dm755 tools/ob2unix "${pkgdir}/usr/bin/ob2unix"
  fi
  install -m755 -d "${pkgdir}/usr/share/${_pkgname}"
  install -m666 -t "${pkgdir}/usr/share/${_pkgname}" DiskImage/*.dsk
}
