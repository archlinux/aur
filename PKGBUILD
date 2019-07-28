# Maintainer: lain <aur@hacktheinter.net>
pkgname=xtrx-linux-pcie-drv-git
pkgver=r17.5ae3a3e
pkgrel=2
pkgdesc="XTRX PCI driver for linux"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=('armv7h' 'i686' 'x86_64')
url='https://github.com/xtrx-sdr/xtrx_linux_pcie_drv'
md5sums=('SKIP')
license=('GPL')
depends=()
makedepends=('git' 'cmake' 'dkms')
source=("git+$url")

pkgver() {
  cd xtrx_linux_pcie_drv
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd xtrx_linux_pcie_drv

  # pkgbuild dkms stuff isn't happy about the version
  # string 0.0.1-2, specifically the hyphenation.
  # let's patch it to just match $pkgver
  sed -e "s/PACKAGE_VERSION=\"[^\"]\\+\"/PACKAGE_VERSION=\"${pkgver}\"/" \
      -i 'dkms.conf'
  sed -e "s/\${LIBVER}-\${MAINT_VERSION}/${pkgver}/" \
      -i 'CMakeLists.txt'

  mkdir -p build

  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
	-DINSTALL_UDEV_RULES=1
  make
}

package() {
  cd xtrx_linux_pcie_drv/build
  make DESTDIR="$pkgdir/" install
}
