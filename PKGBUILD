# Maintainer: AlphaLynx <alphaLynx at alphalynx dot dev>

pkgname=python-borgstore
_name=${pkgname#python-}
pkgver=0.5.0
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
b2sums=('40d4739c9ce429ac047bfb3a65669fe5cff285a711f03d29967176b4a517abf9fd4df7b62ea56670b5f70570d21f66a8d72cacc2714fc4bedadc96de17fce75b')

build() {
    cd $_name
    python -m build --wheel --no-isolation
    sphinx-build -b html -d /tmp/sphinx-doctrees docs docs/_build/html
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cp -r docs/_build/html "$pkgdir/usr/share/doc/$pkgname/html"
    install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}
