
# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=amrfinderplus
pkgver=4.0.22
pkgrel=1
_tag=amrfinder_v${pkgver}
pkgdesc="Identify Antimicrobial resistance genes in assembled bacterial nucleotide and protein sequence. https://doi.org/10.1038/s41598-021-91456-0"
arch=('x86_64' 'i686')
provides=('stxtyper')
url="https://www.ncbi.nlm.nih.gov/pathogens/antimicrobial-resistance/AMRFinder/"
license=('NCBI-PD')
depends=(
        'glibc'
        'gcc-libs'
        'curl'
        'blast+'
        'hmmer'
        'bash'
        )
makedepends=('git')
source=(amrfinderplus::git+https://github.com/ncbi/amr.git#tag=${_tag})
sha256sums=('b81195f729e7b370fac7fc0cdc3f12ab49353870067f6316232a3c67ff9a368d')

prepare() {
  cd ${pkgname}
  git submodule update --init
  # set optimisation flag to archlinux recommended -O2
  sed -i '76s/-O3/-O2/' Makefile
  sed -i '153s/$(CXX)/$(CXX) $(LDFLAGS)/' Makefile
  cd stx/
  sed -i '62s/-O3/-O2/' Makefile
  sed -i '65s/-O3/-O2/' Makefile
  sed -i '96s/$(CXX)/$(CXX) $(LDFLAGS)/' Makefile
  sed -i '101s/$(CXX)/$(CXX) $(LDFLAGS)/' Makefile
  sed -i '106s/$(CXX)/$(CXX) $(LDFLAGS)/' Makefile


}

build() {
    cd ${pkgname}
    export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,shstk,-z,relro,-z,now"
    export PREFIX="/usr"
    export DEFAULT_DB_DIR="/usr/share/amrfinderplus/data"
    make
}

package() {
    cd ${pkgname}
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
