# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: SplitFire (split7fire at yandex.ru)

_pkgname=freelan
pkgname="$_pkgname"-git
pkgver=r3862.1cf517bf
pkgrel=2
pkgdesc="Peer-to-peer, secure, easy-to-setup, multi-platform, highly-configurable VPN software"
arch=('any')
url="https://github.com/freelan-developers/freelan"
license=('GPL')
depends=('boost' 'curl' 'miniupnpc' 'openssl')
makedepends=('git' 'help2man' 'scons')
source=(git+https://github.com/freelan-developers/"$_pkgname".git
        fix-build.diff)
sha256sums=(SKIP SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    patch -p1 -i "$srcdir"/fix-build.diff
}

build() {
    cd "$srcdir/$_pkgname"
    scons apps --mode=release prefix="$pkgdir" bin_prefix="$pkgdir"/usr
    # scons samples  # build fails currently
}

package() {
    cd "$srcdir/$_pkgname"
    scons install --mode=release prefix="$pkgdir" bin_prefix="$pkgdir"/usr
}
