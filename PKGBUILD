# Maintainer: AlphaLynx <alphaLynx at alphalynx dot dev>

pkgname=python-borgstore
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc='A experimental key/value store implementation, supporting multiple backends'
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
source=("git+$url.git#tag=$pkgver?signed")
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>
b2sums=('128ab12c4a9fbda1e972629783619ef90b5a2041f2d9eeda964e3b4b294f1da03e00c91663a5ae42ada15b12bc94f58a316ea613fa394217ad8a1b0a772dc3d3')

build() {
    cd $_name
    python -m build --wheel --no-isolation
    sphinx-build -b html -d /tmp/sphinx-doctrees docs docs/_build/html
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
