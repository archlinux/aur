# Maintainer: queueRAM <queueRAM <at> gmail <dot> com>
# Maintainer: haxz5rxwi <haxz5rxwi@mozmail.com>
pkgname=qemu-irix-git
_gitname=qemu-irix
pkgdesc="QEMU with IRIX userland support"
pkgver=v2.11.0.r2174.f60eef5
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
license=(GPL2 LGPL2.1)
url="https://github.com/n64decomp/qemu-irix"
depends=(glib2)
makedepends=(python git)
source=(${_gitname}::git+https://github.com/unkn0wncvm1/qemu-irix.git)
sha256sums=('SKIP')


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
    --disable-werror \
    --extra-cflags="-fmacro-prefix-map=${srcdir}=."

  make
)

package() {
  make -C "${srcdir}/${_gitname}/build" DESTDIR="${pkgdir}" install

  # remove potentially conflicting binary and docs
  cd "${pkgdir}"
  rm -r usr/lib usr/share
}
