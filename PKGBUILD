# Maintainer: svdev <sergio at svcdev dot com>

pkgname=dexbot
pkgver=0.1.12.r2.g871137e
pkgrel=1
pkgdesc="Trading bot for the DEX (BitShares)"
arch=(any)
url="https://dexbot.info"
license=("MIT")
depends=('python>=3' 'python-setuptools' 'python-pip' 'python-pyqt5' )
makedepends=('git')
source=("git+git://github.com/svdev/dexbot.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/dexbot"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/dexbot"

    PIP_CONFIG_FILE=/dev/null \
        python3 -m pip install --isolated --root="$srcdir/$pkgname/dist" --ignore-installed --no-deps \
            bitshares uptick>=0.1.4 click sqlalchemy appdirs

}

package() {
    cd "$srcdir/dexbot"

    mkdir -p "$pkgdir/usr/lib/python3.6/site-packages"

    PYTHONPATH="$pkgdir/usr/lib/python3.6/site-packages" \
        python3 setup.py install --root="$pkgdir/"

    cp -R $srcdir/$pkgname/dist/usr/lib/python3.6/site-packages/* "$pkgdir/usr/lib/python3.6/site-packages/"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

