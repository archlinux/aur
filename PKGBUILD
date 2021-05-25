# Maintainer: Eldeberen <eldeberen.aur@middleearth.fr>
pkgname=fxsdk
pkgver=2.5.0
pkgrel=1
pkgdesc='Tools to program for the Casio fx9860 calculators'
arch=('i686' 'x86_64')
url="https://gitea.planet-casio.com/Lephenixnoir/fxsdk"
licence=('unkwown')
depends=('cmake' 'libusb' 'mkg3a' 'python-pillow' 'sh-elf-gcc-casio')
makedepends=('cmake' 'gcc' 'libpng')
optdepends=(
  'gint: alternative library and kernel for add-in development on fx-9860G and fx-CG50'
  'udisks2: disk management service, for auto-mount of calculator')
provides=('fxconv' 'fxg1a' 'fxlink')
conflicts=('fxsdk-git')
options=('!buildflags')
source=("$pkgname-$pkgver.tar.gz::https://gitea.planet-casio.com/Lephenixnoir/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0965ece421a8aff77a330cc625433efd7fd9afaa6d5a16ce6aa586f0dd49766c')

prepare() {
  cd "${srcdir}/${pkgname}"

  # ensure a clean build
  [[ -d build ]] && rm -rf build
  mkdir build
}

build() {
  cd "$srcdir/${pkgname}"
  pacman -Q udisks2 &> /dev/null && udisks=0 || udisks=1
  cmake -B build -DCMAKE_INSTALL_PREFIX="/usr" -DFXLINK_DISABLE_UDISKS2=$udisks
  make -C build
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="${pkgdir}" -C build install
}
