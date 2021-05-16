# Maintainer: Jose Riha <jose1 1711 gmail com>

pkgname=remmina-plugin-anydesk-git
pkgver=20200414
pkgrel=1
_builderver=1.4.0.0
pkgdesc="A protocol plugin for Remmina to launch an Anydesk connection."
arch=('x86_64')
url="https://github.com/jose1711/remmina-plugin-anydesk/"
license=('GPL')
depends=('gtk3' 'remmina' 'anydesk')
makedepends=('pkg-config' 'cmake' 'git')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz" "git+https://github.com/jose1711/remmina-plugin-anydesk")
sha256sums=('c640edecf6606d6c5740f7812dc8dabce2b4a813cd48440e8703fe7b5a0488aa'
            'SKIP')

pkgver() {
  cd "${pkgname/-git//}"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname/-git//}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TRACE_CALLS=OFF .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
