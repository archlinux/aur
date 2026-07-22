# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fakeldap
pkgver=0.6.6
pkgrel=1
pkgdesc="LDAPObject implementation for mocking LDAP servers"
arch=(any)
url="https://github.com/zulip/fakeldap"
license=(BSD-3-Clause)
depends=(python python-ldap)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-nose python-coverage)
source=("$pkgname-0.6.5.tar.gz::$url/archive/0.6.5.tar.gz"
        "$pkgname-$pkgver.diff::$url/compare/0.6.5..eeaf589b0a342665a50f83b9fca40e8a6bd358de.diff"
        "LICENSE-BSD3")
sha256sums=('c64212ef797c2c2bc444e59b2a2dd8524a9703fbb1f8cfb9e5dd53671dea552c'
            '0115452c2044885b49c1280b7261caca4a6935b8e27e3ba9e04f6dc23ad47282'
            '53f2d4dbeedeccd2cba3179e9f38740aeee5490750de976412ee6a2ad6bd5374')

prepare() {
    ## TODO: remove once upstream cuts a proper release
    mv "fakeldap-0.6.5" "fakeldap-$pkgver"
    patch -p1 -d "fakeldap-$pkgver" < "$srcdir/$pkgname-$pkgver.diff"
}

build() {
    cd "fakeldap-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "fakeldap-$pkgver"
    nosetests
}

package() {
    cd "fakeldap-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 "$srcdir/LICENSE-BSD3" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
