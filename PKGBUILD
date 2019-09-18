# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>
# Maintainer: Netanel Shine <netanel at archlinux.org.il>

pkgname=trace-cmd-git
pkgver=2.8.r85.ged1b47c
pkgrel=1
pkgdesc="Userspace tooling for the Linux kernel Ftrace internal tracer"
arch=('x86_64' 'aarch64')
url="https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
license=('GPL2')
makedepends=('python' 'swig' 'asciidoc')
optdepends=('python: for the Python plugins')
provides=("trace-cmd")
conflicts=("trace-cmd")
source=(
  "git://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
)
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/trace-cmd"

  # kernelshark tags are internal to the project, skip them
  # kernelshark.v0.9.8.r77.g5276e83 -> (trace-cmd) 2.7.r358.g5276e83
  git describe --long --exclude "kernelshark*" | \
    sed -r 's/^trace.cmd.v//; s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/trace-cmd"
  
  # pkg-config --cflags --libs $PYTHON_VERS
  make PYTHON_VERS=python3 prefix="/usr" all doc
}

package() {
  cd "${srcdir}/trace-cmd"

  # pkg-config --cflags --libs $PYTHON_VERS
  make PYTHON_VERS=python2 prefix="/usr" DESTDIR="$pkgdir" \
    install install_doc

  # Remove the KernelShark docs from this package
  rm -rf "${pkgdir}/usr/share/kernelshark"
  rm -f "${pkgdir}/usr/share/man/man1/kernelshark.1"
}
