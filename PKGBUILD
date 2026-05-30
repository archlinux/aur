# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: brent s. <bts[at]square-r00t[dot]net>

# Note: Inline sed fixes will be converted to proper patch files
# when upstream releases 3.3.0 stable.

pkgname=mondo
pkgver=3.3.0
pkgrel=2
pkgdesc="A disaster recovery solution to create bootable backup media"
arch=('x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
depends=('mindi' 'bzip2' 'afio' 'cdrkit' 'binutils' 'libnewt' 'buffer'
         'syslinux' 'slang' 'xorriso' 'mondorescue-common')
makedepends=('gcc' 'autoconf' 'automake' 'libtool')
optdepends=('lzop: LZO compression support'
            'lzo: LZO compression library')
source=("https://hub.darcs.net/stef204/mondorescue-aur/raw/mondo-3.3.0.0.20201203152307.tar.gz"
        "https://hub.darcs.net/stef204/mondorescue-aur/raw/mondoarchive.8"
        "https://hub.darcs.net/stef204/mondorescue-aur/raw/mondorestore.8")
sha512sums=('faa27afaf9be0805918c33c81f6566728ad43083043c1611c4d4e0abd638965054579fa03784bd4eee2636bb9c7624dce7090f5e852c9b0690144c4692ef550a'
            '7267328d5cc012ca163b917732b0e105999072b617bd1daf6d57d98deed9df2e086ccf68d22f982da810272cd8d228e2593250372697863da1c40f898ad9f892'
            '71cd19ebe9fab720fa1cdf1410ab35d70ca16216ea9522d8824f5232c6c72cc5c7260bdb75bc30a412992a2fb9e1ee979a405924c896e305decadcc51e1d86a9')

prepare() {
  mv "${srcdir}/mondo-3.3.0.0.20201203152307" "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  mkdir -p docs/man
  cp "${srcdir}/mondoarchive.8" docs/man/
  cp "${srcdir}/mondorestore.8" docs/man/
  
  autoreconf -fi
  
  sed -i 's|log_msg(1, "g_kernel_version = %f", d);|g_kernel_version = d;\n\tlog_msg(1, "g_kernel_version = %f", d);|' src/common/libmondo-tools.c
  
  sed -i '35a #include <stdio.h>' src/common/libmondo-archive.c
  sed -i '322s@return (retval);@/* fsync the afio file to prevent threading race */ { FILE *f = fopen(fname, "rb"); if (f) { fsync(fileno(f)); fclose(f); } }\n\treturn (retval);@' src/common/libmondo-archive.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin CFLAGS="-std=gnu17"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/var/cache/mondo"
  install -d "${pkgdir}/usr/share/doc/mondo"
  install -m644 INSTALL COPYING README* TODO AUTHORS NEWS* \
    docs/en/mondorescue-howto.html docs/en/mondorescue-howto.pdf \
    "${pkgdir}/usr/share/doc/mondo/" 2>/dev/null || true
}
