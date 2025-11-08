pkgname=kraken2
pkgver=2.17
# _pkgver=$(echo "$pkgver" | sed 's/\.//2')
pkgrel=1
pkgdesc="Improved vesion of kraken ultrafast metagenomic sequence classification tool. https://doi.org/10.1186/s13059-019-1891-0"
arch=('i686' 'x86_64')
url="https://github.com/DerrickWood/kraken2"
license=('MIT')
depends=('glibc' 'gcc-libs' 'blast+' 'perl' 'bash' 'python' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DerrickWood/kraken2/archive/refs/tags/v${pkgver}.tar.gz"
        'Makefile.patch'
        )
sha256sums=('69380e7c22e314245cbe61b2a69d6719c95edadd80ad171577c1e681927c7b88'
            '61ca474b78d8594c9e61e4541d854f8d797aa18bd5fa5e605cf7710d85fdafc7')

prepare() {
    cd ${pkgname}-${pkgver}
    # patch makefile to use $(DESTDIR) and LDFLAGS
    patch -p1 < ${srcdir}/Makefile.patch
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

