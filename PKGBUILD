# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=gitit
pkgver=0.12.2.1
pkgrel=1
pkgdesc="A wiki backed by a git, darcs, or mercurial filestore"
arch=(i686 x86_64)
url=https://hackage.haskell.org/package/$pkgname
license=(GPL)
depends=(gmp zlib)
optdepends=("git: git support" "mercurial: mercurial support")
makedepends=(ncurses5-compat-libs stack)
source=(https://github.com/jgm/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('017cd716c8844036600e8aee858861ac41d8ef3c1ab02b43cd50532e4d5472b9')

build() {
    if [ `df -P "$srcdir" | awk 'NR==2 {print $4}'` -lt 8388608 ]; then
        echo >&2 "Error: need at least 8GiB of space in $srcdir"
        return 1
    fi
    cd "$srcdir/$pkgname-$pkgver"
    stack --stack-root "$srcdir/.stack" --install-ghc build --ghc-options=-rtsopts
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    stack --stack-root "$srcdir/.stack" install --local-bin-path "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
