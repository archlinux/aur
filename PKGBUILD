
# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=amrfinderplus
pkgver=3.12.8
pkgrel=2
pkgdesc="Identify Antimicrobial resistance genes in assembled bacterial nucleotide and protein sequence. https://doi.org/10.1038/s41598-021-91456-0"
arch=('x86_64' 'i686')
url="https://www.ncbi.nlm.nih.gov/pathogens/antimicrobial-resistance/AMRFinder/"
license=('LicenseRef-Public Domain')
depends=(
        'glibc'
        'gcc-libs'
        'curl'
        'blast+'
        'hmmer'
        )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ncbi/amr/archive/refs/tags/amrfinder_v${pkgver}.tar.gz")
sha256sums=('a199bc332877bad9033a7620bc5e8e849db1f19a9ba8b7357ec5451a6a283aa0')

prepare() {
  cd amr-amrfinder_v${pkgver}
  # set optimisation flag to archlinux recommended -O2
  sed -i '76s/-O3/-O2/' Makefile
}

build() {
    cd amr-amrfinder_v${pkgver}
    export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,shstk,-z,relro,-z,now"
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
