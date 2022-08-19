# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christopher Vittal ("viralstitch") <chris@vittal.dev>

pkgname=htslib
pkgver=1.16
pkgrel=1
pkgdesc='A C library for high-throughput sequencing data formats'
arch=('x86_64')
url="https://github.com/samtools/${pkgname}"
license=('custom')
depends=('bzip2' 'curl' 'xz')
provides=('tabix')
replaces=('tabix')
conflicts=('tabix')
options=('staticlibs')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('606b7c7aff73734cf033ecd156f40529fa5792f54524952a28938ca0890d7924')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-libcurl \
    --enable-plugins \
    --with-plugin-dir=/usr/lib/htslib/plugins

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # htslib shared library comes installed as 0644
  chmod +x ${pkgdir}/usr/lib/libhts.so.*.*
}
