# Maintainer: Andrew Sun <adsun701 at gmail com>
# Contributor: orumin <dev at orum dot in>

_basename=libwacom
pkgname="lib32-$_basename"
pkgver=2.1.0
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features (32-bit)"
arch=('x86_64')
url="https://github.com/linuxwacom/libwacom/wiki"
license=('MIT')
depends=('lib32-glib2' 'lib32-systemd' 'lib32-libgudev' "$_basename")
makedepends=('lib32-libxml2' 'meson')
checkdepends=('python-libevdev' 'python-pytest' 'python-pyudev')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
source=(https://github.com/linuxwacom/libwacom/releases/download/${_basename}-${pkgver}/${_basename}-${pkgver}.tar.xz{,.sig})
sha512sums=('9da7a6467ee9d853fca8d7b58528cb7c7a2f28f4074dba76e1d76cd6c134d800e1f8ad672b997af96f8712fc407d7d64cbdd1bcb4d8ae67965217786bbabca4a'
            'SKIP')

build() {
  cd "${srcdir}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson "${_basename}-${pkgver}" build \
    --libdir=/usr/lib32
  ninja -C build
}

check() {
  cd "${srcdir}/build"
  meson test || true
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf ${pkgdir}/usr/{bin,lib,share,include}  
}
