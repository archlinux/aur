# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>
# Contributor: Adam Hose <adis@blad.is>

pkgname=python-iptables-git
pkgver=1.0.0.r3.g18d326d
pkgrel=1
pkgdesc='Python bindings for iptables'
depends=('python' 'iptables')
optdepends=()
makedepends=('git' 'python-setuptools')
arch=('x86_64' 'i686')
url='https://github.com/mwhudson/python-iptables'
license=('Apache')
provides=('python-iptables')
conflicts=('python-iptables')
replaces=('python-iptables')
options=(!emptydirs)
source=("$pkgname"::'git+https://github.com/mwhudson/python-iptables#branch=glibc-2.32'
        'python-iptables.conf')
sha256sums=('SKIP'
            '4d02d68c286aa809b3eb6e7ef5d4a326589d4f222c49603f2212bc097d972b02')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

check() {
    cd "$srcdir/$pkgname"
    python setup.py check
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    install -Dm 644 "$srcdir/python-iptables.conf" -t "$pkgdir/etc/ld.so.conf.d"
}

# vim: set sw=4 ts=4 et:
