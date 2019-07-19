# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>
# Maintainer: Netanel Shine <netanel at archlinux.org.il>

##
# Upstream is using python2-only functions like PyString_FromString
#  Ex: trace-cmd/python/ctracecmd.i
##

pkgname=trace-cmd-git
pkgver=2.7.r451.gf1ef911
pkgrel=1
pkgdesc="user-space front-end command-line tool for Ftrace, inclduing the GUI interface application kernelshark as well as trace-graph and trace-view."
arch=('x86_64' 'aarch64')
url="http://git.kernel.org/?p=linux/kernel/git/rostedt/trace-cmd.git"
license=('GPL2')
makedepends=('python2' 'git' 'docbook-xsl' 'asciidoc' 'extra-cmake-modules'
             'doxygen' 'freeglut' 'glu' 'qt5-base' 'json-c' 'libxmu' 'swig')
optdepends=('python2: for the python plugins'
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

build() {
  cd "$srcdir/trace-cmd"
  
  # pkg-config --cflags --libs $PYTHON_VERS
  make BUILD_TYPE=Release PYTHON_VERS=python2 \
    prefix="/usr" DESTDIR="$pkgdir" all doc gui
}

package() {
  cd "${srcdir}/trace-cmd"

  # pkg-config --cflags --libs $PYTHON_VERS
  make BUILD_TYPE=Release PYTHON_VERS=python2 \
    prefix="/usr" DESTDIR="$pkgdir" install install_doc install_gui
}
