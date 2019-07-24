# Maintainer: queueRAM <queueRAM <at> gmail <dot> com>

pkgname=qemu-irix-git
_gitname=qemu-irix
pkgdesc="QEMU with IRIX userland support"
pkgver=v2.11.0.r2167.ga2ba448e6b
pkgrel=1
arch=(i686 x86_64)
license=(GPL2 LGPL2.1)
url="https://github.com/queueRAM/qemu-irix"
depends=()
makedepends=(python2 git)
source=(${_gitname}::git://github.com/queueRAM/qemu-irix.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  mkdir -p build
}

build() (
  cd ${srcdir}/${_gitname}/build

  # headless configure with IRIX targets
  ../configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/qemu \
    --audio-drv-list= \
    --disable-bluez \
    --disable-sdl \
    --disable-gtk \
    --disable-vte \
    --disable-opengl \
    --disable-virglrenderer \
    --disable-blobs \
    --disable-tools \
    --disable-guest-agent \
    --target-list=irix-linux-user,irixn32-linux-user,irix64-linux-user \
    --disable-capstone \
    --disable-debug-info \
    --disable-werror

  make
)

package() {
  make -C "${srcdir}/${_gitname}/build" DESTDIR="${pkgdir}" install

  # remove potentially conflicting binary and docs
  cd "${pkgdir}"
  rm -r usr/lib usr/share
}
