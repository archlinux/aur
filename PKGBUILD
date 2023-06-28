# Maintainer: Mattéo Delabre <aur.matteo@delab.re>
pkgname=entrez-direct
pkgver=19.2.20230324
pkgrel=3
pkgdesc='Entrez Direct - CLI utilities for accessing NCBI databases'
arch=('x86_64')
url='https://eutils.ncbi.nlm.nih.gov/'
license=('custom')
makedepends=(go)
install=entrez-direct.install
source=(
    "ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/$pkgver/edirect-$pkgver.tar.gz"
    einfo.wrapper
)
sha256sums=(
    'b707699b51e8251e299438e09d94c671c95bc9c714d96e30f94dc853bbcdf03c'
    SKIP
)

_libdir=/usr/lib/"$pkgname"
_basetools=(
    edict
    rchive
    transmute
    xtract
)
_fronttools=(
    efetch
    efilter
    einfo
    elink
    epost
    esearch
    esummary
    nquire
    rchive
    transmute
    xtract
)

prepare() {
    # Execute Bash scripts as from $_libdir
    for tool in "${_fronttools[@]}"; do
        sed -i "2i BASH_ARGV0=$_libdir/$tool" edirect/"$tool"
    done
}

build() {
    cd "edirect/cmd"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

    for tool in "${_basetools[@]}"; do
        go build -o "$tool".Linux "$tool.go"
    done
}

package() {
    mkdir -p "$pkgdir$_libdir" "$pkgdir"/usr/bin

    install -Dm755 -t "$pkgdir"/usr/bin einfo.wrapper

    cd "edirect"
    cp -R * "$pkgdir$_libdir"
    rm -r "$pkgdir$_libdir"/{cmd,eutils,README,readme.pdf}

    for tool in "${_basetools[@]}"; do
        install -Dm755 -t "$pkgdir$_libdir" cmd/"$tool".Linux
    done

    for tool in "${_fronttools[@]}"; do
        ln -st "$pkgdir"/usr/bin "$_libdir"/"$tool"
    done

    mv "$pkgdir"/usr/bin/einfo "$pkgdir"/usr/bin/einfo.ncbi
}
