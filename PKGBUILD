# Upstream Maintainer:  Ionut Biru <ibiru@archlinux.org>
# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=e2fsprogs
pkgname=libx32-e2fsprogs
pkgver=1.42.4
pkgrel=1.1
pkgdesc="Ext2 filesystem libraries (x32 ABI)"
arch=('x86_64')
license=('GPL' 'LGPL' 'MIT')
url="http://e2fsprogs.sourceforge.net"
depends=('libx32-util-linux' $_pkgbasename)
makedepends=('bc' 'gcc-multilib-x32')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
sha1sums=('944002c1f8f1f87e7d2d53263346b001962bc1f9')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/libx32 --with-root-prefix="" --enable-elf-shlibs \
      --disable-{debugfs,imager,resizer,fsck,uuidd,libuuid,libblkid}
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install-libs

  rm -rf "${pkgdir}"/usr/{bin,include,share}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
