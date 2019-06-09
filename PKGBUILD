# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.1.0
pkgrel=1
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-attoparsec' 'haskell-dns' 'haskell-iproute' 'haskell-network' 'haskell-optparse-applicative' 'haskell-streaming-commons' 'haskell-unordered-containers')
makedepends=('ghc' 'haskell-hspec')
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "dprox.service")
sha512sums=('3573683851e2451061842de95b6847160f2d967648aa0c47ae0b57600a5012f1f6357b0a91343a1dcb4d0aca1b883086da02d6d113b56de8e5aef2c971158c58'
            '41c31e1f575175a06c541a1bb730af90a06a151ac718fe6ccac64baf3043527a4a13124fadbe3b9a20b8760f211320de210cb5596dad57bed8c0d01574d4af06')

prepare() {
    cd $pkgname-$pkgver
}

build() {
    cd $pkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --enable-tests --datasubdir="$pkgname" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
}

check() {
    cd $pkgname-$pkgver
    runhaskell Setup test
}

package() {
    cd $pkgname-$pkgver

    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgdir}/usr/share/doc/"

    install -Dm644 "$srcdir/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
