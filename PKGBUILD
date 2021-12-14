# Maintainer: Georges Discry <georges at discry dot be>
# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid at gmail dot com>

pkgname=libdri2-git
_gitname=libdri2
pkgver=r11.4f1eef3
pkgrel=2
pkgdesc="Library for the DRI2 extension to the X Window System"
arch=('i686' 'x86_64')
url="https://github.com/robclark/libdri2"
license=('MIT')
depends=('libdrm' 'libxext')
makedepends=('git' 'xorgproto' 'xorg-server-devel')
options=('!libtool')
provides=('libdri2')
source=('git+https://github.com/robclark/libdri2.git')
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/${_gitname}"
  (
   set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_gitname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}/" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
