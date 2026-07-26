# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=pythonqt-git
pkgver=4.1.0.r3.g642c06b6
pkgrel=2
pkgdesc="A dynamic Python binding for Qt applications"
arch=(x86_64)
url="https://github.com/MeVisLab/pythonqt"
license=(LGPL-2.1-only)
depends=(
    glibc
    libgcc
    libstdc++
    python
    qt6-base
    qt6-declarative
    qt6-multimedia
    qt6-svg
    qt6-tools
    qt6-webchannel
    qt6-webengine
    )
makedepends=(git)
provides=(pythonqt)
conflicts=(pythonqt)
source=("git+https://github.com/MeVisLab/pythonqt.git")
sha256sums=('SKIP')

pkgver() {
  cd "pythonqt"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"


  cd "pythonqt"

  qmake6 CONFIG+=generator_only CONFIG+=Release PythonQt.pro
  make

  cd generator
  ./pythonqt_generator qtscript_masterinclude.h build_all.txt
  cd ..

  qmake6 \
    PYTHON_VERSION=$(python -c 'import sys; print(".".join(sys.version.split(".")[:2]))') \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    CONFIG+=release \
    PythonQt.pro

  make
}

package() {
  cd "pythonqt"
 make install INSTALL_ROOT="${pkgdir}/usr"
}
