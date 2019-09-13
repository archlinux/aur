# Maintainer: Athemis <alexander.minges[at]googlemail[dot]com>
# Contributor: sauliusl
pkgname=bowtie
pkgver=1.2.3
pkgrel=1
pkgdesc="Bowtie is an alignment tool for short nucleotide sequences against long templates"
url="http://bowtie-bio.sf.net"
arch=('x86_64' 'i686')
license=('PerlArtistic')
depends=()
source=("https://github.com/BenLangmead/bowtie/archive/v${pkgver}.tar.gz"
        "makefile_uname.patch")
sha256sums=('86402114caeacbb3a3030509cb59f0b7e96361c7b3ee2dd50e2cd68200898823'
            '6b77e333a3ef10e3f787fd2983afd69cdb48e82347fc3316510c2ba5639742a3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i ../makefile_uname.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make NO_TBB=1 EXTRA_CXXFLAGS="-std=c++03"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix=/usr DESTDIR="${pkgdir}" install
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -Dm755 scripts/*.pl "${pkgdir}/usr/bin"
  install -Dm755 scripts/*.sh "${pkgdir}/usr/bin"
  find doc -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}" \;
  install -Dm644 TUTORIAL "${pkgdir}/usr/share/doc/$pkgname/TUTORIAL"
  install -Dm644 MANUAL "$pkgdir/usr/share/doc/$pkgname/MANUAL"
  install -Dm644 MANUAL.markdown "$pkgdir/usr/share/doc/$pkgname/MANUAL.markdown"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
