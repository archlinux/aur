# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_plugins_pkgver=3.16
pkgname=nomacs
pkgver=3.17.2282
pkgrel=2
epoch=1
pkgdesc="A Qt image viewer"
arch=(x86_64)
url="https://nomacs.org/"
license=(GPL3)
depends=(exiv2 gcc-libs glibc libraw libtiff opencv qt5-base qt5-svg quazip)
makedepends=(cmake git python qt5-tools)
optdepends=('qt5-imageformats: support additional image formats')
source=("git+https://github.com/nomacs/nomacs.git#tag=${pkgver}"
        "nomacs-plugins-${_plugins_pkgver}.tar.gz::https://github.com/nomacs/nomacs-plugins/archive/${_plugins_pkgver}.tar.gz"
        "https://github.com/nomacs/nomacs/files/11703502/nomacs-fix-exiv2-0.28.patch.txt")
b2sums=('SKIP'
        '2bda4f36d56709653f6696af3404e416fd2d9fe7fa11de9636643c728028018ac769df3e2e519799322c5c42006cdc114d0e6406f9f60294234b07d9fd8d8409'
        '7144b3e3391047bf89df4da8b78cf0b9273ff7cb2db8637f719ac4b926290901ba3f6f2dee4ba342f8dac4939b4d60be3d80a45dd2481d25408e712160a1bb78')

export GIT_LFS_SKIP_SMUDGE=1

prepare() {
  cd "nomacs"
  # https://github.com/nomacs/nomacs/issues/951
  patch -Np1 -i ../nomacs-fix-exiv2-0.28.patch.txt
  # copy plugin sources into place
  cp -av "${srcdir}/nomacs-plugins-${_plugins_pkgver}/"* "ImageLounge/plugins"
}

build() {
  cd "nomacs"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DUSE_SYSTEM_QUAZIP=ON \
    -DENABLE_AVIF=ON \
    -DENABLE_TRANSLATIONS=ON \
    -W no-dev \
    -B build \
    -S ./ImageLounge
  make VERBOSE=1 -C build
}

package() {
  cd "nomacs"
  make DESTDIR="${pkgdir}" install -C build
}
