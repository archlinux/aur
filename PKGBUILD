# Maintianer: Bipin Kumar <bipin@ccmb.res.in>

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
        "LDFLAG.patch::https://patch-diff.githubusercontent.com/raw/ncbi/amr/pull/132.patch"
        "destdir.patch::https://patch-diff.githubusercontent.com/raw/ncbi/amr/pull/131.patch"
        )
sha256sums=('49d98d0f66e121d3ed5a3d9a817089ee69399b0bd06af52f79d796bfe8b2d8b2'
            'efa5f955d235e739b5e282f87d4a25ec0b6acc26d99487c816e6753924ecfa09'
            '94a47bc95906ce5da028a7fa869c1120a7b0165d4ed90078978fe041c5d424dd')

prepare() {
  cp *.patch amr-amrfinder_v${pkgver}
  cd amr-amrfinder_v${pkgver}
  # patch Makefile to use $(LDFLAGS)
  patch -p1 < LDFLAG.patch
  # patch Makefile to use gnu make's destdir variable
  patch -p1 < destdir.patch
  # set optimisation flag to archlinux recommended -O2
  sed -i '76s/-O3/-O2/' Makefile
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
    # Install test data files
    install -d ${pkgdir}/usr/share/amrfinderplus/data/test_data
    for file in *.fa; do
    cp "$file" ${pkgdir}/usr/share/amrfinderplus/data/test_data
    done

    for file in *.gff; do
    cp "$file" ${pkgdir}/usr/share/amrfinderplus/data/test_data
    done

    for file in *.expected; do
    cp "$file" ${pkgdir}/usr/share/amrfinderplus/data/test_data
    done
}
