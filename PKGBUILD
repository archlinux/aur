# Maintainer: Feakster <feakster at posteo dot eu>

pkgname=ukbprep-bin
pkgver=20201213
pkgrel=2
pkgdesc='UK Biobank file handlers'
arch=('x86_64')
url='https://biobank.ndph.ox.ac.uk/showcase/download.cgi'
_url_util="${url/download.cgi/util}"
license=('unknown')
makedepends=(gcc sed)
provides=(ukbprep gfetch ukbconv ukbfetch ukblink ukbmd5 ukbunpack)
source=(
    "encoding.ukb::$_url_util/encoding.ukb"
    "gfetch_linkset.tar::$_url_util/gfetch_linkset.tar"
    "ukbconv::$_url_util/ukbconv"
    "ukbfetch_linkset.tar::$_url_util/ukbfetch_linkset.tar"
    "ukblink_linkset.tar::$_url_util/ukblink_linkset.tar"
    "ukbmd5::$_url_util/ukbmd5"
    "ukbunpack::$_url_util/ukbunpack"
)
noextract=(
    gfetch_linkset.tar
    ukbfetch_linkset.tar
    ukblink_linkset.tar
)
md5sums=(
    '2c59749f6f1296dcf220139d3c547692' # encoding.ukb
    '9530c628fa41c9e3fe7441ac63d9ab84' # gfetch_linkset.tar
    '06b5b39ab608a093b1dd264e27280316' # ukbconv
    '3499b767a6809f96f446d6db28665115' # ukbfetch_linkset.tar
    '9b309b581f435a08e5482e03ef07fea7' # ukblink_linkset.tar
    '6412007ab74054bfcde0a16e781d84e8' # ukbmd5
    '78397002e55183feb4ebf62cbca3be3f' # ukbunpack
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
    cd "$srcdir"
    install -Dm755 gfetch ukbconv ukbfetch ukblink ukbmd5 ukbunpack -t "$pkgdir/usr/bin/"
    ln -s "$pkgdir/usr/bin/gfetch" "$pkgdir/usr/bin/ukbgfetch"
    install -Dm755 encoding.ukb "$pkgdir/var/lib/ukbprep/encoding/encoding.ukb"
}
