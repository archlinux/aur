# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Wu Junyu <wu DOT junyu DOT aur AT outlook DOT com>

pkgname=mopac
pkgver=23.2.2
pkgrel=1
pkgdesc='Molecular Orbital PACkage'
arch=(x86_64)
url='https://github.com/openmopac/mopac'
license=(Apache-2.0)
depends=(blas lapack)
makedepends=(gcc-fortran cmake)
checkdepends=(python python-numpy)
provides=(mopac)
replaces=(mopac7)
conflicts=(mopac7)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d64525fa4ae709b214ecbd5981b7e8a2928e2f1a91d85a253e8dbd04616e14cd')

build(){
    cd "$pkgname-$pkgver"
    # if FFLAGS is not set, enable -O2 optimization
    if ! [[ -v FFLAGS ]]; then
      FFLAGS=-O2
    fi
    local options=(
      -DCMAKE_BUILD_TYPE=None
      -DCMAKE_INSTALL_PREFIX=/usr
      -DCMAKE_SKIP_INSTALL_RPATH=TRUE
      -DF2003_INTRINSICS=TRUE
    )
    cmake -S. -Bbuild "${options[@]}"
    cmake --build build
}

check(){
    cd "$pkgname-$pkgver"
    ctest --test-dir build --output-on-failure
}

package(){
    cd "$pkgname-$pkgver"
    cmake --install build --prefix "$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
