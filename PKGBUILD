# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=libxls
pkgver=1.6.2
pkgrel=2
pkgdesc='Read binary Excel files from C/C++'
arch=('i686' 'x86_64')
url='https://github.com/libxls/libxls'
license=('BSD')
depends=('glibc')
makedepends=('autoconf-archive')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/libxls/libxls/archive/v${pkgver}.tar.gz" 
        "xlatypes.patch")
sha512sums=('9eb8dc78d9070ebe5af2629a358cea0f41db9e4accdfc2651093eaffaaeff5595e986346fa41a3b57740234f4a70d5aa394e5234f90e94ba41a782de574e4d00'
            'fc271f6a76f6177f90fe7eab674a9d053a3608b2ca60558d5e306b51a12573ecd55c21b3f0505b4ce33bcb4412396922ac33f07e5875c943ca868c7c7cc1da76i')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fiv
  patch -p0 < ../../xlstypes.patch #fix xlstypes include bug
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --program-prefix=lib # fix conflict with catdoc package
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
