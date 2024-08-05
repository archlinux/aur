# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-sushy-tools
pkgver=1.3.0
pkgrel=2
pkgdesc="A set of tools to support the development and test of the Sushy library"
arch=(any)
url="https://opendev.org/openstack/sushy-tools"
license=('Apache-2.0')
depends=('python'
         'python-flask'
         'python-requests'
         'python-tenacity'
         'python-ironic-lib'
         'libvirt-python'
         'python-munch'
         'python-werkzeug'
         'python-oslotest'
         'python-openstacksdk')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'tar')
checkdepends=('python-coverage'
              'python-stestr'
              'python-testtools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "tmp-include-templates.diff")
b2sums=('8713a22add7ad54a914a45be6220d672b33c0878374b3fc684507adafd5c9d785d27bbd8c2a3879b060d374dd27027b46fe17b4953eb15f5da75d9db0f65fc60'
        '57fbf27da5ae32170c30ff7ec8fd23783ff23639d54c694a356fe5137af45d1d2aa25069106b6fb104cfbfbaf5089a7ff060a30386aadb576e128bb9704f83c2')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
    cd "$pkgname-$pkgver"
    patch -uNp1 -i ../tmp-include-templates.diff || return 1
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    stestr run
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
