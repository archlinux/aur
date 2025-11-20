# Maintainer: Yang Niao <yangniao23 (at) gmail (dot) com>
pkgname=smlsharp-graphics
pkgver=0.1.1
pkgrel=1
pkgdesc="A graphics library for SML#."
arch=('x86_64')
url="https://github.com/uenob/smlsharp_graphics"
license=('MIT')
depends=('smlsharp' 'freeglut')
makedepends=('git')
source=("git+https://github.com/uenob/smlsharp_graphics.git#tag=v${pkgver}"
        "add-play-function.patch")
sha256sums=('SKIP'
            'beb57b710c0033431542b454b1a591400fefe01b9b34911a6202d3f55b202f2d')

prepare() {
  cd "${srcdir}/smlsharp_graphics" || return 1
  patch -Np1 -i "${srcdir}/add-play-function.patch"
}

build() {
  cd "${srcdir}/smlsharp_graphics" || return 1

  # Compile library files
  for smlfile in gl glu glut libc react graphics; do
    smlsharp -O2 -o "${smlfile}.o" -c "graphics/${smlfile}.sml"
  done
}

package() {
  # Create installation directories
  install -d "${pkgdir}/usr/lib/smlsharp/graphics"

  # Install .smi files
  install -m644 "${srcdir}/smlsharp_graphics/graphics/"*.smi "${pkgdir}/usr/lib/smlsharp/graphics/"
  install -m644 "${srcdir}/smlsharp_graphics/graphics.smi" "${pkgdir}/usr/lib/smlsharp/"

  # Install .o files
  install -m644 "${srcdir}/smlsharp_graphics/"*.o "${pkgdir}/usr/lib/smlsharp/graphics/"
}