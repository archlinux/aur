# Maintianer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=amrfinderplus
pkgver=3.11.26
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
sha256sums=('49d98d0f66e121d3ed5a3d9a817089ee69399b0bd06af52f79d796bfe8b2d8b2'
            '2adee0fa212d4b45054fdd9be5c31298bef7caa079c46d7c26340cb64375c1e4')

prepare() {
  cp *.patch amr-amrfinder_v${pkgver}
  cd amr-amrfinder_v${pkgver}
  # patch Makefile to use gnu make's destdir variable
  patch -p1 < destdir.patch
}

build() {
    cd amr-amrfinder_v${pkgver}
    export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now"
    export PREFIX="/usr"
    export DEFAULT_DB_DIR="/usr/share/amrfinderplus/data"
    make
}

package() {
    cd amr-amrfinder_v${pkgver}
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
