# Maintianer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=amrfinderplus
pkgver=3.11.20
pkgrel=1
pkgdesc="Identify Antimicrobial resistance genes in assembled bacterial nucleotide and protein sequence. https://doi.org/10.1038/s41598-021-91456-0"
arch=('x86_64' 'i686')
url="https://www.ncbi.nlm.nih.gov/pathogens/antimicrobial-resistance/AMRFinder/"
license=('custom: Public Domain')
depends=(
        'glibc'
        'gcc-libs'
        'curl'
        'blast+'
        'hmmer'
        )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ncbi/amr/archive/refs/tags/amrfinder_v${pkgver}.tar.gz"
		"destdir.patch")
sha256sums=('698462c4fa688a91130b72e44756d21faf406e186a02da914982044332419ef6'
            '1364d6dedb96c9a5aa2353e9abe7f766d721f55cb0811dd0aece43639f0f2152')

prepare() {
  cp *.patch amr-amrfinder_v${pkgver}
  cd amr-amrfinder_v${pkgver}
  # patch Makefile to use gnu make's destdir variable
  patch -p1 < destdir.patch
}

build() {
    cd amr-amrfinder_v${pkgver}
    make PREFIX=/usr DEFAULT_DB_DIR=/usr/share/amrfinderplus/data
}

package() {
    cd amr-amrfinder_v${pkgver}
    install -d ${pkgdir}/usr/bin
    make DESTDIR=${pkgdir} install
    install -Dm644 LICENSE  -t "$pkgdir"/usr/share/licenses/"${pkgname}"
    install -d ${pkgdir}/usr/share/amrfinderplus/data
    cd ${pkgdir}/usr/share/amrfinderplus/data
    curl -O https://raw.githubusercontent.com/ncbi/amr/master/test_dna.fa \
     -O https://raw.githubusercontent.com/ncbi/amr/master/test_prot.fa \
     -O https://raw.githubusercontent.com/ncbi/amr/master/test_prot.gff \
     -O https://raw.githubusercontent.com/ncbi/amr/master/test_both.expected \
     -O https://raw.githubusercontent.com/ncbi/amr/master/test_dna.expected \
     -O https://raw.githubusercontent.com/ncbi/amr/master/test_prot.expected 
}
