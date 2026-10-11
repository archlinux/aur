# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Guilhem Saurel <guilhem dot saurel at laas dot fr>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

pkgname=pythonqt
pkgver=4.2.0
pkgrel=1
pkgdesc='A dynamic Python binding for Qt applications'
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
source=("pythonqt-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f84d325e163cb2f2cf2dd0a0db7e341eb26acdd30820fab1c1b5c3c6a7c91860e42101b85bac71d63802b6b41ed0ef348d01281f7ae38da873e6b078c9a362d4')

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"


  cd "pythonqt-${pkgver}"

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
  cd "pythonqt-${pkgver}"
 make install INSTALL_ROOT="${pkgdir}/usr"
}

