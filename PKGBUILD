# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=nomacs
pkgver=3.23.1
pkgrel=1
epoch=1
pkgdesc="A Qt image viewer"
arch=(x86_64)
url="https://github.com/nomacs/nomacs"
license=(GPL-3.0-only)
depends=(
    exiv2
    glibc
    hicolor-icon-theme
    libgcc
    libglvnd
    libraw
    libtiff
    opencv      #libopencv_imgproc.so
    qt6-base
    qt6-svg
    quazip-qt6
    )
makedepends=(
    cmake
    git
    #gtest # for tests
    python
    qt6-tools
    vulkan-headers
    )
optdepends=(
    'kimageformats: support QOI (Quite OK Image Format)'
    'qt6-imageformats: support additional image formats'
    )
source=("git+https://github.com/nomacs/nomacs.git#tag=${pkgver}"
        "nomacs-opencv5.patch::https://github.com/nomacs/nomacs/pull/1622.patch"
        )
b2sums=('1d6660001b029362282bac021950c6893d4ae8b7606518d5cb80385345a09cea3c5dbfa039f1432537760bd5cf06f541517de728c93772e3bdd9b9f763bd0345'
        '0232c14becbdf31f321e67cedeae0e13edf051606bf68ecdde4aac96c2ec20258bd3ce0d5f6b765f609a35ae15a00e282a208d82d9e0e5a707c65960a6714ef3')

prepare() {
  cd nomacs
  patch -Np1 -i ../nomacs-opencv5.patch
  # Patch doesn't apply cleanly to stable version 3.22.1
  # https://github.com/nomacs/nomacs/issues/1619
  # https://github.com/nomacs/nomacs/pull/1622
}

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  local _flags=(
    -DQT_VERSION_MAJOR=6
    -DUSE_SYSTEM_QUAZIP=ON
    -DENABLE_AVIF=ON    # not in next version
    -DENABLE_QUAZIP=ON  # not in next version
    -DENABLE_TRANSLATIONS=ON
    #-DENABLE_OPENCV=OFF
    #-DENABLE_RAW=OFF
    #-DENABLE_TIFF=OFF
    #-DENABLE_PLUGINS=OFF
  )

  cmake -B build -S "nomacs/ImageLounge" -Wno-author \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

#check() {
  #ctest --test-dir build --output-on-failure
  # tests not built despite nomacs "tests ................................................. YES" ?
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
