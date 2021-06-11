# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=alberta
pkgver=3.0.3
pkgrel=1
pkgdesc="Adaptive multi-Level finite element toolbox"
url="http://www.alberta-fem.de"
license=('GPL2')
arch=('x86_64')
makedepends=('gcc-fortran') #'blas' 'electricfence' 'duma'
source=("https://gitlab.mathematik.uni-stuttgart.de/ians-nmh/${pkgname}/${pkgname}3/-/archive/releases/${pkgname}3-releases.tar.gz")
sha512sums=('3a03d671f8d1fdeb72b8463e7f732dd79ccbd24ce15a23a6e1ffe2a22adff6feb861939382dad627a9c554c5e5024732974dc3a9ae8e99207db560f96f509e13')

build() {
  cd "${srcdir}/${pkgname}3-releases"
  autoreconf --install
  # for usage within DUNE, add --disable-fem-toolbox to speed up compilation
  ./configure \
    CFLAGS="-I/usr/include/tirpc" \
    LDFLAGS="-ldl -lm -ltirpc" \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --disable-fem-toolbox \
    --disable-graphics \
    --disable-dependency-tracking \
    --disable-debug \
    --without-gpskca \
    --without-gltools \
    --without-OpenDX \
    --without-grape \
    --without-silo

  make
}

package() {
  cd "${srcdir}/${pkgname}3-releases"

  make install DESTDIR="${pkgdir}"

  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install doc/*.pdf ${pkgdir}/usr/share/doc/${pkgname}

  install -Dm644 ${srcdir}/${pkgname}3-releases/COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
}
