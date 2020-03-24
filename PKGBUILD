# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on grub2-editor-frameworks: maz-1 < ohmygod19993 at gmail dot com >
#

pkgname=grub2-editor-frameworks-git
_product=grub2-editor
pkgver=0.8.1.r0.g2f7de2c
pkgrel=1
pkgdesc="A KDE Control Module for configuring the GRUB2 bootloader. Unofficial KF5 port."
arch=('x86_64')
url='https://github.com/maz-1/grub2-editor'
license=('GPL')
provides=(grub2-editor)
conflicts=(grub2-editor)
depends=('grub' 'hwinfo' 'imagemagick' 'qt5-base' 'kio' 'ki18n' 'kauth' 'kconfigwidgets' 'solid')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
optdepends=('os-prober: Create entries for other operating systems')
source=("git+https://github.com/maz-1/${_product}.git")
groups=('plasma')
sha256sums=('SKIP')

pkgver() {
  cd "${_product}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -rfv build
  mkdir -pv build
  cd build
  cmake "../${_product}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF \
    -G Ninja
}

build() {
  cd build
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
