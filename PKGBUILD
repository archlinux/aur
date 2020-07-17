# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=dcos-cli
pkgname=(dcos-cli python-dcos)
pkgver=1.1.3
pkgrel=1
pkgdesc="DC/OS Command Line Interface"
arch=(any)
url="https://github.com/dcos/dcos-cli"
license=('EPL')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver/$pkgbase-$pkgver.tar.gz")

prepare() {
    cd "$srcdir"/$pkgbase-$pkgver
    sed "s/SNAPSHOT/$pkgver/" -i dcos/__init__.py cli/dcoscli/__init__.py
    sed -r "s/'(jsonschema|pypng|pkginfo|gitpython)(==|<|>).*',/'\1',/" -i setup.py cli/setup.py
}

build() {
    cd "$srcdir"/$pkgbase-$pkgver
    python setup.py build
    cd cli
    python setup.py build
}

package_dcos-cli() {
    depends=('python-dcos' 'python-docopt' 'python-pkginfo'
             'python-rollbar' 'python-toml' 'python-virtualenv')
    cd "$srcdir"/$pkgbase-$pkgver/cli
    python setup.py install -O1 --skip-build --root="$pkgdir"
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}

package_python-dcos() {
    depends=('python-jsonschema' 'python-pager' 'python-portalocker'
             'python-prettytable' 'python-pygments' 'python-pypng'
             'python-pystache' 'python-requests' 'python-six' 'python-toml' 'python-gitpython')
    cd "$srcdir"/$pkgbase-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('cc423272e08a15d30e13c60b2245350c0b7d027649a6a01d44a58596a5ed8b20')
