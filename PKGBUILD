# Maintainer: AlphaLynx <alphaLynx at alphalynx dot dev>

pkgname=python-borgstore
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc='A experimental key/value store implementation, supporting multiple backends'
arch=(any)
url="https://github.com/borgbackup/$_name"
license=(BSD-3-Clause)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-setuptools-scm)
checkdepends=(python-pytest)
optdepends=('python-requests: REST and rclone backends'
            'python-boto3: S3 backend'
            'python-paramiko: sftp backend')
source=("git+$url.git#tag=$pkgver?signed")
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>
b2sums=('a3f3cbc0459068a25c09a10a5894bc64bb4319c0538af6d05b65fd22c04bdfff04eac71705c245d9c8d65662cf06ecc9cd7dfe8fb8795931188e22de04f5c091')

build() {
    cd $_name
    python -m build --wheel --no-isolation
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
    install -Dm644 CHANGES.rst -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}
