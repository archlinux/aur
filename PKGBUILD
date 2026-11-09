# Maintainer: Fred Mitchell <fred.mitchell@atomlogik.de>
pkgname=swiss-army-knife
pkgver=1.2.0.0
pkgrel=2
pkgdesc="A collection of small but powerful command-line tools"
arch=('x86_64')
url="https://github.com/flajann2/swiss-army-knife"
license=('MIT')
# Haskell libraries are linked statically (needs ghc-static), so updates to
# Arch's dynamic ghc-libs can't break sak. C libraries stay dynamic: a fully
# static glibc binary crashes in getaddrinfo (NSS) once glibc is upgraded.
depends=('glibc' 'gmp' 'libffi' 'zlib')
makedepends=('ghc' 'ghc-static' 'cabal-install')
source=("$pkgname-$pkgver.tar.gz::https://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7d102c1382e67708c5b5818eabef8af14e455ead37d82e313bc40796fd4ee008')

prepare() {
    cd "$pkgname-$pkgver"
    # Remove any pinned compiler
    sed -i '/^with-compiler:/d' cabal.project 2>/dev/null || true
    # Pre-download dependencies (speeds up build)
    cabal update
    cabal build --only-dependencies -j$(nproc) --disable-executable-dynamic
}

build() {
    cd "$pkgname-$pkgver"
    cabal build -j$(nproc) --disable-executable-dynamic
}

check() {
    cd "$pkgname-$pkgver"
    # Fail the build if sak links any Haskell shared library: those vanish
    # or change ABI whenever Arch updates ghc-libs.
    local bin
    bin="$(cabal list-bin sak)"
    if ldd "$bin" | grep -q 'libHS'; then
        echo "ERROR: sak is dynamically linked against Haskell libraries:"
        ldd "$bin" | grep 'libHS'
        return 1
    fi
    # And it must not be fully static either (glibc NSS / DNS would break).
    if file "$bin" | grep -q 'statically linked'; then
        echo "ERROR: sak is fully static; DNS lookups would crash after a glibc update"
        return 1
    fi
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$(cabal list-bin sak)" "$pkgdir/usr/bin/sak"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
