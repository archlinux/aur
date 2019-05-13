# Maintainer : Alexey Andreyev <aa13q@ya.ru>

pkgname=xf86-video-opentegra-git
_pkgname=xf86-video-opentegra
pkgver=r250.3b46f6a
pkgrel=1
pkgdesc="X.Org video driver for NVIDIA Tegra"
arch=('armv7h')
url="http://github.com/grate-driver/xf86-video-opentegra"
license=('GPL')
depends=('libdrm-grate-git' 'systemd' 'mesa-dri')
makedepends=('xorg-server-devel' 'git')
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25', 'xf86-video-opentegra')
groups=('xorg-drivers' 'xorg')
source=('git://github.com/grate-driver/xf86-video-opentegra.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  NOCONFIGURE=1 ./autogen.sh
}

check() {
  cd "${srcdir}/${_pkgname}"
  make check
}

build() {
  cd "${srcdir}/$_pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$_pkgname"
  make DESTDIR="$pkgdir" install
} 
