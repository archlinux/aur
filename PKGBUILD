# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=hugin-hg
pkgver=r9024.a3a195f9a8e6
pkgrel=1
pkgdesc="Panorama photo stitcher"
arch=(x86_64)
url="https://hugin.sourceforge.io/"
license=(GPL-2.0-only)
depends=(
    blas
    #boost-libs
    #enblend-enfuse
    exiv2
    fftw
    #flann #fails to build with this
    #glew
    glibc
    glu
    hicolor-icon-theme
    imath
    lapack
    lcms2
    #lensfun
    libepoxy
    libgcc
    libglvnd
    libgomp
    #libjpeg-turbo
    libpano13
    #libpng
    libstdc++
    libtiff
    libx11
    #libxi
    #libxmu
    openexr # -- Could not find OPTIONAL package OPENEXR
    python
    sqlite
    vigra
    wxwidgets-common
    wxwidgets-gtk3
    )
makedepends=(
    #boost
    cmake
    mercurial
    mesa
    swig
    tclap
    )
optdepends=(
    'darktable: RAW import using darktable'
    'dcraw: RAW import using dcraw'
    'perl-image-exiftool: GPano tags support'
    'rawtherapee: RAW import using rawtherapee'
    )
provides=(hugin)
conflicts=(hugin)
source=("hg+http://hg.code.sf.net/p/hugin/hugin")
sha256sums=('SKIP')

prepare() {
  cd "hugin"
  #hg import --no-commit ../pylong.patch
}

pkgver() {
  cd "hugin"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  local _flags=(
    -DENABLE_LAPACK=yes
    -DBUILD_WITH_EPOXY=ON
    -DBUILD_HSI=ON
    -DUSE_GDKBACKEND_X11=ON
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config
  )

  cmake -B build -S "hugin" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
