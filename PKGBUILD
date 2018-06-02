# Maintainer: Alexey Andreyev <aa13q@ya.ru>

pkgname=libvdpau-tegra-git
_name=libvdpau-tegra
pkgver=r110.6a17ba7
pkgrel=2
pkgdesc="VDPAU backend driver for NVIDIA Tegra 20/30 SoC's"
arch=(armv7h)
url='https://www.freedesktop.org/wiki/Software/VDPAU/'
depends=('libxext')
license=('custom')
provides=('libvdpau-tegra')
source=("git+https://github.com/grate-driver/libvdpau-tegra")
makedepends=('dri2proto' git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "${srcdir}/$_name"
  NOCONFIGURE=1 ./autogen.sh
}

check() {
  cd "${srcdir}/$_name"
  make check
}

build() {
  cd "${srcdir}/$_name"
  ./configure --prefix=/usr --sysconfdir=/etc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/$_name"
  make DESTDIR="${pkgdir}" install
} 
