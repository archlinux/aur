# Maintainer: AlphaLynx <alphaLynx at alphalynx dot dev>

pkgname=python-borgstore
_name=${pkgname#python-}
pkgver=0.5.3
pkgrel=1
pkgdesc='A key/value store implementation supporting multiple backends'
arch=(any)
url="https://github.com/borgbackup/$_name"
license=(BSD-3-Clause)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-setuptools-scm
             python-sphinx)
checkdepends=(python-pytest)
optdepends=('python-requests: REST and rclone backends'
            'python-boto3: S3 backend'
            'python-paramiko: sftp backend')
source=(git+$url.git#tag=$pkgver?signed)
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>
b2sums=('a338bfcd985ccc18c9ebeda675f4f01f33ad4cd908b5c28ca7de1e8e0577461718955bfb7aeb0e374195368c0dfa6509fb1e9eb39b88ec50c976003a2e5e1497')

build() {
    cd $_name
    python -m build --wheel --no-isolation
    python -m venv --system-site-packages docs-env
    docs-env/bin/python -m installer dist/*.whl
    docs-env/bin/python -m sphinx -b html -d docs/_build/doctrees docs docs/_build/html
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -P -m pytest
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cp -r docs/_build/html "$pkgdir/usr/share/doc/$pkgname/html"
    install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}
