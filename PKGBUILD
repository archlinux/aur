# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=drminfo-git
pkgver=3.1+0.g25f5e0e
pkgrel=1
pkgdesc="drminfo"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/drminfo/"
license=('GPLv2')
source=('git://git.kraxel.org/drminfo')
sha256sums=('SKIP')
depends=('libdrm' 'mesa' 'libepoxy' 'cairo' 'pixman' 'gtk3')
makedepends=('meson')
conflicts=('drminfo')
provides=("drminfo=${pkgver%+*}")

source+=(0001-include-drm_fourcc.h-from-libdrm-not-the-kernel.patch
         0002-meson-install-drminfo-drmtest.patch
         0003-meson-install-drminfo-drmtest-man-pages.patch)
sha256sums+=(SKIP SKIP SKIP)

pkgver() {
  cd drminfo
  git describe --long | sed 's/^drminfo-//; s/-/./; s/-/+/; s/-/./'
}

prepare() {
  cd drminfo

	for patch in ../*.patch
	do
		msg2 "Applying $patch"
		patch -sp1 -i $patch
	done

  rm -rf build
  meson build --prefix='/usr'
}

build() {
  cd drminfo
  ninja -C build
}

package() {
  cd drminfo
  DESTDIR="${pkgdir}" ninja -C build install
}
