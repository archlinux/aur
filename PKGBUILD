# Maintainer: r6eve <r6eve at acm dot org>
# Former Maintainer (thnaks!): Christopher Vittal ("viralstitch") <chris@vittal.dev>
# Former Maintainer (thans!) : Alex Peltzer ("alexpe87") <alexpe.aur@mailbox.org>
# Former Maintainer (thanks dude!) : Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Markus Heuser <markus.heuser@web.de>

pkgname=samtools
pkgver=1.15.1
pkgrel=1
pkgdesc="tools for manipulating next-generation sequencing data"
arch=('i686' 'x86_64')
url="http://www.htslib.org/"
license=('custom')
depends=('htslib>=1.15.1')
optdepends=('luajit: needed for r2plot.lua vcfutils.lua')
source=("${pkgname}-${pkgver}.tar.bz2"::"https://github.com/samtools/samtools/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('708c525ac76b0532b25f14aadea34a4d11df667bc19bf0a74dae617d80526c6e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # prevent shipped htslib to be used
  rm -rf "htslib-${pkgver}" || exit 1
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --with-htslib=system

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # Install non-Perl misc/ programs
  for file in misc/*.lua; do
    install -Dm755 "${file}" "${pkgdir}/usr/bin/$(basename "${file}")"
  done

  install -d "${pkgdir}/usr/include/bam"
  install -Dm644 *.h "${pkgdir}/usr/include/bam"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
