# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.8.3
pkgrel=1
pkgdesc="An XMPP library written for Python 3.7+ (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://lab.louiz.org/poezio/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp' 'python-typing_extensions')
makedepends=('git' 'cython')
optdepends=('python-emoji: For compliant XEP-0444 support')
options=(!emptydirs)

source=("https://lab.louiz.org/poezio/${_pkgbase}/-/archive/slix-${pkgver}/${_pkgbase}-slix-${pkgver}.tar.gz")
sha512sums=('e39cfc23349dee8a74dfccc83d2bc70d8f082e5488b1a1a84ded080c241a3b17c0f3b2672ed57ae91787dbf8293f268e6efa66b59791682dba4e1ad333551940')

build() {
    cd $_pkgbase-slix-$pkgver
    python setup.py build
}

package() {
    cd $_pkgbase-slix-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1

    if ! test -f "$pkgdir"/usr/lib/python3.*/site-packages/slixmpp/stringprep.*.so; then
        msg 'stringprep module failed to build!'
        msg 'Check that cython is correctly installed and working.'
        exit 1
    fi

    # This one is only used when Cython is unavailable, or on pypy3.
    rm "$pkgdir"/usr/lib/python3.*/site-packages/slixmpp/stringprep.py
}
