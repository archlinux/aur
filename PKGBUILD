# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: gpettinello <g_pet AT hotmail AT com>
# Contributor: wangjiezhe <wangjiezhe AT yandex AT com>

pkgname=librsb
pkgver=1.3.0.2
pkgrel=1
pkgdesc="A shared memory parallel sparse matrix library including Sparse BLAS"
arch=(x86_64)
url="https://sourceforge.net/projects/${pkgname}"
license=(LGPL3)
depends=(gcc-libs zlib)
makedepends=()
optdepends=()
options=()
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz.asc")
md5sums=('c55ae6dd29d03308d96b9beb63590673'
  'SKIP')
validpgpkeys=('1DBB555AEA359B8AAF0C6B88E0E669C8EF1258B8') # Michele Martone <michele.martone@ipp.mpg.de>

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i "s/CC -V/CC -v/g" configure aclocal.m4
  sed -i 's/{CC} -V/{CC} -v/g' configure configure.ac
}

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
    --enable-fortran-module-install
  #    CFLAGS='-fPIC -g -O3' FCFLAGS='-fPIC -g -O3'
  make
}

# check() {
#   cd ${pkgname}-${pkgver}
#   make -k check
# }

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -Dm 644 ${pkgname}.pc -t "${pkgdir}/usr/share/pkgconfig/"
}
