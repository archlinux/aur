# Maintainer: Feakster <feakster at posteo dot eu>

pkgname=ukbprep-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="UK Biobank file handlers"
arch=('x86_64')
url="https://biobank.ndph.ox.ac.uk/showcase/download.cgi"
license=('unknown')
makedepends=(gcc sed)
provides=(gfetch ukbconv ukbfetch ukblink ukbmd5 ukbunpack)
source=(
    gfetch_linkset.tar::https://biobank.ndph.ox.ac.uk/showcase/showcase/util/gfetch_linkset.tar
    ukbconv::https://biobank.ndph.ox.ac.uk/showcase/util/ukbconv
    ukbfetch_linkset.tar::https://biobank.ndph.ox.ac.uk/showcase/showcase/util/ukbfetch_linkset.tar
    ukblink_linkset.tar::https://biobank.ndph.ox.ac.uk/showcase/showcase/util/ukblink_linkset.tar
    ukbmd5::https://biobank.ndph.ox.ac.uk/showcase/util/ukbmd5
    ukbunpack::https://biobank.ndph.ox.ac.uk/showcase/util/ukbunpack
)
noextract=(
    gfetch_linkset.tar
    ukbfetch_linkset.tar
    ukblink_linkset.tar
)
md5sums=(
    '9530c628fa41c9e3fe7441ac63d9ab84'
    '06b5b39ab608a093b1dd264e27280316'
    '3499b767a6809f96f446d6db28665115'
    '9b309b581f435a08e5482e03ef07fea7'
    '6412007ab74054bfcde0a16e781d84e8'
    '78397002e55183feb4ebf62cbca3be3f'
)

prepare() {
    echo 'Extracting Source Files...'
    for ukb_bin in gfetch ukbfetch ukblink
    do
        mkdir -p "$srcdir/${ukb_bin}_linkset"
        tar -xf "$srcdir/${ukb_bin}_linkset.tar" -C "$srcdir/${ukb_bin}_linkset"
    done

    echo 'Patching Makefiles...'
    for ukb_bin in gfetch ukbfetch ukblink
    do
        cd "$srcdir/${ukb_bin}_linkset"
        sed -i 's/^CXX=.*/CXX=g++ -no-pie/' Makefile
    done
}

build() {
    for ukb_bin in gfetch ukbfetch ukblink
    do
        cd "$srcdir/${ukb_bin}_linkset"
        make $ukb_bin
        mv "$srcdir/${ukb_bin}_linkset/$ukb_bin" "$srcdir"
    done
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cd "$srcdir"
    chmod 755 gfetch ukbconv ukbfetch ukblink ukbmd5 ukbunpack
    cp -L gfetch ukbconv ukbfetch ukblink ukbmd5 ukbunpack "$pkgdir/usr/bin"
}
