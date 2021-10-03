# Maintainer: Feakster <feakster at posteo dot eu>

### Notes ###
# - Downloads: https://biobank.ndph.ox.ac.uk/showcase/download.cgi

### Info ###
pkgname=ukbprep-bin
_pkgname=${pkgname%-bin}
pkgver=20211003
pkgrel=1
pkgdesc='UK Biobank file handlers'
arch=(x86_64)
url='https://biobank.ndph.ox.ac.uk'
_url_util="$url/showcase/util"
license=('unknown')
optdepends=('ukbprep-docs: documentation to help getting started accessing UK Biobank data')
provides=('ukbprep' 'gfetch' 'ukbconv' 'ukbfetch' 'ukblink' 'ukbmd5' 'ukbunpack')
source=(
    "encoding-${pkgver}.ukb::$_url_util/encoding.ukb"
    "gfetch_linkset-${pkgver}.tar::$_url_util/gfetch_linkset.tar"
    "ukbconv-${pkgver}::$_url_util/ukbconv"
    "ukbfetch_linkset-${pkgver}.tar::$_url_util/ukbfetch_linkset.tar"
    "ukblink_linkset-${pkgver}.tar::$_url_util/ukblink_linkset.tar"
    "ukbmd5-${pkgver}::$_url_util/ukbmd5"
    "ukbunpack-${pkgver}::$_url_util/ukbunpack"
)
noextract=(
    gfetch_linkset-${pkgver}.tar
    ukbfetch_linkset-${pkgver}.tar
    ukblink_linkset-${pkgver}.tar
)
md5sums=(
    '420c5da64be38d32735c9bfb75098a21'
    '9530c628fa41c9e3fe7441ac63d9ab84'
    '06b5b39ab608a093b1dd264e27280316'
    '3499b767a6809f96f446d6db28665115'
    '9b309b581f435a08e5482e03ef07fea7'
    '6412007ab74054bfcde0a16e781d84e8'
    '78397002e55183feb4ebf62cbca3be3f'
)

### Prepare ###
prepare() {
    echo 'Renaming Source Binaries...'
    for ukb in ukbconv ukbmd5 ukbunpack
    do
        mv ${ukb}-${pkgver} ${ukb}
    done

    echo 'Extracting Source Archives...'
    for ukb in gfetch ukbfetch ukblink
    do
        mkdir -p "$srcdir"/${ukb}_linkset
        tar -xf "$srcdir"/${ukb}_linkset-${pkgver}.tar -C "$srcdir"/${ukb}_linkset
    done

    echo 'Patching Makefiles...'
    for ukb in gfetch ukbfetch ukblink
    do
        cd "$srcdir/${ukb}_linkset"
        sed -i 's/^CXX=.*/CXX=g++ -no-pie/' Makefile
    done
}

### Build ###
build() {
    for ukb in gfetch ukbfetch ukblink
    do
        cd "$srcdir/${ukb}_linkset"
        make $ukb_bin
        mv "$srcdir/${ukb}_linkset/$ukb" "$srcdir"
    done
}

### Package ###
package() {
    ## Change Directory ##
    cd "$srcdir"

    ## Binaries ##
    install -Dm755 gfetch ukbconv ukbfetch ukblink ukbmd5 ukbunpack -t "$pkgdir"/usr/bin
    ln -fs /usr/bin/gfetch "$pkgdir"/usr/bin/ukbgfetch

    ## Encoding File ##
    install -dm755 "$pkgdir"/usr/share/$_pkgname
    install -m644 encoding-${pkgver}.ukb "$pkgdir"/usr/share/$_pkgname/encoding.ukb
}
