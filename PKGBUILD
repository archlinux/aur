# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=dcos-cli
pkgname=(dcos-cli python-dcos)
pkgver=0.6.0
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

sha256sums=('26ceaf7ad8d49eab28c72edbea0ca48ca29c400503028fd1ad726cc217628cea')
