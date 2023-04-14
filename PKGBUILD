pkgname=kraken2
pkgver=2.1.2
pkgrel=1
pkgdesc="Improved vesion of kraken ultrafast metagenomic sequence classification tool. https://doi.org/10.1186/s13059-019-1891-0"
arch=('i686' 'x86_64')
url="https://github.com/DerrickWood/kraken2"
license=('MIT')
depends=('glibc' 'gcc-libs' 'blast+' 'perl' 'bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DerrickWood/kraken2/archive/refs/tags/v${pkgver}.tar.gz" 
        'Makefile.patch'
        'fastaread.patch')
sha256sums=('e5f431e8bc3d5493a79e1d8125f4aacbad24f9ea2cc9657b66da06a32bef6ff3'
            'ee942349ca7bbfde14917c062c6a353911a39f32dff515f656e789d08034bf9e'
            '40bdae9d36e7212197f32d5dc49d7d676593e0a0e0f51e7ef8c0c20ccd2d999e')

prepare() {
    cp Makefile.patch ${pkgname}-${pkgver}/src
    cp fastaread.patch ${pkgname}-${pkgver}/scripts
    cd ${pkgname}-${pkgver}/src
    # patch makefile to use $(DESTDIR) and LDFLAGS
    patch -p1 < Makefile.patch
    cd ../scripts
    # Slighly more robust method to obtain taxid of fasta files
    patch -p1 < fastaread.patch  
}

build() {
    cd ${pkgname}-${pkgver}/src
    export KRAKEN2_DIR=/usr/lib/kraken2
    make

}

package() {
  cd ${pkgname}-${pkgver}/src
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/usr/lib/kraken2
    install -d ${pkgdir}/usr/share/${pkgname}
    make DESTDIR="${pkgdir}"/ install
    cd ..
    # copy kraken2 scripts to appropriate location using modified commands from 'install_kraken2.sh'
    export KRAKEN2_DIR=${pkgdir}/usr/lib/kraken2
    for file in scripts/*
     do
        perl -pl -e 'BEGIN { while (@ARGV) { $_ = shift; ($k,$v) = split /=/, $_, 2; $H{$k} = $v } }'\
           -e 's/#####=(\w+)=#####/$H{$1}/g' \
           "KRAKEN2_DIR=/usr/lib/kraken2" "VERSION=${pkgver}" \
           < "$file" > "$KRAKEN2_DIR/$(basename $file)"
    if [ -x "$file" ]
     then
        chmod +x "$KRAKEN2_DIR/$(basename $file)"
    fi
    done
    cp $KRAKEN2_DIR/kraken2{,-build,-inspect} ${pkgdir}/usr/bin
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r data/ ${pkgdir}/usr/share/${pkgname}/

}            
