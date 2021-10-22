# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christopher Vittal ("viralstitch") <chris@vittal.dev>

pkgname=htslib
pkgver=1.14
pkgrel=1
pkgdesc='A C library for high-throughput sequencing data formats'
arch=('x86_64')
url="https://github.com/samtools/${pkgname}"
license=('custom')
depends=('bzip2' 'curl' 'xz')
provides=('tabix')
replaces=('tabix')
conflicts=('tabix')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ed221b8f52f4812f810eebe0cc56cd8355a5c9d21c62d142ac05ad0da147935f')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-libcurl \
    --enable-plugins \
    --with-plugin-dir=/usr/lib/htslib/plugins

  make
}

check() {
  cd "${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # htslib shared library comes installed as 0644
  chmod +x ${pkgdir}/usr/lib/libhts.so.*.*
}
