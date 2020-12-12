# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=kcm-grub2-git
_product="${pkgname%-git}"
pkgver=v0.6.4.r86.g1912ede
pkgrel=1
pkgdesc='KDE Control Module for configuring the GRUB bootloader'
arch=('x86_64')
url='https://invent.kde.org/system/kcm-grub2'
license=('GPL3')
depends=(
    'grub'
    'hwinfo'
    'kcmutils'
    'libmagick6'
    'packagekit-qt5'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
    'kdoctools'
    'ninja'
)
optdepends=('os-prober: To detect other OSes when generating grub.cfg in BIOS systems')
source=("${_product}"::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_product}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -rfv build
  export PKG_CONFIG_PATH='/usr/lib/imagemagick6/pkgconfig'
  cmake \
    -B build -S "${_product}" \
    -G Ninja \
    -D BUILD_TESTING=OFF \
    -Wno-dev

  cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
