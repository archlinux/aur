# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.8.2
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
sha512sums=('4fc9d99f7930d4eae836a745e9061dd850949c24af4c95fadc30a5b66b7bca3bc499d1cb4ef20969117003aa104d929bcfc6a028b885b078d148a0a0f2d12b99')

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
