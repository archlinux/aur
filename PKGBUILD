# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=dcos-cli
pkgname=(dcos-cli python-dcos)
pkgver=0.5.4
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
    rm "$pkgdir"/usr/bin/env-setup
}

package_python-dcos() {
    depends=('python-jsonschema' 'python-pager' 'python-portalocker'
             'python-prettytable' 'python-pygments' 'python-pypng'
             'python-pystache' 'python-requests' 'python-six' 'python-toml' 'python-gitpython')
    cd "$srcdir"/$pkgbase-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('f82e0bb22aa011d6b095c63e54dec4524a82110d2166f71945b3f73a4e43a197')
