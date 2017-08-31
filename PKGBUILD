# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=gitit
pkgver=0.12.2.1
pkgrel=2
pkgdesc="A wiki backed by a git, darcs, or mercurial filestore"
arch=(i686 x86_64)
url=https://hackage.haskell.org/package/gitit
license=(GPL)
depends=(gmp zlib)
optdepends=("git: git support" "mercurial: mercurial support")
makedepends=(stack)
source=(https://github.com/jgm/gitit/archive/$pkgver.tar.gz)
sha256sums=('017cd716c8844036600e8aee858861ac41d8ef3c1ab02b43cd50532e4d5472b9')

build() {
    if [ `df -P "$srcdir" | awk 'NR==2 {print $4}'` -lt 8388608 ]; then
        echo >&2 "Error: need >= 8GiB in $srcdir; set BUILDDIR to something else"
        return 1
    fi
    cd "$srcdir/gitit-$pkgver"
    stack --stack-root "$srcdir/.stack" --install-ghc build --ghc-options=-rtsopts
}

package() {
    cd "$srcdir/gitit-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    PATH=$pkgdir/usr/bin:$PATH stack --stack-root "$srcdir/.stack" install --local-bin-path "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/gitit/LICENSE"
}
