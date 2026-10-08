# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself.

pkgname=phycfg
_tag=3bb305fe660dedc3daf3ec8654622e1d60cc203d
pkgver=20260410
pkgrel=1
pkgdesc="Model rooted phylogenetic trees with stochastic context-free grammar"
arch=('x86_64')
url="https://github.com/lh3/phycfg"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('d755d3a8393e6f1e1edf1e09a4152596abcc6fa725a8c4172b74d4cca0a87b38')

build() {
    cd "$srcdir/$pkgname-$_tag"
    # upstream's -std=c99 hides strdup() and friends; build as GNU C instead
    make CFLAGS="$CFLAGS -std=gnu11"
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 phycfg "$pkgdir/usr/bin/phycfg"
    # upstream ships no LICENSE file; the grant is the MIT block in kseq.h
    awk 'NR==1,/^\*\//' kseq.h > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
