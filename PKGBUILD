# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Dino Morelli <dino@ui3.info>

pkgname=hlint-static-git
pkgver=3.3.4.r34.g918d3b99
pkgrel=2
pkgdesc='Haskell source code suggestions'
arch=('x86_64')
url="https://github.com/ndmitchell/hlint"
license=('BSD')
makedepends=('git' 'stack')
depends=('gmp')
provides=('hlint')
conflicts=('hlint' 'hlint-bin')
source=("${pkgname}::git+${url}" ver-bump.patch)
sha256sums=('SKIP'
            '9a90d8aa9ccbc7668a6891c260a9038748954525ce36a7bf3d77f6ca4b922f67')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    patch --forward --strip=1 --input="${srcdir}/ver-bump.patch"
}

check() {
    cd "$pkgname"

    stack test
}

build() {
    cd "$pkgname"

    stack setup
    stack build \
        --install-ghc \
        --ghc-options='-fdiagnostics-color=always' \
        --fast
}

package() {
    cd "$srcdir/$pkgname"
    stack install --local-bin-path "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
