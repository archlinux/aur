# Maintainer: svdev <sergio at svcdev dot com>

pkgname=dexbot
pkgver=0.17.8.r0.ga2ec28b
pkgrel=1
pkgdesc="Trading bot for the DEX (BitShares)"
arch=(any)
url="https://dexbot.info"
license=("MIT")
depends=('python>=3' 'python-setuptools' 'python-pip')
makedepends=('git')
source=("git+git://github.com/Codaone/DEXBot.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/dexbot"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/dexbot"
    python3 -m pip install -r requirements.txt
    python3 -m pip install bitshares uptick>=0.1.4 click sqlalchemy appdirs ruamel.yaml>=0.15.37 --user
    python3 setup.py build
    cp -R $srcdir/$pkgname/$pkgname/views/ui/*.ui $srcdir/$pkgname/build/lib/$pkgname/views/ui/
    python setup.py bdist_egg
}

package() {
    cd "$srcdir/dexbot"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
    cp -R $srcdir/$pkgname/dist/dexbot*.egg "$pkgdir/usr/lib/python3.6/site-packages/"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
