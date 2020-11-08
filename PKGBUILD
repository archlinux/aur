# Maintainer: Jaan Toots <jaan@jaantoots.org>
pkgname=goobook
pkgver=3.5
pkgrel=1
pkgdesc="Access your Google contacts from the command line"
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL3')
depends=('python-google-api-python-client'
         'python-simplejson'
         'python-oauth2client'
         'python-xdg')
makedepends=('python-setuptools' 'python-docutils')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1b7d5a176d0d1e8705f6dcd5056ec356d660bb2e3a3a95ad7cd416c6c0442968')

prepare() {
    cd "$pkgname-$pkgver"
    # Fix to use pyxdg (in extra) instead of xdg
    sed -i -E \
        -e '/^import/s/xdg/\0.BaseDirectory/' \
        -e 's/\bxdg.(\w+_HOME)/pathlib.Path(xdg.BaseDirectory.\L\1)/' \
        -e 's/\bxdg.(\w+_DIRS)/[pathlib.Path(x) for x in xdg.BaseDirectory.\L\1]/' \
        goobook/config.py
}

build() {
    cd "$pkgname-$pkgver"
    rst2man.py --strict goobook.1.rst goobook.1
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.rst" "CHANGES.rst"
}
