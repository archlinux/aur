# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.16
pkgrel=1
pkgdesc="A full-featured command-line IRC-like XMPP (Jabber) client"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://poez.io"
license=('GPL-3.0-or-later')
depends=('python' 'python-slixmpp' 'python-setuptools')
makedepends=('python-sphinx')
source=("https://codeberg.org/poezio/poezio/archive/v${pkgver}.tar.gz")
optdepends=('poezio-omemo: OMEMO plugin'
            'python-aiohttp: file upload'
            'python-pyinotify: Autoaway with screen plugin (also works with tmux)'
            'figlet: ASCII art plugin')

sha256sums=('c473de4625ecff39ff835d6b65a02e6a13007762c9d543e41f1f428dc5289083')
build() {
    cd "$pkgname"
    rm -f dist/*.whl
    sphinx-build -b man doc/source build/sphinx/man
    sphinx-build doc/source build/sphinx/html
    # TODO: remove on next poezio release
    sed -i '/sphinx/d' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
