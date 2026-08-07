# Maintainer: AlphaLynx <alphaLynx at alphalynx dot dev>

pkgname=python-borgstore
_name=${pkgname#python-}
pkgver=0.6.0
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
b2sums=('987824fd2336ed4e2e948e56fd84b8537f3db2db32da1a4ebe2f25785883c3e18314c918a14839b97af2c0feb627e2bc3c6563dd9428bd2ec3b0d389b7581f05')

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
