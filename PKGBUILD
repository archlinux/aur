# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=kernelshark
pkgver=1.0
pkgrel=1
pkgdesc="GUI frontend for trace-cmd based Linux kernel Ftrace captures"
arch=('x86_64' 'aarch64')
url="https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
license=('GPL2')
depends=('trace-cmd>=2.8.3' 'qt5-base' 'freeglut' 'glu')
makedepends=('asciidoc' 'extra-cmake-modules' 'doxygen' 'json-c' 'libxmu'
             'swig')
provides=('kernelshark')
conflicts=('kernelshark-git')
source=("https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot/kernelshark-v${pkgver}.tar.gz")
sha256sums=('1ca279365acfba869e18277fc4e7d3f77b3ffbf0067ace91c0a7d7be379dfa33')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  
  make BUILD_TYPE=Release prefix="/usr" DESTDIR="$pkgdir" \
    gui doc
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  make BUILD_TYPE=Release prefix="/usr" DESTDIR="$pkgdir" \
    install_gui install_doc

  # remove trace-cmd artifacts from this package
  rm -rf "${pkgdir}/etc"
  rm -rf "${pkgdir}/usr/lib/trace-cmd"
  rm -rf "${pkgdir}/usr/share/man/man5"
  rm -f "${pkgdir}/usr/bin/trace-cmd"
  rm -f "${pkgdir}/usr/share/man/man1/trace-cmd"*
}
