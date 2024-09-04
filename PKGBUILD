# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Dino Morelli <dino@ui3.info>

pkgname=hlint-static-git
pkgver=3.8.r57.g2a789a94
pkgrel=1
pkgdesc='Haskell source code suggestions'
arch=('x86_64')
url="https://github.com/ndmitchell/hlint"
license=('LicenseRef-BSD-3-Clause')
makedepends=('git' 'cabal-install')
optdepends=('haskell-apply-refact: automatically apply suggested refactorings')
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
    cabal update
}

build() {
    cd "$pkgname"
    cabal configure --prefix=/usr --docdir=/usr/share/doc/$pkgname
    cabal build
}

check() {
    cd "$pkgname"
    cabal run -- hlint --test
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    cabal install --install-method=copy --installdir "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
