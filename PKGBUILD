# Maintainer: AlphaLynx <alphaLynx at alphalynx dot dev>

pkgname=python-borgstore
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc='A key/value store implementation supporting multiple backends'
arch=(any)
url=https://github.com/borgbackup/$_name
license=(BSD-3-Clause)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-setuptools-scm
             python-sphinx)
checkdepends=(python-pytest
              python-paramiko)
optdepends=('python-requests: REST and rclone backends'
            'python-boto3: S3 backend'
            'python-paramiko: sftp backend'
            'python-blake3: blake3 hash algorithm support')
source=(git+$url.git#tag=$pkgver?signed)
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>
b2sums=('7fd374842a2bc695e60c8ab1886a022790f7b018313b1958711e2cae1fa76759d74d96b19e7dca8db1c20a6eec759b64fe1066c0a399357ddf41f2d945b2b39c')

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
