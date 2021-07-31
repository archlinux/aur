# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christopher Vittal ("viralstitch") <chris@vittal.dev>

pkgname=htslib
pkgver=1.13
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
sha256sums=('f2407df9f97f0bb6b07656579e41a1ca5100464067b6b21bf962a2ea4b0efd65')

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
