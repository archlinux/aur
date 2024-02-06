# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.8.5
pkgrel=2
pkgdesc="An XMPP library written for Python 3.7+ (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/poezio/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp' 'python-typing_extensions')
makedepends=('git' 'cython')
optdepends=('python-emoji: For compliant XEP-0444 support')
options=(!emptydirs)

source=("https://codeberg.org/poezio/${_pkgbase}/archive/slix-${pkgver}.tar.gz")
sha512sums=('7ea320eafd1c0051f805462a9007f6c2faac6577a2205279a7c1a81fd72629d90173655720ded0be05952d73e42b0a70108f728a2bf4e52b39bde33a6a7d2043')

build() {
    cd $_pkgbase
    python setup.py build
}

package() {
    cd $_pkgbase
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1

    if ! test -f "$pkgdir"/usr/lib/python3.*/site-packages/slixmpp/stringprep.*.so; then
        msg 'stringprep module failed to build!'
        msg 'Check that cython is correctly installed and working.'
        exit 1
    fi

    # This one is only used when Cython is unavailable, or on pypy3.
    rm "$pkgdir"/usr/lib/python3.*/site-packages/slixmpp/stringprep.py
}
