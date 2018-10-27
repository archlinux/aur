# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=1.16.0
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux (32-bit)"
arch=('x86_64')
url="https://linuxtv.org/"
provides=("lib32-libv4l=$pkgver")
replaces=('lib32-libv4l')
conflicts=('lib32-libv4l')
license=('LGPL')
depends=($_pkgbasename 'lib32-gcc-libs' 'lib32-libjpeg-turbo' 'lib32-systemd')
source=(https://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.bz2
        https://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.bz2.asc)
validpgpkeys=('05D0169C26E41593418129DF199A64FADFB500FF') # Gregor Jasny <gjasny@googlemail.com>
sha512sums=('164306fd80339de4a0cdae9bac9bd53a0ac2dbd8997b81c2233886189e0df49563ad575dc703a20b229749f657c99dd4f35b58fdaf52ce469936b3c81a35e20e'
            'SKIP')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc
  make -C lib
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  MAKEFLAGS="-j1" make -C lib install DESTDIR="${pkgdir}/"
  rm -rf "${pkgdir}"/{usr/{include,share,bin,sbin},etc,lib}
}
