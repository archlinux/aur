# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on grub2-editor-frameworks: maz-1 < ohmygod19993 at gmail dot com >
#

pkgname=kcm-grub2-git
_product=grub2-editor
pkgver=v0.6.4.r85.g92ffa11
pkgrel=1
pkgdesc="A KDE Control Module for configuring the GRUB2 bootloader"
arch=('x86_64')
url='https://github.com/maz-1/grub2-editor'
license=('GPL')
provides=(grub2-editor)
conflicts=(grub2-editor)
depends=('grub' 'hwinfo' 'libmagick6' 'qt5-base' 'kio' 'ki18n' 'kauth' 'kconfigwidgets' 'solid' 'kcmutils' 'packagekit-qt5')
makedepends=('cmake' 'ninja' 'extra-cmake-modules' 'git' 'kdoctools')
optdepends=('os-prober: Create entries for other operating systems')
source=($_product::"git+https://invent.kde.org/system/kcm-grub2.git")
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
  export PKG_CONFIG_PATH='/usr/lib/imagemagick6/pkgconfig'
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
