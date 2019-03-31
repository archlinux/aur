# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>
# Maintainer: Netanel Shine <netanel at archlinux.org.il>

pkgname=trace-cmd-git
pkgver=2.7.r358.g5276e83
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
source=("git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git")
sha1sums=("SKIP")

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

  # pass down $prefix to cmake
  sed -i.cip 's|bin/cmake|bin/cmake -DCMAKE_INSTALL_PREFIX=\$(prefix) -DCMAKE_BUILD_TYPE=Release|g' \
    Makefile
  cd kernel-shark

  # replace hard-coded /usr/local with /usr all over the place
  for filep in org.freedesktop.kshark-record.policy build/ks.desktop.cmake \
    src/CMakeLists.txt src/plugins/CMakeLists.txt ./CMakeLists.txt; do
      sed -i.ul 's|usr/local|usr|g' "${filep}"
  done

  # KS_DIR is the random local build directory, relocate it to /usr
  sed -i.ks 's|@KS_DIR@|/usr/share/kernelshark|g' build/ks.desktop.cmake
  sed -i.ks 's|@KS_DIR@|/usr|g' build/deff.h.cmake
  sed -i.tb 's|@TRACECMD_BIN_DIR@|/usr/bin|g' build/deff.h.cmake

  # this ends up hard-coded to the build directory
  sed -i.ksc 's|KS_CONF_DIR "\${KS_DIR}|KS_CONF_DIR "/tmp|g' CMakeLists.txt

  # the gcc/g++ debug flag is enabled even when _DEBUG=0
  sed -i.dbg 's/-Wall -g/-Wall/g' CMakeLists.txt

  # this source is hard-coded to KS_DIR/lib/plugin-*
  sed -i.plg 's|lib/plugin|lib/kshark/plugin|g' src/KsUtils.cpp

  # these try to use KS_DIR for open/close of files
  for kfile in src/KsMainWindow.cpp src/KsCaptureDialog.cpp; do
    sed -i.hm 's/KS_DIR/QDir::homePath()/g' "${kfile}"
  done

  # KS_CONF_DIR was set above to /tmp for the Makefiles, this is to use
  # the user's home directory inside the code itself for saving and
  # restoring their "lastsession.json" file
  sed -i.ksd 's|KS_CONF_DIR;|QDir::homePath()+"/.ksconf";QDir dir(file);if (!dir.exists()) dir.mkpath(".");|g' src/KsMainWindow.cpp
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

  # referenced in the .desktop file
  install -Dm0644 "${srcdir}/trace-cmd/kernel-shark/icons/ksharkicon.png" \
    "${pkgdir}/usr/share/kernelshark/icons/ksharkicon.png"
}
