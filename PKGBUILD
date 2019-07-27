# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>
# Maintainer: Netanel Shine <netanel at archlinux.org.il>

pkgname=kernelshark-git
pkgver=1.0.r0.gf97e28a
pkgrel=1
pkgdesc="GUI frontend for trace-cmd based Linux kernel Ftrace captures"
arch=('x86_64' 'aarch64')
url="https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
license=('GPL2')
depends=('trace-cmd' 'qt5-base' 'freeglut' 'glu')
makedepends=('asciidoc' 'extra-cmake-modules' 'doxygen' 'json-c' 'libxmu'
             'swig')
provides=('kernelshark')
conflicts=('kernelshark')
source=(
  "git://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
)
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/trace-cmd"

  # trace-cmd tags are internal to the project, skip them
  git describe --long --exclude "trace-cmd" | \
    sed -r 's/^kernelshark.v//; s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/trace-cmd"
  
  # pkg-config --cflags --libs $PYTHON_VERS
  make BUILD_TYPE=Release prefix="/usr" DESTDIR="$pkgdir" \
    gui doc
}

package() {
  cd "${srcdir}/trace-cmd"

  # pkg-config --cflags --libs $PYTHON_VERS
  make BUILD_TYPE=Release prefix="/usr" DESTDIR="$pkgdir" \
    install_gui install_doc

  # remove trace-cmd artifacts from this package
  rm -rf "${pkgdir}/etc"
  rm -rf "${pkgdir}/usr/lib/trace-cmd"
  rm -rf "${pkgdir}/usr/share/man/man5"
  rm -f "${pkgdir}/usr/bin/trace-cmd"
  rm -f "${pkgdir}/usr/share/man/man1/trace-cmd"*
}
