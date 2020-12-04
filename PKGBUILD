# Maintainer: Marco Wang <m.aesophor@gmail.com>

pkgname=wmderland-git
_pkgname=wmderland
pkgver=1.0.4
pkgrel=2
pkgdesc='X11 tiling window manager using space partitioning trees'
arch=('x86_64')
url="https://github.com/aesophor/wmderland"
license=('MIT')
depends=('libx11')
makedepends=('gcc>=6.0' 'cmake>=3.9')
install=${_pkgname}.install
source=('git://github.com/aesophor/wmderland.git')
sha256sums=('SKIP')

build() {
  cd ${_pkgname}/
  ./build.sh
}

package() {
  # Install wmderland.
  cd ${_pkgname}/build/
  make DESTDIR="${pkgdir}/" PREFIX="/usr/local/" install

  # Install wmderlandc (ipc client).
  cd ../ipc-client/build/
  make DESTDIR="${pkgdir}/" PREFIX="/usr/local/" install


  # Move resulting executables to /usr/bin/...
  install -dm755 "${pkgdir}"/usr/bin/
  mv "${pkgdir}"/usr/local/bin/wmderland "${pkgdir}"/usr/bin/wmderland
  mv "${pkgdir}"/usr/local/bin/wmderlandc "${pkgdir}"/usr/bin/wmderlandc


  # Install example config file.
  cd ../../
  mkdir -p "${pkgdir}/etc/xdg/wmderland/"
  mkdir -p "${pkgdir}/usr/share/xsessions/"
  install -D -m644 example/config "${pkgdir}/etc/xdg/wmderland/"
  install -D -m644 example/wmderland.desktop "${pkgdir}/usr/share/xsessions/"
}
