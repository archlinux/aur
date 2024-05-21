# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Dino Morelli <dino@ui3.info>

pkgname=hlint-static-git
pkgver=3.8.r22.g752baba9
pkgrel=1
pkgdesc='Haskell source code suggestions'
arch=('x86_64')
url="https://github.com/ndmitchell/hlint"
license=('LicenseRef-BSD-3-Clause')
makedepends=('git' 'stack')
depends=('gmp')
provides=('hlint')
conflicts=('hlint' 'hlint-bin')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"

    stack config set resolver lts-22.22 # ghc-9.6.5
}

build() {
    cd "$pkgname"

    stack build \
        --install-ghc \
        --ghc-options='-fdiagnostics-color=always' \
        --fast
}

check() {
    cd "$pkgname"

    stack test
}

package() {
    cd "$srcdir/$pkgname"
    stack install --local-bin-path "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
