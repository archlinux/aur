# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>
# Contributor: Adam Hose <adis@blad.is>

pkgname=python-iptables-git
pkgdesc='Python bindings for iptables'
url='https://github.com/ldx/python-iptables'
pkgver=1.0.1.r3.g5bb75df
pkgrel=1
arch=('any')
depends=('python' 'iptables')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
license=('Apache')
provides=('python-iptables')
conflicts=('python-iptables')
replaces=('python-iptables')
options=(!emptydirs)
source=("$pkgname"::'git+https://github.com/ldx/python-iptables'
        'python-iptables.conf')
sha256sums=('SKIP'
            '4d02d68c286aa809b3eb6e7ef5d4a326589d4f222c49603f2212bc097d972b02')

pkgver() {
    cd "$srcdir/$pkgname"
    git clean -xdf
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer \
        --destdir="$pkgdir" \
        --prefix=/usr \
        --compile-bytecode=1 \
        dist/*.whl
    install -Dm 644 "$srcdir/python-iptables.conf" -t "$pkgdir/etc/ld.so.conf.d"
}

# vim: set sw=4 ts=4 et:
