# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>
# Maintainer: Netanel Shine <netanel at archlinux.org.il>

pkgname=trace-cmd-git
pkgver=2.7.r406.gb43f658
pkgrel=1
pkgdesc="user-space front-end command-line tool for Ftrace, inclduing the GUI interface application kernelshark as well as trace-graph and trace-view."
arch=('x86_64' 'aarch64')
url="http://git.kernel.org/?p=linux/kernel/git/rostedt/trace-cmd.git"
license=('GPL2')
makedepends=('python' 'git' 'docbook-xsl' 'asciidoc' 'extra-cmake-modules'
             'doxygen' 'freeglut' 'glu' 'qt5-base' 'json-c' 'libxmu' 'swig')
optdepends=('python: for the python plugins'
            'qt5-base: for the kernelshark GUI'
            'freeglut: for the kernelshark GUI'
            'glu: for the kernelshark GUI')
provides=("trace-cmd")
conflicts=("trace-cmd")
source=(
  "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git"
)
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/trace-cmd"

  # kernelshark tags are internal to the project, skip them
  # kernelshark.v0.9.8.r77.g5276e83 -> (trace-cmd) 2.7.r358.g5276e83
  git describe --long --exclude "kernelshark*" | \
    sed -r 's/^trace.cmd.v//; s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/trace-cmd"

  ## fixes for getting kernelshark installed correctly to /usr

  # pass down Release as build type to strip build directories
  # from final binaries
  sed -i.cip 's|\(-D_INSTALL_PREFIX=\)|-DCMAKE_BUILD_TYPE=Release \1|g' \
    Makefile

  # all work below is within kernel-shark/
  cd kernel-shark

  # the build sets TRACECMD_BIN_DIR=(local build path) instead of /usr/bin/
  sed -i.tb 's|@TRACECMD_BIN_DIR@|@_INSTALL_PREFIX@/bin|g' build/deff.h.cmake

  # the gcc/g++ debug flag is enabled even when _DEBUG=0 which causes
  # the build directory to get coded into the libraries
  sed -i.dbg 's/-Wall -g/-Wall/g' CMakeLists.txt
}

build() {
  cd "$srcdir/trace-cmd"
  
  # pkg-config --cflags --libs $PYTHON_VERS
  make PYTHON_VERS=python3 prefix="/usr" DESTDIR="$pkgdir" all doc gui
}

package() {
  cd "${srcdir}/trace-cmd"

  # pkg-config --cflags --libs $PYTHON_VERS
  make PYTHON_VERS=python3 prefix="/usr" DESTDIR="$pkgdir" \
    install install_doc install_gui
}
