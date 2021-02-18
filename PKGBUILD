# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=lib32-fakechroot
_pkgname=fakechroot
pkgver=2.20.1
pkgrel=1
pkgdesc="Gives a fake chroot environment (32-bit)"
depends=(fakechroot lib32-glibc)
makedepends=(lib32-gcc-libs)
arch=('x86_64')
url="https://github.com/dex4er/fakechroot/wiki"
license=('LGPL')
install=fakechroot.install
source=(
  ${_pkgname}-$pkgver.tar.gz::https://github.com/dex4er/fakechroot/archive/${pkgver}.tar.gz
  stat.patch
)
md5sums=('69612efa06636e79a56898512222b0fc'
         '474a72c077719676a42d7fbea8ea53f8')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export CFLAGS="$CFLAGS -m32"

  ./configure --prefix=/usr --libdir=/usr/lib32/libfakeroot
  make
}

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 < "${srcdir}/stat.patch"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -C src DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/etc/ld.so.conf.d/"
  echo '/usr/lib32/libfakeroot/fakechroot/' > "${pkgdir}/etc/ld.so.conf.d/lib32-fakechroot.conf"
}
