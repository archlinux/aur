# Maintainer: Jose Riha <jose1 1711 gmail com>

pkgname=remmina-plugin-anydesk-git
pkgver=20200414
pkgrel=2
_builderver=1.3.0.0
pkgdesc="A protocol plugin for Remmina to launch an Anydesk connection."
arch=('x86_64')
url="https://github.com/jose1711/remmina-plugin-anydesk/"
license=('GPL')
depends=('gtk3' 'remmina' 'anydesk')
makedepends=('pkg-config' 'cmake' 'git')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz" "git+https://github.com/jose1711/remmina-plugin-anydesk")
sha256sums=('0e4e2d6a79dc569444016a5479b437016386985d96a958da7505c15b1695f98c' 'SKIP')

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
