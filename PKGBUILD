# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.1.2
pkgrel=1
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-attoparsec' 'haskell-dns' 'haskell-iproute' 'haskell-network'
         'haskell-optparse-applicative' 'haskell-streaming-commons' 'haskell-unordered-containers')
makedepends=('ghc' 'haskell-hspec')
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('052fd5c47f59bc77ac30364c4d1ba4397ab9c5fface61b3b1db0fdbb4a28f3ca7d1e074227efbc01d17f8b32556cd040470a1cfb303fe4f152f3a7b9763536af')

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

    install -Dm644 "systemd/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
